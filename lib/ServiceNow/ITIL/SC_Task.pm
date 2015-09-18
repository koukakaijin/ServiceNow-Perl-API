# ======================================================================
#
# Copyright (C) 2009 Service-now.com
#
# ======================================================================

package ServiceNow::ITIL::SC_Task;
use ServiceNow::GlideRecord;
use ServiceNow::ITIL::Task;

$VERSION = '1.00';
@ISA = (ServiceNow::ITIL::Task);

=pod

=head1 SC_Task module

Service-now Perl API - SC_Task perl module

=head1 Desciption

An object representation of an Service Request Task in the Service-now platform.  Provides subroutines for querying, updating, and creating sc_task. 

=head2 System Requirements

The Service-now Perl API requires Perl 5.8 with the following modules installed

  * SOAP::Lite (prerequisites http://soaplite.com/prereqs.html) 0.71 or later
  * Crypt::SSLeay
  * IO::Socket::SSL

=head1 Constructor

=head2 new

new(Configuration);

Example:

  $sc_task = ServiceNow::ITIL::RequestedItem->new($CONFIG);

Takes a configuration object and manufactures an Service Catalog Task object connected to the Service-now instance

=cut

sub new {
  my $class = shift; 
  my $config = shift;
  my $me = {};
  bless($me,$class);
  ServiceNow::GlideRecord->new($config, "sc_task",$me);
  return $me;
}

1;