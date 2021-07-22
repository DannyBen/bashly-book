---
order: 100
---


# Command options

Unless otherwise specified, these definitions can be used for both the root
command and subcommands (under the `commands` definition).

 Option    | Description
-----------|-------------
`name`     | The name of the script or subcommand.
`short`    | An additional, optional pattern - usually used to denote a one letter variation of the command name. You can add `*` as a suffix, to denote a "starts with" pattern - for example `short: m*`. *Applicable only in subcommands*.
`help`     | The header text to display when using `--help`. This option can have multiple lines. In this case, the first line will be used as summary wherever appropriate.
`version`  | The string to display when using `--version`. *Applicable only in the main command*.
`default`  | Setting this to `true` on any command, will cause any unrecognized command line to be passed to this command. *Applicable only in subcommands*.
`extensible` | Specify that this command can be [externally extended](#extensible-scripts). *Applicable only in the main command*.
`examples` | Specify an array of examples to show when using `--help`. Each example can have multiple lines.
`environment_variables` | Specify an array of [environment variables](#environment-variable-options) needed by your script. 
`commands` | Specify the array of [commands](#command-options). Each command will have its own args and flags. Note: if `commands` is provided, you cannot specify flags or args at the same level.
`args`     | Specify the array of [positional arguments](#argument-options) this script needs.
`flags`    | Specify the array of option [flags](#flag-options) this script needs.
`completions` | Specify an array of additional completion suggestions when used in conjunction with `bashly add comp`. See [Bash Completions](#bash-completions).
`catch_all` | Specify that this command should allow for additional arbitrary arguments or flags. It can be set in one of three ways:<br>- Set to `true` to just enable it.<br>- Set to a string, to use this string in the usage help text.<br>- Set to a hash containing `label` and `help` keys, to show a detailed help for it when running with `--help`.
`dependencies` | Specify an array of any required external dependencies (commands). The script execution will be halted with a friendly error unless all dependency commands exist.
`group`    | In case you have many commands, use this option to specify a caption to display before this command. This option is purely for display purposes, and needs to be specified only for the first command in each group.
`footer` | Add a custom message that will be displayed at the end of the `--help` text. 

### Argument options

The argument's value will be available to you as `${args[user]}` in your 
bash function.

 Option    | Description
-----------|-------------
`name`     | The name of the argument.
`help`     | The message to display when using `--help`. Can have multiple lines.
`required` | Specify if this argument is required. Note that once you define an optional argument (without required: true) then you cannot define required arguments after it.
`default`  | The value to use in case it is not provided by the user. Implies that this argument is optional.
`allowed`  | Limit the allowed values by providing an array.

### Flag options

The flag's value will be available to you as `${args[--output]}` in your 
bash function (regardless of whether the user provided it with the long or 
short form).

 Option    | Description
-----------|-------------
`long`     | The long form of the flag.
`short`    | The short form of the flag.
`help`     | The text to display when using `--help`. Can have multiple lines.
`arg`      | If the flag requires an argument, specify its name here.
`required` | Specify if this flag is required.
`default`  | The value to use in case it is not provided by the user. Implies that this flag is optional, and only makes sense when the flag has an argument.
`allowed`  | For flags with an argument, you can limit the allowed values by providing an array.
