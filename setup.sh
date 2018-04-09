#!/bin/sh

echo "Setting up django git push deployment at `pwd`"
echo ""

if [ -e deploy/after_push ]; then
    # UPDATE
    curl https://raw.githubusercontent.com/4teamwork/django-git-deployment/master/deploy/after_push > deploy/after_push
    curl https://raw.githubusercontent.com/4teamwork/django-git-deployment/master/deploy/before_restart > deploy/before_restart
    curl https://raw.githubusercontent.com/4teamwork/django-git-deployment/master/deploy/restart > deploy/restart
    curl https://raw.githubusercontent.com/4teamwork/django-git-deployment/master/deploy/setup > deploy/setup

else
    # NEW
    echo "This will create:"
    echo "./deploy/*"
    echo "./log"
    echo "./tmp"
    echo ""

    while true; do
        read -p "Do you wish to continue? " yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) exit 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done

    echo ""
    echo "----- SETUP -----"
    set -v

    mkdir -p deploy log tmp
    curl https://raw.githubusercontent.com/4teamwork/django-git-deployment/master/deploy/after_push > deploy/after_push
    curl https://raw.githubusercontent.com/4teamwork/django-git-deployment/master/deploy/before_restart > deploy/before_restart
    curl https://raw.githubusercontent.com/4teamwork/django-git-deployment/master/deploy/restart > deploy/restart
    curl https://raw.githubusercontent.com/4teamwork/django-git-deployment/master/deploy/setup > deploy/setup
    chmod +x deploy/after_push
    chmod +x deploy/before_restart
    chmod +x deploy/restart
    chmod +x deploy/setup

    set +v
    echo "----- DONE -----"
    echo ""
    echo "Next steps:"
    echo "- update git remotes"
    echo "- git-commit the changes"
fi
