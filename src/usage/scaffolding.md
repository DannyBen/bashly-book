---
icon: plus
order: 97
---

# Scaffolding

The `bashly.yml` file can be set up to generate two types of scripts:

1. Script with commands (for example, like `docker` or `git`).
2. Script without commands (for example, like `ls`)

This is detected automatically by the contents of the configuration: If it contains a `commands` definition, it will generate a script with commands.

In an empty directory, create a sample configuration file by running

```shell
$ bashly init
# or, to generate a simpler configuration:
$ bashly init --minimal
```

This will create a sample `src/bashly.yml` file. You can edit this file to specify which arguments, flags and commands you need in your bash script.

Then, generate an initial bash script and function placeholder scripts by running

```shell
$ bashly generate
```

This will:

1. Create the bash executable script.
2. Create files for you to edit in the `src` folder.

Finally, edit the files in the `src` folder. Each of your script's commands get their own file. Once you edit, run `bashly generate` again to merge the content from your functions back into the script.

