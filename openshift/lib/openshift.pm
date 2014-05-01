package openshift;
use Dancer ':syntax';
use Insults qw(insult named_insult);
use HTML::Entities;

our $VERSION = '0.1';

get '/' => sub {
    return insult();
};

get '/:name' => sub {
    return named_insult( encode_entities(params->{name}) );
};

true;
