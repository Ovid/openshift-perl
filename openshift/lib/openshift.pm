package openshift;
use Dancer ':syntax';
use Insult::Model qw(insult named_insult);
use HTML::Entities;

our $VERSION = '0.1';

get '/' => sub {
    template 'index', { insult => insult() };
};

get '/:name' => sub {
    template 'index', { insult => named_insult( encode_entities(params->{name}) ) };
};

true;
