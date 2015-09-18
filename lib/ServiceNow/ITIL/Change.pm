# ======================================================================
#
# Copyright (C) 2009 Service-now.com
#
# ======================================================================

package ServiceNow::ITIL::Change;
use ServiceNow::GlideRecord;
use ServiceNow::ITIL::Task;

$VERSION = '1.00';
@ISA = (ServiceNow::ITIL::Task);

=pod

=head1 Change module

Service-now Perl API - Change perl module

=head1 Desciption

An object representation of an Change in the Service-now platform.  Provides subroutines for querying, updating, and creating change requests. 

=head2 System Requirements

The Service-now Perl API requires Perl 5.8 with the following modules installed

  * SOAP::Lite (prerequisites http://soaplite.com/prereqs.html) 0.71 or later
  * Crypt::SSLeay
  * IO::Socket::SSL

=head1 Constructor

=head2 new

new(Configuration);

Example:

  $change = ServiceNow::ITIL::Change->new($CONFIG);

Takes a configuration object and manufactures an Change object connected to the Service-now instance

=cut

sub new {
  my $class = shift; 
  my $config = shift;
  my $me = {};
  
  bless($me,$class);
  ServiceNow::GlideRecord->new($config, "change_request", $me);
  return $me;
}

1;