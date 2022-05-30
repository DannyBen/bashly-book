---
icon: dot
order: 100
---


# Command

The `command` object serves two purposes, it:

1. Defines the root CLI application (command).
2. Defines any nested sub-commands, if any.

Unless otherwise specified, these definitions can be used for both the root
command and sub-commands (under the `commands` definition).

!!! Note
Most properties are optional, unless specified otherwise.
!!!

==- :icon-code-review: Example
```yaml bashly.yml
name: rush
help: Personal package manager
version: 0.6.5

commands:
- name: add
  alias: a
  help: Register a local repository
  args:
  - name: repo
    required: true
    help: Repository name.

  - name: path
    required: true
    help: Path to the repository.

  examples:
  - rush add default ~/rush-repos/default

- name: remove
  alias: r
  help: Unregister a local repository
  args:
  - name: repo
    required: true
    help: Repository name.

  flags:
  - long: --purge
    short: -p
    help: Also remove the local directory.

  examples:
  - rush remove bobby
  - rush remove bobby --purge
```
===


## name

[!badge String]
[!badge variant="danger" text="Required"]

The name of the script or sub-command.


## alias

[!badge String / Array]
[!badge variant="warning" text="Sub-Commands Only"]

!!! Note
This command used to be called `short` in bashly < 0.8.0
!!!

One or more additional optional names for this command. This can be used to
create a shortcut for a command, or provide alternative names for it.

This option accepts either a string, or an array of strings.

You can add `*` as a suffix, to denote a *starts with* pattern - for example:

```yaml bashly.yml
name: index
alias: i  # simple shortcut

name: download
alias: d*  # anything that starts with d

name: upload
alias: [u, push]  # upload, u and push will all run the same command
```

[!button variant="primary" icon="code-review" text="Command Aliases Example"](https://github.com/DannyBen/bashly/tree/master/examples/command-aliases#readme)

## help

[!badge String]

The header text to display when using `--help`.

This option can have multiple lines. In this case, the first line will be used
as summary wherever appropriate.


## filename

[!badge String]

The path (relative to `src`) to the partial source code file, in case you wish
to store your source files in a different path than the default one.

This is useful for scripts that contain many commands.

[!button variant="primary" icon="code-review" text="Command Filenames Example"](https://github.com/DannyBen/bashly/tree/master/examples/command-filenames#readme)


## footer

[!badge String]

Add a custom message that will be displayed at the end of the `--help` text. 

[!button variant="primary" icon="code-review" text="Footer Example"](https://github.com/DannyBen/bashly/tree/master/examples/footer#readme)


## group

[!badge String]
[!badge variant="warning" text="Sub-Commands Only"]

In case you have many commands, use this option to specify a caption to display
before this command.

This option is purely for display purposes, and needs to be specified only for
the first command in each group.

[!button variant="primary" icon="code-review" text="Command Groups Example"](https://github.com/DannyBen/bashly/tree/master/examples/command-groups#readme)


## version

[!badge String]
[!badge variant="warning" text="Root Command Only"]

The string to display when using `--version`.


## default

[!badge Boolean]
[!badge variant="warning" text="Sub-Commands Only"]

Setting this to `true` on any command, will cause any **unrecognized** command
line to be passed to this command. This means that it should be used only for
command that have at least one required argument.

[!button variant="primary" icon="code-review" text="Default Command Example"](https://github.com/DannyBen/bashly/tree/master/examples/command-default#readme)


## private

[!badge Boolean]
[!badge variant="warning" text="Sub-Commands Only"]

Setting this to `true` on any command, will hide it from the command list.

[!button variant="primary" icon="code-review" text="Private Command Example"](https://github.com/DannyBen/bashly/tree/master/examples/command-private#readme)


## expose

[!badge Boolean]
[!badge variant="warning" text="Sub-Commands Only"]

Setting this to `true` on any command that has sub-commands, will show its
sub-commands in the help text of the parent command. This works well with the
[`group`](#group) option.

[!button variant="primary" icon="code-review" text="Commands Expose Example"](https://github.com/DannyBen/bashly/tree/master/examples/commands-expose#readme)


## args

[!badge Array of Arguments]

Specify the array of positional arguments this script needs.

[!ref](argument.md)


## flags

[!badge Array of Flags]

Specify the array of option flags this script needs.

[!ref](flag.md)


## commands

[!badge Array of Commands]

Specify the array of commands. Each command will have its own args and flags.

!!! Note
Using `commands` on a given command implies that this command does not have flags or args.
!!!

[!button variant="primary" icon="code-review" text="Commands Example"](https://github.com/DannyBen/bashly/tree/master/examples/commands#readme) [!button variant="primary" icon="code-review" text="Sub-Commands Example"](https://github.com/DannyBen/bashly/tree/master/examples/commands-nested#readme) 


## catch_all

[!badge Boolean / String / Hash]

Specify that this command should allow for additional arbitrary arguments or
flags.

It can be set in one of three ways:

- Set to `true` to just enable it.
- Set to a string, to show this string in the usage help text.
- Set to a hash containing `label`, `help` and `required` keys, to show a
  detailed help for it when running with `--help`. By default, `catch_all`
  arguments are optional, but you can specify `required: true` to require at
  least one argument.

To access arguments captured by `catch_all` in your script, use the
`$other_args` array (or call the `inspect_args` command to see them).

[!button variant="primary" icon="code-review" text="Catch All Example"](https://github.com/DannyBen/bashly/tree/master/examples/catch-all#readme) [!button variant="primary" icon="code-review" text="Catch All Advanced Example"](https://github.com/DannyBen/bashly/tree/master/examples/catch-all-advanced#readme)


## completions

[!badge Array of Strings]

Specify an array of additional completion suggestions when used in conjunction
with `bashly add comp`.

[!ref](/advanced/bash-completion.md)


## environment_variables

[!badge Array of Environment Variables]

Specify an array of environment variables required or desired by your script. 

[!ref](environment-variable.md)


## dependencies

[!badge Array of Strings]

Specify an array of any required external dependencies (commands). The script
execution will be halted with a friendly error unless all dependency commands
exist.

[!button variant="primary" icon="code-review" text="Dependencies Example"](https://github.com/DannyBen/bashly/tree/master/examples/dependencies#readme)


## filters

[!badge Array of Strings]

Add custom filter functions that will prevent the command from running unless 
certain conditions are met.

[!ref](/advanced/filters)


## examples

[!badge Array of Strings]

Specify an array of examples to show when using `--help`. Each example can have
multiple lines.


## extensible

[!badge Boolean / String]
[!badge variant="warning" text="Root Command Only"]

Specify that this command can be extended by external means.

[!ref](/advanced/extensible-scripts.md)
