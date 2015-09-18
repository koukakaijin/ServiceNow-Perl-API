# ======================================================================
#
# Copyright (C) 2009 Service-now.com
#
# ======================================================================

package ServiceNow::ITIL::Request;
use ServiceNow::GlideRecord;
use ServiceNow::ITIL::Task;

$VERSION = '1.00';
@ISA = (ServiceNow::ITIL::Task);

=pod

=head1 Request module

Service-now Perl API - Request perl module

=head1 Desciption

An object representation of an Request in the Service-now platform.  Provides subroutines for querying, updating, and creating service catalog requests. 

=head2 System Requirements

The Service-now Perl API requires Perl 5.8 with the following modules installed

  * SOAP::Lite (prerequisites http://soaplite.com/prereqs.html) 0.71 or later
  * Crypt::SSLeay
  * IO::Socket::SSL

=head1 Constructor

=head2 new

new(Configuration);

Example:

  $request = ServiceNow::ITIL::Request->new($CONFIG);

Takes a configuration object and manufactures an Request object connected to the Service-now instance

=cut

sub new {
  my $class = shift;
  my $me = {};
   
  $me->{'CONFIG'}  = shift;
  bless($me,$class);
  ServiceNow::GlideRecord->new($me->{'CONFIG'}, "sc_request", $me);
  return $me;
}

=head1 Subroutines

=head2 createRequest

createRequest(user);

Create a service request for the specified user

=cut

sub createRequest {
  my ($me,$user) = (shift,shift);
  $me->setValue('requested_for', $user);
  $me->insert();
  print $me->getValue('number');
  return $me->getValue('number');
}

1;