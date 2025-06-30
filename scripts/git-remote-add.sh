#!/usr/bin/env bash

function git_remote_add_onion() {
  local remote="$1"
  local url="$2"
  git remote add "$remote" "$url" ||
  git remote set-url "$remote" "$url"
  git config --add remote."$remote".proxy socks5h://127.0.0.1:9050
}

git_remote_add_onion darktea.onion http://it7otdanqu7ktntxzm427cba6i53w6wlanlh23v5i3siqmos47pzhvyd.onion/milahu/darknet-git-hosting-services

git_remote_add_onion righttoprivacy.onion http://gg6zxtreajiijztyy5g6bt5o6l3qu32nrg7eulyemlhxwwl6enk6ghad.onion/milahu/darknet-git-hosting-services
