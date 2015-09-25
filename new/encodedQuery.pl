# ======================================================================
#
#   Copyright 2015 Daniel Hernández Cassel
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
#	This is a beta functionality that need to be added to the API
#
# ======================================================================

#!/usr/bin/perl -w
use SOAP::Lite;
use Term::ReadKey;
use warnings;
use strict;

my $instance = 'https://INSTANCE_NAME.service-now.com/'; 
my $table = 'TABLE_NAME'; #computers --> cmdb_ci_computer
my ($user,$pass,$query);

print "Username: ";
chomp($user = <>);
ReadMode('noecho');
print "Password: ";
chomp($pass = <>);
ReadMode(0);
print "\nProvide the encoded query: ";
chomp($query = <>);
sub SOAP::Transport::HTTP::Client::get_basic_credentials {
return $user => $pass;
}

my $soap = SOAP::Lite
-> proxy($instance.$table.'.do?SOAP');

my $method = SOAP::Data->name('getRecords')
->attr({xmlns => 'http://www.service-now.com/'});

#"sys_created_on<=javascript:gs.dateGenerate('2012-09-16','21:20:59')^sys_created_on>=javascript:gs.dateGenerate('2012-08-31','17:01:31')"  
#"nameSTARTSWITHMADP5F00" 
#"opened_by='fbc03f93a99d34c46fbbb49f519678a6"
my @params = ( SOAP::Data->name(__encoded_query => $query) );  
my %keyHash = %{ $soap->call($method => @params)->body->{'getRecordsResponse'} };

# iterate through all fields and print them
my $i = 0;
my $size = @{$keyHash{'getRecordsResult'}};
for ($i=0; $i<$size; $i++) {
my %record = %{$keyHash{'getRecordsResult'}[$i]};
print "------------------------------ $i ----------------------------\n";
foreach my $kk (keys %record) {
print "$kk=$record{$kk}\n";
}
}