#!/usr/bin/perl
use 5.020;
use AnyEvent::Handle;
use AnyEvent::Socket;
use FindBin;

my $cfg = do $FindBin::Bin.'/main.conf' or die 'no main.conf';
#{
#      cards => {cardid => passwordline},
#      socket => {socket_command => passwordline },
#}


my $logined = 0;

my $cv = AE::cv;
my $fh;
for my $num (0..9) {
	my $name = "/dev/ttyUSB$num";
	next unless -r $name;
	open $fh, '+>', $name;
	last;
}

my $cardhdl; $cardhdl = new AnyEvent::Handle
  fh => $fh,
  on_error => sub {
    my ($hdl, $fatal, $msg) = @_;
    AE::log error => $msg;
    $hdl->destroy;
    $cv->send;
};
$cardhdl->push_read (line => \&process);


tcp_server '127.0.0.1', 1025, sub {
    my ($fh, $host, $port) = @_;
    say "socket client";
    my $hdl; $hdl = new AnyEvent::Handle fh => $fh,
      on_error => sub {
          my ($hdl, $fatal, $msg) = @_;
          AE::log error => $msg;
          $hdl->destroy;
          $cv->send;
      };
    $hdl->push_read (line => sub { processsock(@_, $hdl); undef $hdl; });
};



$cv->recv;



sub process {
  my ($hdl, $line) = @_;
  $cardhdl->push_read(line => \&process);
  next unless $line;
  say "got line <$line>";
  if ($line eq 'No card') {
      $logined = 0;
      say 'LOCK';
      say `DISPLAY=:0 gnome-screensaver-command -l`;
  } elsif (my $password = $cfg->{cards}->{$line}) {
      $logined = 1;
      say 'card used';
      say `DISPLAY=:0 gnome-screensaver-command -d && xdotool type $password && xdotool key Return`;
  } else {
      say "unknown card '$line'";
  }
}

sub processsock {
    my ($hdl, $line) = @_;
    say "got socket command <$line> $cfg->{socket}->{$line}   logined=$logined";
    my $password;
    if ($logined and $password = $cfg->{socket}->{$line}) {
        say "enter password for $line";
        say `xdotool type $password && xdotool key Return`;
    }
    $hdl->destroy;
}
