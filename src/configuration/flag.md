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
Most properties are optional, unless specified otherwise.
!!!

==- :icon-code-review: Example
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
```
===

## `long`

=== `long: string (required, unless short is provided)`
The long form of the flag, including the `--` prefix.
===

## `short`

=== `short: string (required, unless long is provided)`
The short form of the flag, including the `-` prefix.

!!! Special handling for -v and -h
The `-v` and `-h` flags will be used as the short options for `--version` and `--help` respectively **only if you are not using them in any of your own flags**.
!!!
===

## `help`

=== `help: string`
The text to display when using `--help`. Can have multiple lines.
===

## `arg`

=== `arg: string`
If the flag requires an argument, specify its name here.
===

## `required`

=== `required: boolean`
Specify if this flag is required.
===

## `default`

=== `default: string`
The value to use in case it is not provided by the user. Implies that this flag is optional, and only makes sense when the flag has an argument.
===

[!button variant="primary" icon="code-review" text="Default Values Example"](https://github.com/DannyBen/bashly/tree/master/examples/default-values#readme)

## `allowed`

=== `allowed: array`
Limit the allowed arguments. Can be used in conjunction with `default` and
`required`.

Remember to set the [`arg`](#arg) name when using this option.
===

[!button variant="primary" icon="code-review" text="Whitelist Example"](https://github.com/DannyBen/bashly/tree/master/examples/whitelist#readme)

## `validate`

=== `validate: string`
Add custom validation functions.
===

[!ref](/advanced/validations)
