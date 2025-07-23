# darknet-git-hosting-services

## services

### based on gitea

- https://github.com/go-gitea/gitea
- https://about.gitea.com/
- written in: Go
- forked from: [gogs](https://gogs.io/)

#### darktea.onion

dark gitea

- http://it7otdanqu7ktntxzm427cba6i53w6wlanlh23v5i3siqmos47pzhvyd.onion
- limitation: http 500 errors (internal server error) with low frequency &rarr; wait and retry
   - the http 500 errors may be caused by gitea upgrades
- limitation: requires login for the webinterface and for the git interface. this is a desperate measure to fight DDOS attacks,
  because gitea does not-yet implement better DDOS protections. see also [doc/darktea-issue-16-dont-require-login-for-the-webinterface.md](doc/darktea-issue-16-dont-require-login-for-the-webinterface.md)
- meta repos
   - [Darktea/Rules](http://it7otdanqu7ktntxzm427cba6i53w6wlanlh23v5i3siqmos47pzhvyd.onion/Darktea/Rules)
   - [Darktea/Guides](http://it7otdanqu7ktntxzm427cba6i53w6wlanlh23v5i3siqmos47pzhvyd.onion/Darktea/Guides)
   - [Darktea/Issues_Support_Feedback](http://it7otdanqu7ktntxzm427cba6i53w6wlanlh23v5i3siqmos47pzhvyd.onion/Darktea/Issues_Support_Feedback)

```sh
remote=darktea.onion
owner=$(cat ~/.git-credentials | grep '@github\.com$' | sed -E 's|https://([^:]+):.*$|\1|')
repo=$(basename "$PWD")
url=http://it7otdanqu7ktntxzm427cba6i53w6wlanlh23v5i3siqmos47pzhvyd.onion/$owner/$repo

git -c remote.origin.proxy=socks5h://127.0.0.1:9050 clone $url
cd $repo
git remote add $remote $url
git config --add remote.$remote.proxy socks5h://127.0.0.1:9050
```

#### righttoprivacy.onion

right to privacy

- http://gg6zxtreajiijztyy5g6bt5o6l3qu32nrg7eulyemlhxwwl6enk6ghad.onion
- limitation: http 502 errors (bad gateway) with low frequency &rarr; wait and retry
- aka "human rights tech". it was renamed to "right to privacy"
- meta repos
   - [RightToPrivacy/Gitea-Onion](http://gg6zxtreajiijztyy5g6bt5o6l3qu32nrg7eulyemlhxwwl6enk6ghad.onion/RightToPrivacy/Gitea-Onion)
   - [RightToPrivacy/Gitea-Onion_WELCOME_GET_STARTED](http://gg6zxtreajiijztyy5g6bt5o6l3qu32nrg7eulyemlhxwwl6enk6ghad.onion/RightToPrivacy/Gitea-Onion_WELCOME_GET_STARTED)

```sh
remote=righttoprivacy.onion
owner=$(cat ~/.git-credentials | grep '@github\.com$' | sed -E 's|https://([^:]+):.*$|\1|')
repo=$(basename "$PWD")
url=http://gg6zxtreajiijztyy5g6bt5o6l3qu32nrg7eulyemlhxwwl6enk6ghad.onion/$owner/$repo

git -c remote.origin.proxy=socks5h://127.0.0.1:9050 clone $url
cd $repo
git remote rename origin $remote
git config --add remote.$remote.proxy socks5h://127.0.0.1:9050
```

### based on gogs

- https://github.com/gogs/gogs
- written in: Go

#### darkforest.onion

- http://git.dkforestseeaaq2dqz2uflmlsybvnq2irzn4ygyvu53oazyorednviid.onion/

```sh
remote=darkforest.onion
owner=$(cat ~/.git-credentials | grep '@github\.com$' | sed -E 's|https://([^:]+):.*$|\1|')
repo=$(basename "$PWD")
url=http://git.dkforestseeaaq2dqz2uflmlsybvnq2irzn4ygyvu53oazyorednviid.onion/$owner/$repo

git -c remote.origin.proxy=socks5h://127.0.0.1:9050 clone $url
cd $repo
git remote rename origin $remote
git config --add remote.$remote.proxy socks5h://127.0.0.1:9050
```

## using tor-hidden git remotes

clone a git repo from a tor-hidden remote:

```sh
remote=darktea.onion
owner=$(cat ~/.git-credentials | grep '@github\.com$' | sed -E 's|https://([^:]+):.*$|\1|')
repo=$(basename "$PWD")
url=http://it7otdanqu7ktntxzm427cba6i53w6wlanlh23v5i3siqmos47pzhvyd.onion/$owner/$repo

git -c remote.origin.proxy=socks5h://127.0.0.1:9050 clone $url
cd $repo
git remote rename origin $remote
git config --add remote.$remote.proxy socks5h://127.0.0.1:9050
```

add a tor-hidden remote to an existing git repo:

```sh
remote=darktea.onion
owner=$(cat ~/.git-credentials | grep '@github\.com$' | sed -E 's|https://([^:]+):.*$|\1|')
repo=$(basename "$PWD")
url=http://it7otdanqu7ktntxzm427cba6i53w6wlanlh23v5i3siqmos47pzhvyd.onion/$owner/$repo

git remote add $remote $url
git config --add remote.$remote.proxy socks5h://127.0.0.1:9050
```

add multiple tor-hidden remotes to an existing git repo:

```sh
#!/usr/bin/env bash

# scripts/git-remote-add.sh

set -eux

owner=$(cat ~/.git-credentials | grep '@github\.com$' | sed -E 's|https://([^:]+):.*$|\1|')
if [ -z "$owner" ]; then
  echo "error: failed to parse repo owner from ~/.git-credentials"
  exit 1
fi

cd "$(dirname "$0")/.."
repo=$(basename "$PWD")

function git_remote_add_onion() {
  local remote="$1"
  local url="$2"
  git remote add "$remote" "$url" ||
  git remote set-url "$remote" "$url"
  git config --add remote."$remote".proxy socks5h://127.0.0.1:9050
}

remote=darktea.onion
url=http://it7otdanqu7ktntxzm427cba6i53w6wlanlh23v5i3siqmos47pzhvyd.onion/$owner/$repo
git_remote_add_onion "$remote" "$url"

remote=righttoprivacy.onion
url=http://gg6zxtreajiijztyy5g6bt5o6l3qu32nrg7eulyemlhxwwl6enk6ghad.onion/$owner/$repo
git_remote_add_onion "$remote" "$url"

remote=darkforest.onion
url=http://git.dkforestseeaaq2dqz2uflmlsybvnq2irzn4ygyvu53oazyorednviid.onion/$owner/$repo
git_remote_add_onion "$remote" "$url"
```

now `git pull` and `git fetch` and `git push` will use the tor socks5 proxy at `127.0.0.1:9050`

```sh
remote=darktea.onion

git pull $remote
git fetch $remote
git push $remote
```

the tor socks5 proxy at `127.0.0.1:9050` is started
by `sudo systemctl start tor` on linux
or `tor.exe --service start` on windows
(youre an idiot if you still use windows, but well... addicts gonna addict)

### example

```sh
cd $(mktemp -d)

remote=darktea.onion
owner=milahu
repo=darknet-git-hosting-services
url=http://it7otdanqu7ktntxzm427cba6i53w6wlanlh23v5i3siqmos47pzhvyd.onion/$owner/$repo

git -c remote.origin.proxy=socks5h://127.0.0.1:9050 clone $url
cd $repo
git remote rename origin $remote
git config --add remote.$remote.proxy socks5h://127.0.0.1:9050
```

### git authentication

to `$HOME/.gitconfig` add this section:

```
[credential]
  # store all entered logins in $HOME/.git-credentials
  helper = store
```

now git will ask for username and password only on your first access to a remote
and store the login data in `$HOME/.git-credentials` for future use

## broken services

<details>

#### open privacy gitea

- http://gitopcybr57ris5iuivfz62gdwe2qk5pinnt2wplpwzicaybw73stjqd.onion
- limitation: cannot create repositories: "You have already reached your limit of 0 repositories."

#### project segfault git

- http://git.pjsfkvpxlinjamtawaksbnnaqs2fc2mtvmozrzckxh7f3kis6yea25ad.onion
- limitation: signup is broken. confirmation email is not sent. the signup page says "A new confirmation email has been sent to `xxx@xxx.onion`. Please check your inbox within the next 3 hours to complete the registration process." but the confirmation email never arrives.

#### git.dotya.ml

- http://2crftbzxbcoqolvzreaaeyrod5qwycayef55gxgzgfcpqlaxrnh3kkqd.onion
- clearnet: https://git.dotya.ml
- limitation: signup is broken.
- via https://dotya.ml/onions/

#### adhoccode

- http://adhoccode34gsycq72umva3hcs44lajzvcpsjsn3ezpcibwc25cujkqd.onion
- limitation: cannot create repositories: "The owner has already reached the limit of 0 repositories."

### based on forgejo

- forgejo is a FOSS fork of gitea
- https://forgejo.org/faq/
   - Why was Forgejo created?
      - In October 2022 the domains and trademark of Gitea were transferred to a for-profit company without knowledge or approval of the community. Despite writing an open letter, the takeover was later confirmed. Forgejo was created as an alternative providing a software forge whose governance further the interest of the general public.
      - Forgejo was initially presented as a “soft-fork” of Gitea, similar to LineageOS, a community led distribution based on Android from Google. It is however better described as a product built on top of Gitea, Git and hundreds of other Free Software projects. Forgejo also has its own documentation, infrastructure, release pipeline, CI infrastructure, distribution channels etc.

#### nixnet

- http://qt5vr747phiq55ubqip4hflmpygzl374mum2zbyqdxg6sqbngmzlqhid.onion
- limitation: signup is broken. creating an account fails with "You cannot register with your email address."
- via https://nixnet.services/

### based on cgit

- https://github.com/zx2c4/cgit
- https://git.zx2c4.com/cgit/about/
- written in: C

### based on gitlab

- https://github.com/gitlabhq/gitlabhq
- https://gitlab.com/gitlab-org/gitlab
- https://gitlab.com/gitlab-org/gitlab-foss
- written in: Ruby

### based on gitarena

- https://github.com/mellowagain/gitarena
- written in: Rust

### based on sourcehut

- https://sr.ht/~sircmpwn/sourcehut/
- written in: Go, Python

### based on gerrit

- A web-based code review system for projects using Git
- https://www.gerritcodereview.com/
- https://gerrit.googlesource.com/gerrit/
- written in: Java

### based on radicle

- https://github.com/radicle-dev/radicle-interface
- https://app.radicle.xyz/
- written in: TypeScript, Rust

</details>

## darknet search engines

useful to find other darknet git hosting services

- ahmia: http://juhanurmihxlp77nkq76byazcldy2hlmovfu2epvl5ankdibsot4csyd.onion/
- torch: http://xmh57jrknzkhv6y3ls3ubitzfqnkrwxhopf5aygthi7d6rplyvk3noyd.onion/
