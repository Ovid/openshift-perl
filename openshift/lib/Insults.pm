package Insults;

use strict;
use warnings;
use base 'Exporter';

our @EXPORT_OK = qw(insult named_insult);

sub insult {
    return "Thou " . generate_insult() . "!";
}

sub named_insult {
    my $name = shift;
    return "$name, thou " . generate_insult() . "!";
}

sub generate_insult () {
    my @first_adjs
      = ( "artless", "bawdy", "beslubbering", "bootless", "churlish" );
    my @second_adjs = (
        "base-court", "bat-fowling", "beef-witted", "beetle-headed",
        "boil-brained"
    );
    my @nouns
      = ( "apple-john", "baggage", "barnacle", "bladder", "boar-pig" );

    return
        choice( \@first_adjs ) . " "
      . choice( \@second_adjs ) . " "
      . choice( \@nouns );
}

sub choice {
    my $aref = shift;
    return $aref->[ rand @$aref ];
}

1;
