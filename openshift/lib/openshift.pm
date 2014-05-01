package openshift;
use Dancer ':syntax';

our $VERSION = '0.1';

get '/subfolder' => sub {
    template 'index';
};

get '/' => sub {
    "Hello, World!";
};

true;
