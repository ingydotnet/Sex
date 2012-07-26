package Sex;

use strict qw(vars subs);

srand;  # More exciting this way.

use vars qw($VERSION);
$VERSION = '0.69';

my @Grunts = ('Does it get bigger?',
              'I thought eight inches was longer than that.',
              'Baseball...',
              "Let's talk about our relationship.",
              'Wrong hole, dear.',
              qw(Yes!
                 Oh!
                 Harder!
                 YEAH!
                 YES!
                 OOOooooh...
                 Baby.
                 MORE!
                 Mmmmmm...
                 There!
                )
              );

sub import {
    local $| = 1;

    my($class) = shift;
    my($caller) = caller;

    if( !@_ ) {
        die "It takes two to tango, babe.\n";
    }
    elsif( @_ == 1 ) {
        if( $_[0] eq $caller ) {
            die <<MASTURBATION;
  masturbation
       n : manual stimulation of the genital organs (of yourself or
           another) for sexual pleasure [syn: {onanism}, {self-abuse}]
MASTURBATION

        }
        else {
            die "Parthenogenesis isn't currently supported by ".
                __PACKAGE__ . "\n";
        }
    }
    my @modules = map { /^\?$/ ? volunteer() : $_ } @_;

    my %zygote = ();
    my $call_sym_table = \%{$caller.'::'};
    foreach my $gamete (@modules) {
        eval "use $gamete(); 1" or next;
        while( my($chromo, $rna) = each %{$gamete.'::'} ) {
            push @{$zygote{$chromo}}, $rna;
        }
    }

    while( my($chromo, $rna) = each %zygote ) {
        $call_sym_table->{$chromo} = $rna->[rand @$rna];
        print $Grunts[rand @Grunts], "\n";
        #select(undef, undef, undef, 0.45);
    }

    # push @{$caller.'::ISA'}, @modules;

    print "\n";

    return 'Harry Balls who?';
}

sub volunteer {
    my @volunteers = map {s/\.pmc?$//;s!/!::!g;$_} keys %INC;
    $volunteers[rand @volunteers];
}

=pod

=encoding utf8

=head1 NAME

Sex - Perl teaches the birds and the bees.

=head1 SYNOPSIS

    package Sex::Oriented::Programming;
    # The usual suspects + 3 volunteers
    use Sex qw(Moose Mouse Mousse Moo Mo ? ? ?);

=head1 DESCRIPTION

This is like the Sex you get from Schwern, but '?' will pull in a random
volunteer from %INC.

=head1 BUGS

There are many bugs you can get from having Sex used too often on your
computer.  Please be sure your programs are Safe before they have Sex.

    package Trojan;
    use Sex qw(Safe Sex);


=head1 AUTHORS

Ingy 'The Alternative to Schwern' döt Net <ingy@cpan.org>

Michael 'The Porn King of CMU' Schwern  <schwern@pobox.com>


=head1 SEE ALSO

'Disco Dolls in Hot Skin'

'Exhausted:  The John Holmes Story'

'Deep Recursion' starring Ada Lovelace.

'The Fly' (1953)


=cut


return 'Harry balls anyone he wants!';
