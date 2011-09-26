Dancer on OpenShift Express
============================

This git repository helps you get up and running quickly w/ a Dancer installation
on OpenShift Express.  The Dancer project name used in this repo is 'openshift'
but you can feel free to change it.

You can delete the database from your git repo after the first push (you probably
should for security).  On subsequent pushes, a 'python manage.py syncdb' is
executed to make sure that any models you added are created in the DB.  If you
do anything that requires an alter table, you could add the alter statements
in GIT_ROOT/.openshift/action_hooks/alter and then use
GIT_ROOT/.openshift/action_hooks/build to execute that script (make susre to
back up your database w/ rhc-snapshot first :) )


Running on OpenShift
----------------------------

Create an account at http://openshift.redhat.com/

Create a perl-5.10 application

    rhc-create-app -a dancer -t perl-5.10

Add this upstream seambooking repo

    cd dancer
    git remote add upstream -m master git://github.com/openshift/dancer-example.git
    git pull -s recursive -X theirs upstream master
    
Then push the repo upstream

    git push

That's it, you can now checkout your application at:

    http://dancer-$yourdomain.rhcloud.com

