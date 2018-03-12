# Django GIT deployment

[git-deploy](https://github.com/mislav/git-deploy) allows to do deployment
directly from git by pushing to the deployment remote.
This tutorial shows how to use this with Django projects.

## Add deployment scripts to repository

First, deployment scripts need to be added to the repository.
`git-deploy` has a command for doing, but it is optimized for Rails apps.
For Django, the scripts can simply be downloaded like this:

```sh
$ cd the-package-repository
$ mkdir deploy
$ cd deploy
$ wget https://raw.githubusercontent.com/4teamwork/django-git-deployment/master/deploy/after_push
$ chmod +x after_push
$ wget https://raw.githubusercontent.com/4teamwork/django-git-deployment/master/deploy/before_restart
$ chmod +x before_restart
$ wget https://raw.githubusercontent.com/4teamwork/django-git-deployment/master/deploy/restart
$ chmod +x restart
$ wget https://raw.githubusercontent.com/4teamwork/django-git-deployment/master/deploy/setup
$ chmod +x setup
```

## Setup GIT hooks on server

In order to set up the GIT hooks you need to install `git-deploy` **locally**.
The setup is done only once, so not everybody has to install git-deploy.
The deployment should already exist and buildout should have ran once.

```sh
$ gem install git-deploy
$ cd the-package-repository
$ git deploy setup -r "testing"
$ git push testing master
```

# Deploying

Now deployments can be done from the local checkout by everybody with access to
the server (without installing `git-deploy`):

```sh
$ cd the-package-repository
$ ./scripts/setup-git-remotes
$ git push testing master
```
