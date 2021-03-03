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

# run only test named individual_test
#$ENV{TEST_METHOD} = 'individual_test';
Test::Class->runtests;

sub startup_method : Test(startup) {
    my $self = shift;

    note(
        'All startup methods are run once when you start running a test class.'
    );

    return;
}

sub setup_method : Test(setup) {
    my $self = shift;

    note('All setup tests are run once before every test.');

    return;
}

sub test_single : Test {
    my $self = shift;

    note( ( caller(0) )[3] );

    pass('use Test attribute for methods with single test.');

    return;
}

sub test_multiple : Tests {
    my $self = shift;

    note( ( caller(0) )[3] );

    pass('use Tests attribute for methods with multiple tests.');
    pass('when you feel lazy to count them.');

    return;
}

sub teardown_method : Test(teardown) {
    my $self = shift;

    note('All teardown tests are run once after every test.');

    return;
}

sub shutdown_method : Test(shutdown) {
    my $self = shift;

    note(
'All shutdown methods are run once just before a test class stops running.'
    );

    return;
}

done_testing;
