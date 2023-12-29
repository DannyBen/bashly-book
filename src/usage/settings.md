---
icon: tools
order: 80
---

# Settings

Some of bashly's commands can be tweaked through the use of environment
variables, or a settings file.

## Settings file

If you wish to load settings from a configuration file, you can generate an
initial settings file by running:

```shell
$ bashly add settings
```

which will create the default `settings.yml` file in the working directory.

Bashly will look for the settings file in one of these paths:

- A path set in the environment variable `BASHLY_SETTINGS_PATH`.
- A file named `bashly-settings.yml` in the working directory.
- A file named `settings.yml` in the working directory.

!!!success YAML Tips
- The words `yes` and `no` are equivalent to `true` and `false`
- To specify a `null` value, use `~`
!!!

[!button variant="primary" icon="code-review" text="Settings Example"](https://github.com/DannyBen/bashly/tree/master/examples/settings#readme)

## Environment variables

All settings are optional (with their default values provided below), and
can also be set with an environment variable with the same name, capitalized
and prefixed by `BASHLY_` - for example: `BASHLY_SOURCE_DIR`

When setting environment variables, you can use:

- `0`, `false` or `no` to represent false
- `1`, `true` or `yes` to represent true

## Options

### `source_dir`

```yaml
source_dir: src
```

Set the path containing the bashly source files.

### `config_path`

```yaml
config_path: "%{source_dir}/bashly.yml"
```

Set the path to bashly.yml. You can use the special token `%{source_dir}` to
reference the value of the `source_dir` option.

### `target_dir`

```yaml
target_dir: .
```

Set the path to use for creating the final bash script.

### `lib_dir`

```yaml
lib_dir: lib
```

Set the path to use for common library files, relative to `source_dir`.

### `commands_dir`

```yaml
commands_dir: ~
```

Set the path to use for command files, relative to `source_dir`.

- When set to `nil` (denoted by `~`), command files will be placed directly under `source_dir`.
- When set to any other string, command files will be placed under this
  directory, and each command will get its own sub-directory.

In case you plan on creating a large script with many commands, it is
recommended to enable this by setting it to something like
`commands_dir: commands`.

[!button variant="primary" icon="code-review" text="Command Paths Example"](https://github.com/DannyBen/bashly/tree/master/examples/command-paths#readme)

### `strict`

```yaml
strict: false
```

Specify which bash options to apply on initialization.

- `strict: true` - Bash strict mode (`set -euo pipefail`)
- `strict: false` - Only exit on errors (`set -e`)
- `strict: ''` - Do not add any `set` directive
- `strict: <string>` - Add any other custom `set` directive, for example
   `strict: set -o pipefail`{style="white-space: nowrap;"}

### `tab_indent`

```yaml
tab_indent: false
```

Specify the indentation style of the generated script.

- `tab_indent: false` - Indent with two spaces.
- `tab_indent: true` - Indent with Tab (every 2 leading spaces will be converted
   to a tab character).

### `compact_short_flags`

```yaml
compact_short_flags: true
```

Specify how the generated script should treat flags in the form of `-abc`

- `compact_short_flags: true` - Expand `-abc` to `-a -b -c`.
- `compact_short_flags: false` - Do not expand `-abc` (consider this an invalid input).

### `env`

```yaml
env: development
```

Specify if the generated script should include development related comments and
functions or not.

- `env: development` - Generate with file markers and development functions, such as `inspect_args()`.
- `env: production` -  Generate a smaller script, without file markers and development functions.

!!!success File Markers
File markers are special comments that are injected to the final script and
specify the name of the internal bashly template (view) or the path to the
user's partial code files.
!!!

### `partials_extension`

```yaml
partials_extension: sh
```

Set the extension to use when reading/writing partial script snippets.

### `usage_colors`

```yaml
usage_colors:
  caption: ~
  command: ~
  arg: ~
  flag: ~
  environment_variable: ~
```

Enable color output for several aspects of the help message of the generated
script. Each of these options may be a name of a color function that exists in
your script, for example: `green` or `bold`.

You can run `bashly add colors` to add a standard colors library.

!!! Note
This option cannot be set using environment variables.
!!!

[!button variant="primary" icon="code-review" text="Usage Colors Example"](https://github.com/DannyBen/bashly/tree/master/examples/colors-usage#readme)
