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

# Set to 'production' or 'development':
# - production    generate a smaller script, without file markers
# - development   generate with file markers
env: development

```

[!button variant="primary" icon="code-review" text="Settings Example"](https://github.com/DannyBen/bashly/tree/master/examples/settings#readme)
