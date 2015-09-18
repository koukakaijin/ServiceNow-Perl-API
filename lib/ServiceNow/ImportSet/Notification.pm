# ======================================================================
#
# Copyright (C) 2009 Service-now.com
#
# ======================================================================

package ServiceNow::ImportSet::Notification;
use ServiceNow::GlideRecord;

$VERSION = '1.00';
@ISA = (ServiceNow::GlideRecord);

sub new {
  my $class = shift; 
  my $config = shift;
  my $me = {};
  bless($me,$class);

  ServiceNow::GlideRecord->new($config, "imp_notification", $me);
  return $me;
}

# returns an array of hash values for the field values
sub create {
  my ($me, $params) = (shift, shift);
  
  my @hash;
  $me->insert($params);
  my $displayValue = $me->getValue("display_value");
  if (defined($displayValue)) {
  	@hash = ($me->{'RESULT'}->getResultBody()->{'insertResponse'});
  	return @hash;
  } else {
  	@hash = @{$me->{'RESULT'}->getResultBody()->{'multiInsertResponse'}->{'insertResponse'}};
  	return @hash;
  }
  
  return undef;
}

1;