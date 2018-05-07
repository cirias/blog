---
categories:
- Blog
date: 2018-04-04 16:50:43.926 +0800
draft: false
slug: ""
title: SSH with GPG Agent
---

Most of the docs of setting ssh over gpg are outdated since gnupg update to gnupg2.
Here are the new method to let it work.

## 1. Enable SSH Support of GPG Agent

In gnupg2 there is no `write-env-file` anymore. The only thing you can do with `gpg-agent.conf` is enable the ssh support.

```bash
cat > ~/.gnupg/gpg-agent.conf <<EOF
default-cache-ttl 600
max-cache-ttl 7200
enable-ssh-support
EOF
```

## 2. Let SSH Use GPG Agent

Add following lines to `.bashrc`

```bash
export GPG_TTY=$(tty) # need this only if you are using curses as pinentry

unset SSH_AGENT_PID
export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
if [ ! -f $SSH_AUTH_SOCK ]; then
  gpg-connect-agent /bye # try to start gpg-agent if ssh socket doesn't exist
fi
```

## 3. Makesure Pinentry Working

If you can get the public key from `ssh-add -L`.
But get `refused_operation` when you do the ssh.
Probably your pinentry is not working.
Identify which pinentry you are using by `readlink -f $(which pinentry)`.
If it's using tty, makesure you have the `GPG_TTY` set correctly.
Then restart gpg-agent by

```bash
gpgconf --kill gpg-agent
gpgconf --launch gpg-agent
```

## .

_I found that you may not need to do the second part if you are on Ubuntu 16.04 during writing this.
Ubuntu do have a script to handle this for you: `/usr/share/upstart/sessions/gpg-agent.conf`
The reason it doesn't work for me may becasue I'm using i3 which is not included in `/etc/upstart-xsessions`.
So the script never runned._
