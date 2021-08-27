---
icon: dot
order: 70
---

# Environment Variable

Specify environment variables (required or optional) used by your script.

If an environment variable is defined as required (false by default), the
execution of the script will be halted with a friendly error if it is not set.

In addition, you can specify a default value for the environment variable, which
will be used in case the user has not defined it in their environment.

==- :icon-code-review: Example
```yaml bashly.yml
environment_variables:
  - name: config_path
    help: Location of the config file
    default: ~/config.ini
  - name: api_key
    help: Your API key
    required: true
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

## `default`

=== `default: string`
The value to use in case it is not provided by the user. Implies that this environment variable is optional.
===

[!button variant="primary" icon="code-review" text="Environment Variables Example"](https://github.com/DannyBen/bashly/tree/master/examples/environment-variables#readme)