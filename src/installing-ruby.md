---
order: 10
icon: ruby
---

# Installing Ruby

The installation instructions provided below aim to be the fastest and simplest
way to install Ruby, with the ability to install gems that build native
extensions.

The general instructions are:

1. **Install build tools / development tools**  
   Each operating system's package manager has its own "meta package" that 
   installs some compilers and other packages needed for building other
   packages.
2. **Install libyaml**  
   Many Ruby gems rely on this library.
3. **Ensure the gem bin path is in your `$PATH`**  
   Some installation methods do not update the `$PATH` properly. You will need
   to alter your `$PATH` so that it includes the path to the location of gem
   executable files.

## `brew` - macOS

```bash
$ brew install ruby
$ gem install bashly
```

## `apt` - Ubuntu / Debian

```bash
$ sudo apt -y update
$ sudo apt -y install build-essential libyaml-dev ruby-dev
$ sudo gem install bashly
```

## `pacman` - Arch Linux

```bash
$ sudo pacman -Suy
$ sudo pacman -S base-devel ruby

# add gem bin dir to path (put this in your initialization script if needed)
$ export PATH="$PATH:$(gem env path | sed 's#[^:]\+#&/bin#g')"

$ gem install bashly
```

## `dnf` - Fedora / CentOS / Red Hat

```bash
$ sudo dnf -y update
$ sudo dnf -y install @development-tools libyaml-devel ruby-devel
$ gem install bashly
```
