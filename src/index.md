---
icon: home
order: 100
label: Welcome
---

# Welcome to Bashly

Bashly is a command line application (written in Ruby) that lets you generate feature-rich bash command line tools.

The design intention is to let you focus on your specific code, without worrying about command line argument parsing, usage texts, error messages and other functions that are usually handled by a framework in any other programming language.

[![Bashly Demo](/assets/cast.svg)](/demo/)

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
