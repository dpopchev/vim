#!/tool/pandora64/bin/perl5.18.1

package TestModuleName;

use base qw/Test::Class/;

use strict;
use warnings;
use diagnostics;
use feature qw/say/;

use Data::Dumper;
use Path::Tiny;

use Test::More;
use Test::Script;
use Test::MockFile;
use Test::Directory;
use Test::Files;

# run only test named individual_test
# local $ENV{TEST_METHOD} = 'individual_test';
Test::Class->runtests;

# BEGIN { use_ok $module or die }
# BEGIN { can_ok $module, @methods }

sub startup_method : Test(startup) {
    my $self = shift;

    note(
        'All startup methods are run once when you start running a test class.'
    );

    return;
}

sub startup_00_set_script_path : Test(startup) {
    my $self = shift;

    $self->{script} = path("relative/or/absolute/path/to/script");

    return;
}

sub startup_01_set_script_args : Test(startup) {
    my $self = shift;

    $self->{script_args} =
      [ $self->{script}, qw/arguments to use in Test::Script format/ ];

    return;
}

sub setup_method : Test(setup) {
    my $self = shift;

    note('All setup tests are run once before every test.');

    return;
}

sub setup_00_test_directory : Test(setup) {
    my $self = shift;

    # NOTE do not specify test dir name as it will break the clean up process
    $self->{testdir} = Test::Directory->new();

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
