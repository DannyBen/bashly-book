---
icon: arrow-up
order: 55
---

# Upgrading to Bashly 2.0

Bashly 2.0 is mostly backward compatible. The main breaking change is the new
native runtime completion system, which replaces the Completely-based system
used by earlier versions.

This guide explains how to update an existing Bashly project.

## Rename the Bash version bouncer setting

Rename `enable_bash3_bouncer` to `enable_bash_version_bouncer` in your Bashly
settings file. Its allowed values and behavior remain unchanged.

## Migrate generated completion support

If your application provides a completion script:

1. Remove completion files previously created with `bashly add completions`,
   `bashly add completions_script`, or `bashly add completions_yaml`. These
   libraries are no longer used.
2. Remove any generated `send_completions` function from your `lib` folder.
   Bashly now generates this function internally.
3. Enable runtime completions in your Bashly settings file:

   ```yaml settings.yml
   enable_completions: always
   ```

4. Regenerate your application. Existing commands or flags that call
   `send_completions` can continue to do so.

The generated `send_completions` function currently supports Bash. For
example, an application can expose it through a `completions` command whose
handler contains:

```bash
send_completions "${args[shell]}"
```

[!ref](/advanced/bash-completion/)

[!button variant="primary" icon="code-review" text="Runtime Completions Example"][completions-example]

## Migrate custom completions

The `completions` directive in `bashly.yml` now uses a structured runtime
format and is supported only on arguments and flags. The old array syntax and
command-level `completions` are no longer supported.

### Literal candidates

Move literal candidates to `static`:

```yaml
# Before
completions:
  - main
  - develop

# After
completions:
  static:
    - main
    - develop
```

!!! Note
Use [`allowed`](/configuration/argument/#allowed) when values should be
validated. Use `completions.static` when they should only be suggested.
!!!

### Commands and functions

Move shell commands and Bash functions to `dynamic`, without wrapping them in
`$()`:

```yaml
# Before
completions:
  - $(git branch --format='%(refname:short)')
  - $(my_completion_function)

# After
completions:
  dynamic:
    - git branch --format='%(refname:short)'
    - my_completion_function
```

Each dynamic entry runs in the generated Bashly script when completion is
requested and must print one candidate per line. Bash resolves whether the
entry invokes an external command or a function included in the generated
script.

A failing entry contributes no candidates. Its failure and error output do not
fail or pollute the overall completion request.

!!! Note
Dynamic entries run whenever the user requests a completion. Use fast,
side-effect-free commands and functions.
!!!

### Files and directories

Move file and directory completion to `options`:

```yaml
# Before
completions:
  - <file>
  - <directory>

# After
completions:
  options:
    - files
    - directories
```

The supported completion options are:

- `files`: add file and directory candidates.
- `directories`: add directory candidates only.
- `no-space`: do not append a space after inserting a completion.

Filesystem completion is never implicit. Without `files` or `directories`,
the shell uses only candidates returned by Bashly.

Normal spacing is the default. Use `no-space` only when the user should
continue typing immediately after the inserted candidate. Candidate
de-duplication is always enabled and is not configurable.

### Command-level completions

Remove `completions` from commands and configure the relevant positional
argument or flag argument instead:

```yaml
# Before
commands:
- name: checkout
  completions:
    - $(git branch --format='%(refname:short)')

# After
commands:
- name: checkout
  args:
  - name: branch
    completions:
      dynamic:
        - git branch --format='%(refname:short)'
```

### Completely actions

Completely-specific actions such as `<user>`, `<hostname>`, and `<service>` no
longer have built-in equivalents. Replace them with a dynamic command or
function that prints the desired candidates, one per line.

[!button variant="primary" icon="code-review" text="Advanced Completions Example"][completions-advanced-example]


[completions-example]: https://github.com/bashly-framework/bashly/tree/master/examples/completions#readme
[completions-advanced-example]: https://github.com/bashly-framework/bashly/tree/master/examples/completions-advanced#readme
