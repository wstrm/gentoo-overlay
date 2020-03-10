# Optmzr Gentoo Overlay
A Gentoo overlay with some goodies.

## Add this overlay
With `eselect-repository`:

```bash
eselect repository enable optmzr
```

Or with `layman`:

```bash
layman -a optmzr
```

## Hosted packages
### IPFS (`net-p2p/go-ipfs`)
> A peer-to-peer hypermedia protocol to make the web faster, safer, and more
> open.
 - [ipfs.io](https://ipfs.io/)

A non-binary package for the IPFS Go implementation, uses the official Go ebuild
classes and does _not_ require to disable the network sandbox.

### GitHub CLI
> gh is GitHub on the command line, and it's now available in beta. It brings
> pull requests, issues, and other GitHub concepts to the terminal next to where
> you are already working with git and your code.
 - [github.com/cli/cli](https://github.com/cli/cli)

Read more at: [cli.github.com/](https://cli.github.com/)

Uses the official Go ebuild classes.

### Profanity (`net-im/profanity`)
> Profanity is a console based XMPP client written in C using ncurses and
> libstrophe, inspired by Irssi
 - [profanity-im.github.io](https://profanity-im.github.io/)

A user guide can be found at:
[profanity-im.github.io/userguide.html](https://profanity-im.github.io/userguide.html).

### Yggdrasil (`net-p2p/yggdrasil-go`)
> End-to-end encrypted IPv6 networking to connect worlds.
 - [yggdrasil-network.github.io](https://yggdrasil-network.github.io/)

Uses the official Go ebuild classes.
