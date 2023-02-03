---
icon: tools
order: 80
---

# Settings

Some of bashly's commands can be tweaked through the use of environment
variables, or a settings file. The environment variables supported by each
command are shown in the respective command's `--help` message.

If you wish to load settings from a configuration file instead of using
environment variables, you can generate an initial settings file by running:

```shell
$ bashly add settings
```

which will create the following file:


```yaml settings.yml
# All settings are optional (with their default values provided below), and
# can also be set with an environment variable with the same name, capitalized
# and prefixed by `BASHLY_` - for example: BASHLY_SOURCE_DIR
#
# When setting environment variables, you can use:
# - "0", "false" or "no" to represent false
# - "1", "true" or "yes" to represent true

# The path containing the bashly configuration and source files
source_dir: src

# The path to use for creating the bash script
target_dir: .

# The path to use for upgrading library files, relative to the source dir
lib_dir: lib

# When true, enable bash strict mode (set -euo pipefail)
strict: false

# When true, the generated script will use tab indentation instead of spaces
# (every 2 leading spaces will be converted to a tab character)
tab_indent: false

# When true, the generated script will consider any argument in the form of
# `-abc` as if it is `-a -b -c`.
compact_short_flags: true

# Set to 'production' or 'development':
# - production    generate a smaller script, without file markers
# - development   generate with file markers
env: development

# The extension to use when reading/writing partial script snippets.
partials_extension: sh

# Display various usage elements in color by providing the name of the color
# function. The value for each property is a name of a function that is
# available in your script, for example: `green` or `bold`.
# You can run `bashly add colors` to add a standard colors library.
# This option cannot be set via environment variables.
usage_colors:
  caption: ~
  command: ~
  arg: ~
  flag: ~
  environment_variable: ~
```

[!button variant="primary" icon="code-review" text="Settings Example"](https://github.com/DannyBen/bashly/tree/master/examples/settings#readme)
