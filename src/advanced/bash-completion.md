---
icon: dot
order: 60
---

# Bash Completion

Bashly comes with built-in bash completions generator, provided by the
[completely][completely] gem.

By running any of the `bashly add comp` commands, you can add this functionality
to your script in one of three ways:


==- `bashly add comp script`
Creates a standalone completion script that can be sourced or copied to the
system's bash completions directory.

==- `bashly add comp function`
Creates a function in your `./src/lib` directory that echoes a completion
script. You can then call this function from any command (for example `yourcli
completions`) and your users will be able to install the completions by running
`eval "$(yourcli completions)"`.

==- `bashly add comp yaml`
Creates the raw data YAML file. This is intended mainly for development
purposes.

===

The bash completions generation is **completely automatic**, but you will have
to regenerate the completion function whenever you make changes to your
`bashly.yml` file. 

!!!success Tip
By running `bashly generate --upgrade`, your completions function 
(generated with `bashly add comp function`) will be regenerated.
!!!

## Custom command completions

In addition to the automatic suggestion of sub-commands and flags, you can
instruct bashly to also suggest files, directories, users, git branches and
more. To do this, add another option in your `bashly.yml` on the command you
wish to alter:

```yaml bashly.yml
commands:
- name: upload
  help: Upload a file
  completions:
  - <directory>
  - <user>
  - $(git branch 2> /dev/null)

```

## Custom flag completions

The `completions` option is also available on flags that have an `arg`.
Similarly to the `allowed` option for arguments, the allowed list is added
to the suggestions automatically (without the need to use `completions`).

```yaml bashly.yml
commands:
- name: login
  help: Login to SETI
  flags:
  - long: --user
    arg: username
    completions:
    - <user>
  - long: --protocol
    arg: protocol
    allowed:
      - ssh
      - telnet
```

- Anything between `<...>` will be added using the `compgen -A action` flag.
- Anything else, will be appended to the `compgen -W` flag.

!!! Note
In case you are using the
[Argument `allowed` option](../configuration/argument.md#allowed) or 
the [Flag argument `allowed` option](../configuration/flag.md#allowed),
these will be automatically added to the completions list as well.
!!!

## Additional documentation

For more information about these custom completions, see the
[documentation for the completely gem][completely-docs].

## Example

[!button variant="primary" icon="code-review" text="Bash Completions Example"](https://github.com/DannyBen/bashly/tree/master/examples/completions#readme)



[completely]: https://github.com/DannyBen/completely
[completely-docs]: https://github.com/DannyBen/completely#suggesting-files-directories-and-other-bash-built-ins
[compgen]: https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html
