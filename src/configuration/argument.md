---
icon: dot
order: 90
---

# Argument

Specify positional arguments (required or optional) used by your script.

The argument's value will be available to you as `${args[name]}` in your bash
function.

==- :icon-code-review: Example
```yaml bashly.yml
args:
  - name: user
    help: AWS Username.

  - name: role
    help: User role.
    allowed:
      - admin
      - guest
```
===

## `name`

=== `name: string`
The name of the argument. Use lowercase letters, since it serves multiple purposes:

- It will be capitalized in the help text.
- It will be used as the hash key in the `${args[...]}` associative bash array.
===

## `help`

=== `help: string`
The message to display when using `--help`. Can have multiple lines.
===

## `required`

=== `required: true`
Specify that this argument is required.

!!! Note
Once you define an optional argument (without `required: true`) then you cannot define required arguments after it.
!!!
===

## `default`

=== `default: string`
The value to use in case it is not provided by the user. Implies that this argument is optional.
===

## `allowed`

=== `allowed: array`
Limit the allowed values. Can be used in conjunction with `default` and `required`.
===


