use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'Insult',
    AUTHOR       => q{Curtis "Ovid" Poe <ovid@allaroundtheworld.fr>},
    VERSION_FROM => 'lib/Insult.pm',
    ABSTRACT     => 'Perl Openshift example',
    ( $ExtUtils::MakeMaker::VERSION >= 6.3002
        ? ( 'LICENSE' => 'perl' )
        : () ),
    PL_FILES  => {},
    PREREQ_PM => {
        'Test::More'     => 0,
        'YAML'           => 0,
        'Dancer'         => 1.3072,
        'HTML::Entities' => 3.69,
        'DBI'            => 1.631,
        'DBD::Pg'        => '3.1.1',
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES    => 'Insult-*' },
);
