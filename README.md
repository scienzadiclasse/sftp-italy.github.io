# Guida per redattorə di SFTP

## Installing and configuring Git

First of all, you need a free [Github](https://www.github.com/) account.

The instructions assume you are using Git CLI and will utilize CLI commands.
If you are using Git for Windows you might have a GUI, which would have a different workflow.
For example:
  1. [SourceTree](https://www.sourcetreeapp.com/)
  2. [Github CLI](https://cli.github.com/)
  3. move to Linux, it's funny

You can download Git for different OSes [here](https://git-scm.com/downloads).

Then check your version with `git --version`

Make sure to have an SSH key:

```
ls -al ~/.ssh id_*
```

Else generate it through:
```
ssh-keygen -t ed25519 -C "your-email@example.com" || {
	ssh-keygen -t rsa -b 4096 -C "your-email@example.com"
}
```

Copy the _the public key_ inside the OS clipboard:
```
eval "$(ssh-agent -s)" ssh-add ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub
```

Turn back to [Github settings](https://github.com/settings/keys) and copy the public key just generated.

Finally, test connection through:
```
ssh -T git@github.com
```

## Using this repository

Go to [https://github.com/scienzadiclasse/sftp-italy.github.io](https://github.com/scienzadiclasse/sftp-italy.github.io) and _fork_ that Git repository.
Accept the default repository name.

Now _clone_ that repository in your local system. Adapt the following URL to your needs:

```
git clone https://github.com/<your-username>/sftp-italy.github.io.git
```

This will create a directory on your local system named `sftp-italy.github.io`. Navigate to the new folder

```
cd sftp-italy.github.io
```

## Contributing to the blog



## Making changes

The repository is organized into _branches_. The live production version of the website is in the `main` branch.
When you want to make changes to the website, usually you would create a new branch from the `main` branch to make your changes to.
You need a Git user/identity to make changes. You do that with the following command:

```
git checkout -b <your-branch>
```

`<your-branch>` can be anything that describes the change you're trying to make.
For example, `update-manifesto` could be a branch that contains code to update the text in the Manifesto page.

After changing to the new branch and making all the code changes you want, you can commit those changes to your branch.

First, stage changes to your local repository:

```
git add --all
```
Then commit the changes to your local repository:
```
git commit -m "<commit-msg>"
```
Finally, sync your local repository to the remote repository:
```
git push origin <your-branch>
```

## Pull requests

After you've pushed to the remote repository, you can open a _pull request_ so the repository owner can review and merge it into the `main` branch.
You can create a pull request through the GitHub GUI and set the _source branch_ to your `<branch-name>` and the _target branch_ to main.

Adapt the following URL to your needs: [https://github.com/scienzadiclasse/sftp-italy.github.io/compare/main...<your-username>:sftp-italy.github.io:<your-branch>](https://github.com/scienzadiclasse/sftp-italy.github.io/compare/main...<your-username>:sftp-italy.github.io:<your-branch>).

Should you get stuck, just email [patrizio.bertoni.89@gmail.com](patrizio.bertoni.89@gmail.com).
