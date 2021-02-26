#!/tool/pandora64/bin/perl5.18.1

package Test::ModuleName;

use strict;
use warnings;
use diagnostics;
use feature qw/say/;

use Data::Dumper;

use base qw/Test::Class/;

use Test::More;
use Test::Script;
use Test::MockFile;

# execute only test cases marked as urgent, e.g. test_name_urgent
my $urgent_count = 0;
if ( $urgent_count > 0 ) {
    diag('=== FILTER ONLY URGENT ===');
    Test::Class->add_filter( sub { $_[1] =~ /urgent$/i; } );
}

Test::Class->runtests;

# place the tests here according to the Test::Class structure
# or ditch the Test::Class and place them here anyway

done_testing;
