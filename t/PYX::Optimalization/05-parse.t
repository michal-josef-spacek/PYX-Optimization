# Pragmas.
use strict;
use warnings;

# Modules.
use File::Object;
use PYX::Optimalization;
use Test::More 'tests' => 4;
use Test::Output;

# Directories.
my $data_dir = File::Object->new->up->dir('data');

# Test.
my $obj = PYX::Optimalization->new;
my $right_ret = <<"END";
_comment
_comment
_comment
_comment
_comment
_comment
END
stdout_is(
	sub {
		$obj->parse_file($data_dir->file('ex1.pyx')->s);
		return;
	},
	$right_ret,
);

# Test.
$right_ret = <<"END";
-data
-data
-data
-data
-data
-data
END
stdout_is(
	sub {
		$obj->parse_file($data_dir->file('ex2.pyx')->s);
		return;
	},
	$right_ret,
);

# Test.
$right_ret = <<"END";
_comment
(tag
Aattr value
-data
)tag
?app vskip="10px"
END
stdout_is(
	sub {
		$obj->parse_file($data_dir->file('ex3.pyx')->s);
		return;
	},
	$right_ret,
);

# Test.
$right_ret = <<"END";
-data data
-data data
-data data
-data data
-data data
-data data
END
stdout_is(
	sub {
		$obj->parse_file($data_dir->file('ex4.pyx')->s);
		return;
	},
	$right_ret,
);
