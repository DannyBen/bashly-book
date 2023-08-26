---
icon: dot
order: 35
---

# Rendering Documentation

## Overview

Bashly is capable of rendering documentation for your script based on
your `bashly.yml` configuration by using the `bashly render` command.

This command can generate any kind of output using either templates that are 
built in in Bashly (for example Markdown), or by using any custom templates.

## Built-in templates

### Markdown

Render markdown documentation by running:

```bash
$ bashly render :markdown docs
```

!!!success Tip
To easily preview your markdown documents, you can use the
[madness markdown server](https://madness.dannyb.co/).
!!!

### Man pages

Render man pages by running:

```bash
$ bashly render :mandoc docs
```

Note that this command will render specially formatted markdown documents and
will then use [pandoc](https://command-not-found.com/pandoc) to convert them.

!!!success Tip
To easily preview your man pages, prefix the command with
`PREVIEW="cli subcommand"`, specifying the command you wish to preview.
!!!

!!!success Tip
To append a footer to all the generated man pages, place a file named
`_footer.md` in your target directory.
!!!

## Custom templates

To create custom templates, it is recommended to use one of the built-in
templates as a starting point. To copy the template source code to your project
run:

```bash
$ bashly add render_markdown
# or
$ bashly add render_mandoc
```

### Template structure

Template directories are expected to have a `render.rb` file in them. This file
will be executed by the `bashly render path/to/template-dir` command.

In this file you can:

- Access your bashly's root command, in a variable named `command`.
- Access the template source directory, in a variable named `source`.
- Access the user's requested output directory, in a variable named `target`.
- Call the `save` method in order to save one or more output files.

This approach allows you to use any template engine that is available in Ruby.

For example, this `render.rb` file uses GTX to render the markdown
documentation:

```ruby render.rb
require 'gtx'

# Load the GTX template
template = "#{source}/markdown.gtx"
gtx = GTX.load_file template

# Render the file for the main command
save "#{target}/index.md", gtx.parse(command)

# Render a file for each subcommand
command.deep_commands.reject(&:private).each do |subcommand|
  save "#{target}/#{subcommand.full_name}.md", gtx.parse(subcommand)
end
```

[!button variant="primary" icon="mark-github" text="See it on GitHub"](https://github.com/DannyBen/bashly/tree/master/lib/bashly/libraries/render/markdown)
