# NAME

Insult - Openshift Perl example insult generator

# DESCRIPTION

Based on the Python code from [the free OpenShift eBook](https://www.openshift.com/promotions/ebook) (it's very short and a fast
read).  This simple code uses Postgresql and Perl to generate Shakespearean
insults.

[Here's the live demo](http://insultapp-veure.rhcloud.com/).

# PaaS

"PaaS" stands for "Platform as a Service". It's aimed primarily at developers
who want to deploy Web apps but not worry about the system administration
tasks. Red Hat's [OpenShift](https://www.openshift.com/) service allows you to
quickly and easily deploy Web apps in a variety of programming languages.
Starting with _zero_ knowledge, I created this app and deployed it at
[http://insultapp-veure.rhcloud.com/](http://insultapp-veure.rhcloud.com/) in two hours. That two hours involved
eating dinner and putting my daughter to bed.

# SETUP

You probably want to follow along in the ebook as you follow these
instructions. These steps start in Chapter 2.

First, sign up for a [free OpenShift account](https://openshift.redhat.com/app/account/new).

Next, install the [command line tools](https://www.openshift.com/get-started#cli).

Run `rhc setup` and follow the prompts. Pick a unique domain name.

Then, assuming you want to call your application `insultapp`, run the
following:

    rhc app create insultapp perl-5.10

Note that when you do this, it will dump a lot of useful information for you,
including your application URL. Don't forget this URL.

    git remote add upstream -m master https://github.com/Ovid/openshift-perl
    git pull -s recursive -X theirs upstream master
    rhc cartridge add postgresql-9.2

In your `insultapp` directory (by default, created in your home directory,
but you can move it), do this:

    rhc ssh
    psql
    insultapp=# \e

Then paste contents of
[https://raw.githubusercontent.com/codemiller/getting-started-with-openshift/master/import.sql](https://raw.githubusercontent.com/codemiller/getting-started-with-openshift/master/import.sql)

Exit your editor and your database should be populated.

Type `\q` to exit Postgresql.

Type `exit` to exit your cloud instance and return to your box (i.e., end your
ssh session).

Then:

    git push

That should build your application and install needed dependencies. It will
take a while.

Then navigate to the URL mentioned previously.

# HACKING

If you want to hack on the code, it's in the C<openshift> directory. Add
dependencies to `.openshift/cpan.txt`.

# AUTHOR

Written by Curtis "Ovid" Poe and sponsored by [All Around The
World](http://www.allaroundtheworld.fr/).

Copyright 2014, All Around The World.

This code is released into the public domain. Do as you wish.
