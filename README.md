Dancer on OpenShift
===================

This git repository helps you get up and running quickly w/ a Dancer installation
on OpenShift.  The Dancer project name used in this repo is 'openshift'
but you can feel free to change it.


Running on OpenShift
----------------------------

Create an account at https://www.openshift.com

Create a perl application

    rhc app create dancer perl-5.10

Add this upstream dancer repo

    cd dancer
    git remote add upstream -m master git://github.com/openshift-quickstart/dancer-example.git
    git pull -s recursive -X theirs upstream master
    
Then push the repo upstream

    git push

That's it, you can now checkout your application at:

    http://dancer-$yournamespace.rhcloud.com

