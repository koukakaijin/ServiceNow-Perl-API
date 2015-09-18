# ======================================================================
#
# Copyright (C) 2009 Service-now.com
#
# ======================================================================

package ServiceNow::ITIL::RequestedItem;
use ServiceNow::GlideRecord;
use ServiceNow::ITIL::Task;

$VERSION = '1.00';
@ISA = (ServiceNow::ITIL::Task);

=pod

=head1 RequestedItem module

Service-now Perl API - RequestedItem perl module

=head1 Desciption

An object representation of an Requested Item in the Service-now platform.  Provides subroutines for querying, updating, and creating service catalog requested item. 

=head2 System Requirements

The Service-now Perl API requires Perl 5.8 with the following modules installed

  * SOAP::Lite (prerequisites http://soaplite.com/prereqs.html) 0.71 or later
  * Crypt::SSLeay
  * IO::Socket::SSL

=head1 Constructor

=head2 new

new(Configuration);

Example:

  $req_item = ServiceNow::ITIL::RequestedItem->new($CONFIG);

Takes a configuration object and manufactures an Requested Item object connected to the Service-now instance

=cut

sub new {
  my $class = shift; 
  my $me ={};
  $me->{'CONFIG'}  = shift;
  bless($me,$class);
  
  ServiceNow::GlideRecord->new($me->{'CONFIG'}, "sc_req_item", $me);
  return $me;
}

1;