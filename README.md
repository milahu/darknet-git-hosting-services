# darknet-git-hosting-services

## services

### based on gitea

- https://github.com/go-gitea/gitea
- https://about.gitea.com/
- written in: Go
- forked from: [gogs](https://gogs.io/)

#### darktea

- http://it7otdanqu7ktntxzm427cba6i53w6wlanlh23v5i3siqmos47pzhvyd.onion
- limitation: http 500 errors (internal server error) with low frequency &rarr; wait and retry
   - the http 500 errors may be caused by gitea upgrades

#### human rights tech

- http://gg6zxtreajiijztyy5g6bt5o6l3qu32nrg7eulyemlhxwwl6enk6ghad.onion
- limitation: http 502 errors (bad gateway) with low frequency &rarr; wait and retry

#### forgejo

- http://qt5vr747phiq55ubqip4hflmpygzl374mum2zbyqdxg6sqbngmzlqhid.onion
- limitation: signup is broken. creating an account fails with "You cannot register with your email address."

#### open privacy gitea

- http://gitopcybr57ris5iuivfz62gdwe2qk5pinnt2wplpwzicaybw73stjqd.onion
- limitation: cannot create repositories: "You have already reached your limit of 0 repositories."

#### project segfault git

- http://git.pjsfkvpxlinjamtawaksbnnaqs2fc2mtvmozrzckxh7f3kis6yea25ad.onion
- limitation: signup is broken. confirmation email is not sent. the signup page says "A new confirmation email has been sent to xxx@xxx.onion. Please check your inbox within the next 3 hours to complete the registration process." but the confirmation email never arrives.

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

### based on gogs

- https://github.com/gogs/gogs
- written in: Go

### based on sourcehut

- https://sr.ht/~sircmpwn/sourcehut/
- written in: Go, Python

### based on radicle

- https://github.com/radicle-dev/radicle-interface
- https://app.radicle.xyz/
- written in: TypeScript, Rust
