---
icon: home
order: 100
label: Welcome
---

# Welcome to Bashly

**Bashly** is a command line application (written in Ruby) that lets you generate feature-rich bash command line tools.

The design intention is to let you focus on your specific code, without worrying about command line argument parsing, usage texts, error messages and other functions that are usually handled by a framework in any other programming language.

[![Bashly Demo](/assets/cast.svg)](/demo/)

## How it works

1. You provide a YAML configuration file, describing commands, sub-commands,
   arguments, and flags. Running `bashly init` creates an initial sample YAML
   file for you ([example](https://github.com/DannyBen/bashly/tree/master/examples/minimal#bashlyyml)).
2. Bashly then automatically generates a bash script (when you run
   `bashly generate`) that can parse and validate user input, provide help
   messages, and run your code for each command.
3. Your code for each command is kept in a separate file, and can be merged
   again if you change it ([example](https://github.com/DannyBen/bashly/blob/master/examples/minimal/src/root_command.sh)).

## Features

Bashly is responsible for:

- Generating a **single, standalone bash script**.
- Generating **usage texts** and help screens, showing your tool's arguments, flags and commands (works for sub-commands also).
- Parsing the user's command line and extracting:
  - Optional or required **positional arguments**.
  - Optional or required **option flags** (with or without flag arguments).
  - **Commands** (and sub-commands).
  - Standard flags (like **--help** and **--version**).
- Preventing your script from running unless the command line is valid.
- Providing you with a place to input your code for each of the functions your tool performs, and merging it back to the final script.
- Providing you with additional (optional) framework-style, standard library functions:
  - **Color output**.
  - **Config file management** (INI format).
  - **YAML parsing**.
  - **Bash completions**.
  - and more.
