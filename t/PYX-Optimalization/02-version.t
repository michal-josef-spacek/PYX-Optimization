use strict;
use warnings;

use PYX::Optimalization;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($PYX::Optimalization::VERSION, 0.01, 'Version.');
