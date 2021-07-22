---
icon: dot
order: 70
---

# Environment Variable

If an environment variable is defined as required (false by default), the execution of the script will be halted with a friendly error if it is not set.

==- :icon-code-review: Example
```yaml bashly.yml
environment_variables:
  - name: config_path
    required: true
    help: |-
      Location of the config file.
      Default: ~/config.ini
```
===

## `name`

=== `name: string`
The name of the variable. Use a lowercase name, it will be automatically capitalized.
===

## `help`

=== `help: string`
The message to display when using `--help`. Can have multiple lines.
===

## `required`

=== `required: boolean`
Specify if this variable is required.
===


