---
icon: dot
order: 80
---

# Flag

Specify flags (required or optional) used by your script.

The flag's value will be available to you as `${args[--output]}` in your bash
function (regardless of whether the user provided it with the long or short
form).

!!! Note
Bashly supports these additional flag formats as input:

- `-abc` same as `-a -b -c`
- `-a=arg` same as `-a arg`
- `--flag=arg` same as `--flag arg`
!!!

!!! Note
Most properties are optional, unless specified otherwise.
!!!

==- :icon-code-review: Show Me How
```yaml bashly.yml
flags:
  - long: --ssh
    short: -s
    help: Clone using SSH.

  - long: --user
    short: -u
    arg: name
    help: Repository user name.
    required: true

  - long: --profile
    arg: name
    help: Profile name
    allowed: [production, stage, dev]
    default: dev

  - long: --verbose
    short: -v
    help: Verbosity level (up to -vvv)
    repeatable: true

  - long: --cache
    help: Enable cache
    conflicts: [--no-cache]

  - long: --no-cache
    help: Disable cache
    conflicts: [--cache]
```
===


## Basic Options

### long

[!badge String]
[!badge variant="danger" text="Required (unless short is provided)"]

The long form of the flag, including the `--` prefix.


### short

[!badge String]
[!badge variant="danger" text="Required (unless long is provided)"]

The short form of the flag, including the `-` prefix.

!!! Special handling for -v and -h
The `-v` and `-h` flags will be used as the short options for `--version` and `--help` respectively **only if you are not using them in any of your own flags**.
!!!


### help

[!badge String]

The text to display when using `--help`. Can have multiple lines.


### arg

[!badge String]

If the flag requires an argument, specify its name here.



## Common Options

### default

[!badge String]

The value to use in case it is not provided by the user. Implies that this flag
is optional, and only makes sense when the flag has an argument.

[!button variant="primary" icon="code-review" text="Default Values Example"](https://github.com/DannyBen/bashly/tree/master/examples/default-values#readme)

### required

[!badge Boolean]

Specify if this flag is required.


## Advanced Options

### allowed

[!badge Array of Strings]

Limit the allowed arguments to a given whitelist. Can be used in conjunction
with [`default`](#default) and[`required`](#required).

Remember to set the [`arg`](#arg) name when using this option.

[!button variant="primary" icon="code-review" text="Whitelist Example"](https://github.com/DannyBen/bashly/tree/master/examples/whitelist#readme)


### conflicts

[!badge Array of Strings]

Specify that this flag is mutually exclusive with one or more other flags.
The values of this array should be the long versions of the flags:
`conflicts: [--other, --another]`

!!! Note
This option should be specified on both sides of the exclusivity.
!!!

[!button variant="primary" icon="code-review" text="Conflicts Example"](https://github.com/DannyBen/bashly/tree/master/examples/conflicts#readme)


### completions

[!badge Array of Strings]

Specify an array of additional completion suggestions when used in conjunction
with `bashly add completions`.

Remember to set the [`arg`](#arg) name when using this option.

[!ref](/advanced/bash-completion.md)

### private

[!badge Boolean]

Setting this to `true` on any flag, will hide it from the help text.

### repeatable

[!badge Boolean]

Specify that this flag can be provided multiple times.

When the flag does not have an argument, the user can provide it multiple times
in the form of `-v -v -v` or `-vvv`. In this case, the received value will be
the number of times it was entered.

When the flag has an argument, the user can provide it in the form of
`-d value1 -d "value 2"`. In this case, the received value will be formatted
as a quoted, space-delimited string which you will need to convert to array with
something like `eval "data=(${args[--data]})"`.

[!button variant="primary" icon="code-review" text="Repeatable Flag Example"](https://github.com/DannyBen/bashly/tree/master/examples/repeatable-flag#readme)


### validate

[!badge String]

Apply a custom validation function.

[!ref](/advanced/validations)
