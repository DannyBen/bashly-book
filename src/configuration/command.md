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

==- :icon-code-review: Example
```yaml bashly.yml
name: rush
help: Personal package manager
version: 0.6.5

commands:
- name: add
  short: a
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
  short: r
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

## `name`

=== `name: string`
The name of the script or sub-command.
===

## `short`

=== `short: string` 

An additional, optional pattern, usually used to denote a
one letter variation of the command name.

You can add `*` as a suffix, to denote a *starts with* pattern - for example:

```yaml bashly.yml
name: download
short: d*  # anything that starts with d
```

!!! Note
Applicable only in sub-commands.
!!!

===

## `help` 

=== `help: string`

The header text to display when using `--help`.

This option can have multiple lines. In this case, the first line will be used
as summary wherever appropriate.

===

## `footer` 

=== `footer: string`

Add a custom message that will be displayed at the end of the `--help` text. 

===

## `group` 

=== `group: string`

In case you have many commands, use this option to specify a caption to display
before this command.

This option is purely for display purposes, and needs to be specified only for
the first command in each group.

===

## `version` 

=== `version: string`

The string to display when using `--version`.

!!! Note
Applicable only in the main command.
!!!

===

## `default` 

=== `default: boolean`

Setting this to `true` on any command, will cause any **unrecognized** command
line to be passed to this command. This means that it should be used only for
command that have at least one required argument.

!!! Note
Applicable only in sub-commands.
!!!

===

## `args` 

=== `args: array`

Specify the array of positional arguments this script needs.

[!ref](argument.md)

===

## `flags` 

=== `flags: array`

Specify the array of option flags this script needs.

[!ref](flag.md)

===

## `commands` 

=== `commands: array`

Specify the array of commands. Each command will have its own args and flags.

!!! Note
Using `commands` on a given command implies that this command does not have flags or args.
!!!

===

## `catch_all` 

=== `catch_all: boolean or string or hash`

Specify that this command should allow for additional arbitrary arguments or
flags.

It can be set in one of three ways:

- Set to `true` to just enable it.
- Set to a string, to show this string in the usage help text.
- Set to a hash containing `label` and `help` keys, to show a detailed help for
  it when running with `--help`.

===

## `completions` 

=== `completions: array`

Specify an array of additional completion suggestions when used in conjunction
with `bashly add comp`.

[!ref](/advanced/bash-completion.md)

===

## `environment_variables` 

=== `environment_variables: array`

Specify an array of environment variables required or desired by your script. 

[!ref](environment-variable.md)

===

## `dependencies` 

=== `dependencies: array`

Specify an array of any required external dependencies (commands). The script
execution will be halted with a friendly error unless all dependency commands
exist.

===

## `examples` 

=== `examples: array`

Specify an array of examples to show when using `--help`. Each example can have
multiple lines.

===

## `extensible` 

=== `extensible: boolean or string`

Specify that this command can be extended by external means.

[!ref](/advanced/extensible-scripts.md)

!!! Note
Applicable only in the main command.
!!!

===
