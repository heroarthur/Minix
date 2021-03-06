package Net::DNS::RR::NID;

#
# $Id: NID.pm 1096 2012-12-28 13:35:15Z willem $
#
use vars qw($VERSION);
$VERSION = (qw$LastChangedRevision: 1096 $)[1]; # Unchanged since 1050

use base Net::DNS::RR;

=head1 NAME

Net::DNS::RR::NID - DNS NID resource record

=cut


use strict;
use integer;


sub decode_rdata {			## decode rdata from wire-format octet string
	my $self = shift;
	my ( $data, $offset ) = @_;

	@{$self}{qw(preference nodeid)} = unpack "\@$offset n a8", $$data;
}


sub encode_rdata {			## encode rdata as wire-format octet string
	my $self = shift;

	return '' unless $self->{nodeid} && length $self->{nodeid};
	pack 'n a8', $self->{preference}, $self->{nodeid};
}


sub format_rdata {			## format rdata portion of RR string.
	my $self = shift;

	return '' unless $self->{nodeid} && length $self->{nodeid};
	return join ' ', $self->preference, $self->nodeid;
}


sub parse_rdata {			## populate RR from rdata in argument list
	my $self = shift;

	$self->$_(shift) for qw(preference nodeid);
}


sub preference {
	my $self = shift;

	$self->{preference} = shift if @_;
	return 0 + ( $self->{preference} || 0 );
}

sub nodeid {
	my $self = shift;
	my $idnt = shift;

	$self->{nodeid} = pack 'n4', map hex($_), split /:/, $idnt if defined $idnt;

	sprintf '%0.4x:%0.4x:%0.4x:%0.4x', unpack 'n4', $self->{nodeid} if defined wantarray;
}

__PACKAGE__->set_rrsort_func(				## sort RRs in numerically ascending order.
	'preference',
	sub {
		my ( $a, $b ) = ( $Net::DNS::a, $Net::DNS::b );
		$a->{preference} <=> $b->{preference};
	} );


__PACKAGE__->set_rrsort_func(
	'default_sort',
	__PACKAGE__->get_rrsort_func('preference')

	);

1;
__END__


=head1 SYNOPSIS

    use Net::DNS;
    $rr = new Net::DNS::RR('name IN NID preference nodeid');

    $rr = new Net::DNS::RR(
	name	   => 'example.com',
	type	   => 'NID',
	preference => 10,
	nodeid	   => '8:800:200C:417A'
	);

=head1 DESCRIPTION

Class for DNS Node Identifier (NID) resource records.

The Node Identifier (NID) DNS resource record is used to hold values
for Node Identifiers that will be used for ILNP-capable nodes.

=head1 METHODS

The available methods are those inherited from the base class augmented
by the type-specific methods defined in this package.

Use of undocumented package features or direct access to internal data
structures is discouraged and could result in program termination or
other unpredictable behaviour.


=head2 preference

    $preference = $rr->preference;

A 16 bit unsigned integer in network byte order that indicates the
relative preference for this NID record among other NID records
associated with this owner name.  Lower values are preferred over
higher values.

=head2 nodeid

    $nodeid = $rr->nodeid;

The NodeID field is an unsigned 64-bit value in network byte order.
The text representation uses the same syntax (i.e., groups of 4
hexadecimal digits separated by a colons) that is already used for
IPv6 interface identifiers.


=head1 COPYRIGHT

Copyright (c)2012 Dick Franks.

Package template (c)2009,2012 O.M.Kolkman and R.W.Franks.

All rights reserved.

This program is free software; you may redistribute it and/or
modify it under the same terms as Perl itself.


=head1 SEE ALSO

L<perl>, L<Net::DNS>, L<Net::DNS::RR>, RFC6742

=cut
