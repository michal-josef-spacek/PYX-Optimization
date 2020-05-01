use strict;
use warnings;

use inc::Module::Install;

# Definition.
abstract '';
author 'Michal Spacek <skim@cpan.org>';
license 'bsd';
name 'PYX-Optim';
readme_from 'Optimization.pm';
requires 'Class::Utils' => 0.05;
requires 'Error::Pure' => 0.15;
requires 'PYX' => 0.01;
requires 'PYX::Parser' => 0.01;
requires 'PYX::Utils' => 0.01;
requires 'perl' => '5.6.2';
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=PYX-Optimization';
resources 'homepage' => 'https://github.com/tupinek/PYX-Optimization';
resources 'repository' => 'git://github.com/tupinek/PYX-Optimization';
test_requires 'English' => 0;
test_requires 'File::Object' => 0.07;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
