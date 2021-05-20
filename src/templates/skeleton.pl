#!/tool/pandora64/bin/perl5.18.1

use strict;
use warnings;
use diagnostics;
use feature qw/say/;

use Data::Dumper;

main() unless caller;

sub main {
    my $obj = MyClass->new;
    $obj->hello;
}

package MyClass;

use strict;
use warnings;

sub new { bless {} => shift };

sub hello { print "Hello World\n" }

no warnings 'void';
"MyClass"
