---
order: 85
icon: code-review
---

# Examples

The examples folder in the GitHub repository contains many detailed and
documented example configuration files, with their output.

[!button variant="primary" icon="code-review" text="View Examples on GitHub"](https://github.com/DannyBen/bashly/tree/master/examples#readme)

All examples are listed below for convenience.

<!-- EXAMPLES INDEX -->
## Basic use

- [minimal](https://github.com/DannyBen/bashly/tree/master/examples/minimal#readme) - the most basic "hello world" example
- [commands](https://github.com/DannyBen/bashly/tree/master/examples/commands#readme) - a script with subcommands
- [commands-nested](https://github.com/DannyBen/bashly/tree/master/examples/commands-nested#readme) - a script with nested subcommands

## Basic features

- [command-default](https://github.com/DannyBen/bashly/tree/master/examples/command-default#readme) - configuring a default command
- [command-default-force](https://github.com/DannyBen/bashly/tree/master/examples/command-default-force#readme) - configuring a default command that runs instead of showing the usage text
- [command-aliases](https://github.com/DannyBen/bashly/tree/master/examples/command-aliases#readme) - allowing a command to be called with multiple names
- [command-examples](https://github.com/DannyBen/bashly/tree/master/examples/command-examples#readme) - configuring command examples
- [dependencies](https://github.com/DannyBen/bashly/tree/master/examples/dependencies#readme) - halting script execution unless certain dependencies are installed
- [dependencies-alt](https://github.com/DannyBen/bashly/tree/master/examples/dependencies-alt#readme) - halting script execution unless one of the required dependencies is installed
- [environment-variables](https://github.com/DannyBen/bashly/tree/master/examples/environment-variables#readme) - halting script execution unless certain environment variables are set
- [variables](https://github.com/DannyBen/bashly/tree/master/examples/variables#readme) - defining bash variables
- [default-values](https://github.com/DannyBen/bashly/tree/master/examples/default-values#readme) - arguments and flags with default values
- [minus-v](https://github.com/DannyBen/bashly/tree/master/examples/minus-v#readme) - using `-v` and `-h` in your script
- [multiline](https://github.com/DannyBen/bashly/tree/master/examples/multiline#readme) - help messages with multiple lines

## Advanced configuration features

- [catch-all](https://github.com/DannyBen/bashly/tree/master/examples/catch-all#readme) - a command that can receive an arbitrary number of arguments
- [catch-all-advanced](https://github.com/DannyBen/bashly/tree/master/examples/catch-all-advanced#readme) - another example for the `catch_all` option
- [catch-all-stdin](https://github.com/DannyBen/bashly/tree/master/examples/catch-all-stdin#readme) - combining `catch_all` with `stdin` to read multiple files
- [extensible](https://github.com/DannyBen/bashly/tree/master/examples/extensible#readme) - letting your script's users extend the script
- [extensible-delegate](https://github.com/DannyBen/bashly/tree/master/examples/extensible-delegate#readme) - extending your script by delegating commands to an external executable
- [whitelist](https://github.com/DannyBen/bashly/tree/master/examples/whitelist#readme) - arguments and flags with a predefined allowed list of values
- [repeatable-arg](https://github.com/DannyBen/bashly/tree/master/examples/repeatable-arg#readme) - allowing arguments to be provided multiple times
- [repeatable-flag](https://github.com/DannyBen/bashly/tree/master/examples/repeatable-flag#readme) - allowing flags to be provided multiple times
- [reusable-flags](https://github.com/DannyBen/bashly/tree/master/examples/reusable-flags#readme) - reuse flag definition for multiple commands
- [conflicts](https://github.com/DannyBen/bashly/tree/master/examples/conflicts#readme) - defining mutually exclusive flags
- [needs](https://github.com/DannyBen/bashly/tree/master/examples/needs#readme) - defining flags that need other flags
- [command-private](https://github.com/DannyBen/bashly/tree/master/examples/command-private#readme) - hiding commands from the command list
- [private-reveal](https://github.com/DannyBen/bashly/tree/master/examples/private-reveal#readme) - allowing users to reveal private commands, flags or environment variables
- [stdin](https://github.com/DannyBen/bashly/tree/master/examples/stdin#readme) - reading input from stdin
- [filters](https://github.com/DannyBen/bashly/tree/master/examples/filters#readme) - preventing commands from running unless custom conditions are met
- [commands-expose](https://github.com/DannyBen/bashly/tree/master/examples/commands-expose#readme) - showing subcommands in the parent's help
- [key-value-pairs](https://github.com/DannyBen/bashly/tree/master/examples/key-value-pairs#readme) - parsing key=value arguments and flags
- [command-examples-on-error](https://github.com/DannyBen/bashly/tree/master/examples/command-examples-on-error#readme) - showing examples on error

## Customization

- [colors-usage](https://github.com/DannyBen/bashly/tree/master/examples/colors-usage#readme) - adding colors to the usage text
- [command-groups](https://github.com/DannyBen/bashly/tree/master/examples/command-groups#readme) - grouping subcommands in logical sections
- [custom-strings](https://github.com/DannyBen/bashly/tree/master/examples/custom-strings#readme) - configuring the script's error and usage texts
- [custom-includes](https://github.com/DannyBen/bashly/tree/master/examples/custom-includes#readme) - adding and organizing your custom functions
- [custom-script-header](https://github.com/DannyBen/bashly/tree/master/examples/custom-script-header#readme) - configuring a different script header
- [footer](https://github.com/DannyBen/bashly/tree/master/examples/footer#readme) - adding a footer to the help message
- [command-filenames](https://github.com/DannyBen/bashly/tree/master/examples/command-filenames#readme) - overriding filenames for your source scripts
- [command-paths](https://github.com/DannyBen/bashly/tree/master/examples/command-paths#readme) - configuring nested paths for your source scripts
- [command-function](https://github.com/DannyBen/bashly/tree/master/examples/command-function#readme) - configuring custom internal function names
- [split-config](https://github.com/DannyBen/bashly/tree/master/examples/split-config#readme) - splitting your `bashly.yml` into several smaller files

## Bashly library features

- [config](https://github.com/DannyBen/bashly/tree/master/examples/config#readme) - using the config library for easy access to INI files
- [ini](https://github.com/DannyBen/bashly/tree/master/examples/ini#readme) - using the ini library for direct, low level access to INI files
- [yaml](https://github.com/DannyBen/bashly/tree/master/examples/yaml#readme) - using the YAML reading functions
- [colors](https://github.com/DannyBen/bashly/tree/master/examples/colors#readme) - using the color print feature
- [completions](https://github.com/DannyBen/bashly/tree/master/examples/completions#readme) - adding bash completion functionality
- [validations](https://github.com/DannyBen/bashly/tree/master/examples/validations#readme) - adding validation functions for arguments, flags or environment variables
- [hooks](https://github.com/DannyBen/bashly/tree/master/examples/hooks#readme) - adding before/after hooks

## Real-world-like examples

- [docker-like](https://github.com/DannyBen/bashly/tree/master/examples/docker-like#readme) - a sample script with deep commands (like `docker container run`)
- [git-like](https://github.com/DannyBen/bashly/tree/master/examples/git-like#readme) - a sample script with subcommands similar to git

## Documentation generation

- [render-mandoc](https://github.com/DannyBen/bashly/tree/master/examples/render-mandoc#readme) - auto-generate man pages for your script
- [render-markdown](https://github.com/DannyBen/bashly/tree/master/examples/render-markdown#readme) - auto-generate markdown documentation for your script

## Other examples

- [settings](https://github.com/DannyBen/bashly/tree/master/examples/settings#readme) - using the `settings.yml` file to adjust bashly's behavior
- [help-command](https://github.com/DannyBen/bashly/tree/master/examples/help-command#readme) - adding a help command to your script

<!-- EXAMPLES INDEX -->


## Real world examples

If you're interested in real-world examples developed by the bashly community,
check out the [Made with Bashly](https://github.com/DannyBen/bashly/wiki/Made-with-Bashly)
wiki page.
