---
icon: terminal
order: 99
---

# Installation

Install bashly using one of these methods.

+++ Gem

If you have Ruby 2.7 or higher (`ruby -v`), use this installation method:

```shell
gem install bashly
```

+++ Homebrew

Mac users can enable Ruby gem installation first, and then install bashly:

```shell
brew install brew-gem
brew gem install bashly
```

+++ Docker

If you have docker installed, you can create an alias that will run the docker image:

```shell
alias bashly='docker run --rm -it --user $(id -u):$(id -g) --volume "$PWD:/app" dannyben/bashly'
```

+++


## Prerequisites

The bash scripts generated by bashly require **bash 4 or higher** due to heavy
use of associative arrays.

Mac users can upgrade bash by running:

```
brew install bash
```
