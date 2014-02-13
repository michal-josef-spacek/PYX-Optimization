package PYX::Optimalization;

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Utils qw(set_params);
use Error::Pure qw(err);
use PYX qw(char comment);
use PYX::Parser;
use PYX::Utils qw(encode decode);

# Version.
our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;
	my $self = bless {}, $class;

	# Output handler.
	$self->{'output_handler'} = \*STDOUT;

	# Process params.
	set_params($self, @params);

	# PYX::Parser object.
	$self->{'pyx_parser'} = PYX::Parser->new(
		'output_handler' => $self->{'output_handler'},
		'output_rewrite' => 1,
		'data' => \&_data,
		'comment' => \&_comment,
	);

	# Object.
	return $self;
}

# Parse pyx text or array of pyx text.
sub parse {
	my ($self, $pyx, $out) = @_;
	$self->{'pyx_parser'}->parse($pyx, $out);
}

# Parse file with pyx text.
sub parse_file {
	my ($self, $file) = @_;
	$self->{'pyx_parser'}->parse_file($file);
}

# Parse from handler.
sub parse_handler {
	my ($self, $input_file_handler, $out) = @_;
	$self->{'pyx_parser'}->parse_handler($input_file_handler, $out);
}

# Process data.
sub _data {
	my ($pyx_parser_obj, $data) = @_;
	my $tmp = encode($data);
	if ($tmp =~ /^[\s\n]*$/) {
		return;
	}

	# TODO Preserve?

	# White space on begin of data.
	$tmp =~ s/^[\s\n]*//s;

	# White space on end of data.
	$tmp =~ s/[\s\n]*$//s;

	# White space on middle of data.
	$tmp =~ s/[\s\n]+/\ /sg;

	$data = decode($tmp);
	my $out = $pyx_parser_obj->{'output_handler'};
	print {$out} char($data), "\n";
}

# Process comment.
sub _comment {
	my ($pyx_parser_obj, $comment) = @_;
	my $tmp = encode($comment);
	if ($tmp =~ /^[\s\n]*$/) {
		return;
	}
	$tmp =~ s/^[\s\n]*//s;
	$tmp =~ s/[\s\n]*$//s;
	$comment = decode($tmp);
	my $out = $pyx_parser_obj->{'output_handler'};
	print {$out} comment($comment), "\n";
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

PYX::Optimalization - TODO

=head1 SYNOPSIS

TODO

=head1 METHODS

=over 8

=item B<new(%parameters)>

 Constructor.

=over 8

=item * B<output_handler>

TODO

=back

=item B<parse()>

TODO

=item B<parse_file()>

TODO

=item B<parse_handler()>

TODO

=back

=head1 ERRORS

 Mine:
   TODO

 From Class::Utils::set_params():
   Unknown parameter '%s'.

=head1 EXAMPLE

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use PYX::Optimalization;

 # PYX::Optimalization object.
 my $pyx = PYX::Optimalization->new(
   TODO
 );

=head1 DEPENDENCIES

L<Class::Utils>,
L<Error::Pure>,
L<PYX::Utils>.

=head1 SEE ALSO

TODO

=head1 AUTHOR

Michal Špaček L<skim@cpan.org>.

=head1 LICENSE AND COPYRIGHT

BSD license.

=head1 VERSION

0.01

=cut
