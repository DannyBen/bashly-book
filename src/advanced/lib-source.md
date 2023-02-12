---
icon: dot
order: 30
---

# Custom Libraries Source

## Overview

Bashly is capable of importing external library functions from a custom central
libraries source using the `bashly add --source NAME ...` command.

These external library sources can be:

1. A local path
2. A remote git repository
3. A remote GitHub repository (public or private)

This can be useful if:

1. You have multiple bashly-generated scripts, and wish to have a central place
   for shareable libraries.
2. You wish to create a public source for libraries for bashly.
3. You wish to create a private sharable libraries source for your organization.

## Specifications

The external library source must have a `libraries.yml` file describing the 
libraries it provides. A typical `libraries.yml` file looks like this:

```yaml
colors:
  help: Add standard functions for printing colorful text.
  files:
    - source: "colors/colors.sh"
      target: "%{user_lib_dir}/colors.%{user_ext}"

config:
  help: Add standard functions for handling INI files.
  files:
    - source: "config/config.sh"
      target: "%{user_lib_dir}/config.%{user_ext}"

  post_install_message: |
    Remember to set up the CONFIG_FILE variable in your script.
    For example: CONFIG_FILE=settings.ini.
```

### `help`

The message to show when running `bashly add --source NAME --list`

### `files`

An array of `source` + `target` paths of files to copy when adding this library.

- `source` is relative to the root of the library source.
- `target` is relative to the current directory, and you can use any of these
  tokens in the path:
  - `%{user_source_dir}` - path to the user's source directory (normally `./src`).
  - `%{user_target_dir}` - path to the user's target directory (normally `.`).
  - `%{user_lib_dir}` - path to the user's `lib` directory (normally `./src/lib`).
  - `%{user_ext}` - the user's selected partials extension (normally `sh`).

### `post_install_message`

An optional message to show after the user installs the library. You can use a 
multi-line YAML string here, and use color markers as specified by the
[Colsole](https://github.com/dannyben/colsole#colors) gem. 

In the below example, ``g`...` `` means green, ``m`...` `` magenta, and 
``bu`...` `` blue underlined:

```yaml
post_install_message: |
  Edit your tests in g`test/approve` and then run:

    m`$ test/approve`

  Docs: bu`https://github.com/DannyBen/approvals.bash`
```

## Auto-upgrade

Your library files can be set to auto-upgrade when running
`bashly generate --upgrade`. In order to enable this functionality, you need to 
add a special upgrade marker to your file:

```bash
## [@bashly-upgrade source-uri;library-name]
```

For example

```bash
## [@bashly-upgrade github:you/your-repo;config]
```

You can also use the shorthand version of the marker, which will be replaced
with the full marker when the library is added:

```bash
## [@bashly-upgrade]
```

The double-hash comment marker is optional, and denotes a
[hidden comment](/usage/writing-your-scripts/#hidden-comments), which will not
appear in the final generated bash script.
