package Insult::Model;

use strict;
use warnings;
use DBI;
use base 'Exporter';

our @EXPORT_OK = qw(insult named_insult);

sub get_dbh {
    my $app  = $ENV{OPENSHIFT_APP_NAME};
    my $host = $ENV{OPENSHIFT_POSTGRESQL_DB_HOST};
    my $port = $ENV{OPENSHIFT_POSTGRESQL_DB_PORT};
    return DBI->connect_cached(
        "dbi:Pg:dbname=$app;host=$host;port=$port;",
        $ENV{OPENSHIFT_POSTGRESQL_DB_USERNAME},
        $ENV{OPENSHIFT_POSTGRESQL_DB_PASSWORD},
        { AutoCommit => 0 }
    );
}

sub insult {
    return "Thou " . generate_insult() . "!";
}

sub named_insult {
    my $name = shift;
    return "$name, thou " . generate_insult() . "!";
}

sub generate_insult () {
    return
        choice('short_adjective') . " "
      . choice('long_adjective') . " "
      . choice('noun');
}

sub choice {
    my $table = shift;
    return get_dbh()
      ->selectcol_arrayref(
        "select string from $table order by random() limit 1")->[0];
}

1;
