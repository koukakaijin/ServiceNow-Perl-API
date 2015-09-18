# ======================================================================
#
# Copyright (C) 2009 Service-now.com
#
# ======================================================================

package ServiceNow::WS;
#use Data::Dumper;

$VERSION = '1.01';
my $RESULT;
my $TYPE;

=pod

=head1 WS module

Service-now Perl API - WS perl module

=head1 Desciption

An internal class used for masking the web service function calls.  Calls subroutines in Connection class for access

=head2 System Requirements

The Service-now Perl API requires Perl 5.8 with the following modules installed

  * SOAP::Lite (prerequisites http://soaplite.com/prereqs.html) 0.71 or later
  * Crypt::SSLeay
  * IO::Socket::SSL

=cut

sub new {
  my ($class, $CONFIG, $TARGET) = (shift, shift, shift);
  
  undef($RESULT);
  undef($TYPE);
  my $me  = {};

  $me->{'TARGET'} = $TARGET;
  $me->{$TARGET} = $CONFIG->getConnection($TARGET);
   
  $me->{$TARGET}->open();
  bless($me,$class);
  return $me;
}

sub _insert (\%) {
  my ($me, %hash) = (shift, %{(shift)});
  
  $TYPE = "insert";
  $RESULT = $me->{ $me->{'TARGET'}}->send($TYPE, \%hash);
  return $RESULT;
}

sub _getRecords {
  my ($me, %hash) = (shift, %{(shift)});
  
  $TYPE = "getRecords";
  $RESULT = $me->{ $me->{'TARGET'}}->send($TYPE, \%hash);
  
  # debugging dump
  #print Dumper($RESULT);
  
  return $RESULT;
}

sub _update {
  my ($me, $sysId,  %hash) = (shift, shift,%{(shift)});
  
  $hash{'sys_id'} = $sysId;
  $TYPE = "update";
  $RESULT = $me->{ $me->{'TARGET'}}->send($TYPE, \%hash);
  return $RESULT;
}

# not implemented

sub _get {
	
}

sub _getKeys {
	
}

# implemented by Daniel Hernandez Cassel

sub _delete {
  my ($me, $sysId) = (shift, shift);
  
  $hash{'sys_id'} = $sysId;
  $TYPE = "deleteRecord";
  $RESULT = $me->{ $me->{'TARGET'}}->send($TYPE, \%hash);
  return $RESULT;
}

1;