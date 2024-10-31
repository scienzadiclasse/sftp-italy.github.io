# sftp-italy.github.io

## Using Git

The instructions assume you are using Git CLI and will utilize CLI commands. If you are using Git for Windows you might have a GUI, which would have a different workflow. You can download Git [here](https://git-scm.com/downloads).

## Using this repository

Copy into a Git repository in your local system

`git clone https://github.com/scienzadiclasse/sftp-italy.github.io.git`

This will create a directory on your local system named `sftp-italy.github.io`. Navigate to the new folder

`cd sftp-italy.github.io`

## Making changes

The repository is organized into _branches_. The live production version of the website is in the `main` branch. When you want to make changes to the website, usually you would create a new branch from the `main` branch to make your changes to. You need a Git user/identity to make changes. You do that with the following command

`git checkout -b <branch-name>`

`<branch-name>` can be anything that describes the change you're trying to make. For example `git checkout -b feature/update-manifesto` could be a branch that contains code to update the text in the Manifesto page.

After changing to the new branch and making all the code changes you want, you can commit those changes to your branch:

`git add --all` Stages changes to your local repository
`git commit -m "<commit-msg>" Commits the changes to your local repository
`git push origin <branch-name>` Syncs your local repository to the remote repository

## Pull requests

After you've pushed to the remote repository, you can open a _pull request_ so the repository owner can review and merge it into the `main` branch. You can create a pull request through the GitHub GUI and set the _source branch_ to your `<branch-name>` and the _target branch_ to main.
