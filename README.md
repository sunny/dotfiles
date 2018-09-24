To install
==========

Start by forking this repository. Then, in a terminal:

```sh
export GITHUB_USERNAME=your_github_username_here
````

Then pull the code:

```sh
mkdir -p ~/code/$GITHUB_USERNAME && cd $_ && git clone git@github.com:$GITHUB_USERNAME/dotfiles.git
```

Install the dotfiles:

```sh
cd ~/code/$GITHUB_USERNAME/dotfiles
zsh install.sh
```

Configure git:

```sh
cd ~/code/$GITHUB_USERNAME/dotfiles
zsh git_setup.sh
```
