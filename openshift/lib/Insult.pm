package Insult;
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

__END__

=head1 NAME

Insult - Openshift Perl example insult generator

=head1 DESCRIPTION

Based on the Python code from L<the free OpenShift
eBook|https://www.openshift.com/promotions/ebook> (it's very short and a fast
read).  This simple code uses Postgresql and Perl to generate Shakespearean
insults.

=head1 PaaS

"PaaS" stands for "Platform as a Service". It's aimed primarily at developers
who want to deploy Web apps but not worry about the system administration
tasks. Red Hat's L<OpenShift|https://www.openshift.com/> service allows you to
quickly and easily deploy Web apps in a variety of programming languages.
Starting with I<zero> knowledge, I created this app and deployed it at
L<http://insultapp-veure.rhcloud.com/> in two hours. That two hours involved
eating dinner and putting my daughter to bed.

=head1 SETUP

You probably want to follow along in the ebook as you follow these
instructions. These steps start in Chapter 2.

First, sign up for a L<free OpenShift account|https://openshift.redhat.com/app/account/new>.

Next, install the L<command line
tools|https://www.openshift.com/get-started#cli>.

Run C<rhc setup> and follow the prompts. Pick a unique domain name.

Then, assuming you want to call your application C<insultapp>, run the
following:

    rhc app create insultapp perl-5.10

Note that when you do this, it will dump a lot of useful information for you,
including your application URL. Don't forget this URL.

    git remote add upstream -m master <this repo>
    git pull -s recursive -X theirs upstream master
    rhc cartridge add postgresql-9.2

In your C<insultapp> directory (by default, created in your home directory,
but you can move it), do this:

    rhc ssh
    psql
    insultapp=# \e

Then paste contents of
L<https://raw.githubusercontent.com/codemiller/getting-started-with-openshift/master/import.sql>

Exit your editor and your database should be populated.

Then:

    git push

That should build your application and install needed dependencies. It will
take a while.

Then navigate to the URL mentioned previously.
