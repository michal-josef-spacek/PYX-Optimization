# Pragmas.
use strict;
use warnings;

# Modules.
use File::Object;
use PYX::Optimalization;
use Test::More 'tests' => 4;

# Directories.
my $data_dir = File::Object->new->up->dir('data');

# Include helpers.
do File::Object->new->up->file('get_stdout.inc')->s;

# Test.
my $obj = PYX::Optimalization->new;
my $ret = get_stdout($obj, $data_dir->file('example1.pyx')->s);
my $right_ret = <<"END";
_comment
_comment
_comment
_comment
_comment
_comment
END
is($ret, $right_ret);

# Test.
$ret = get_stdout($obj, $data_dir->file('example2.pyx')->s);
$right_ret = <<"END";
-data
-data
-data
-data
-data
-data
END
is($ret, $right_ret);

# Test.
$ret = get_stdout($obj, $data_dir->file('example3.pyx')->s);
$right_ret = <<"END";
_comment
(tag
Aattr value
-data
)tag
?app vskip="10px"
END
is($ret, $right_ret);

# Test.
$ret = get_stdout($obj, $data_dir->file('example4.pyx')->s);
$right_ret = <<"END";
-data data
-data data
-data data
-data data
-data data
-data data
END
is($ret, $right_ret);
