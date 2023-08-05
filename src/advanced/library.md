---
icon: dot
order: 90
---

# Library Functions

Bashly comes with a set of library functions that can be added to your script
by running the `bashly add` command.

## YAML parser

Adds the ability to read YAML files in your bash script.

```bash
$ bashly add yaml
````

You can then use the `yaml_load` function anywhere in your script:

```bash
yaml_load "settings.yml"             # print variables
yaml_load "settings.yml" "config_"   # use prefix
eval $(yaml_load "settings.yml")     # create variables in scope
````

[!button variant="primary" icon="code-review" text="YAML Example"](https://github.com/DannyBen/bashly/tree/master/examples/yaml#readme)

## Config handler

Adds the ability to create, read and write simple INI-like configuration files
with `key=value` pairs.

```bash
$ bashly add config
```

By default, these functions will work on a file named `config.ini` but
you can change it by setting the `CONFIG_FILE` environment variable in your
`src/initialize.sh` file.

You can then use thees functions anywhere in your script:

```bash
# Create a new config file.
# There is normally no need to use this function, it is used by other
# functions as needed.
config_init

# Get the value from the config file.
result=$(config_get username)

# Add or update a key=value pair in the config.
config_set username bob

# Delete a key from the config.
config_del username

# Show the config file.
config_show

# Return an array of the keys in the config file
for k in $(config_keys); do
  echo "- $k = $(config_get "$k")";
done

# Returns true if the specified key exists in the config file
if config_has_key "key" ; then
  echo "key exists"
fi
```

[!button variant="primary" icon="code-review" text="Config Example"](https://github.com/DannyBen/bashly/tree/master/examples/config#readme)




## INI handler

Adds the ability to create, read and write INI files with `[sections]`
(optional) and `key=value` pairs.

```bash
$ bashly add ini
```

```bash
# Load an INI file into the `ini` associative array.
ini_load 'path/to/file.ini'

# Save the associative array back to the INI file.
ini_save 'path/to/file.ini'

# Having an INI_FILE global variable lets you load and save without providing
# a path
INI_FILE=path/to/file.ini
ini_load
ini_save

# Access a value
name=${ini[key]}
name=${ini[section.key]}
name=${ini[section.key]:-default}

# Create/update a value
ini[section.key]="new value"
ini_save

# Delete a value
unset ini[section.key]
ini_save

# Show the loaded values
ini_show
```

[!button variant="primary" icon="code-review" text="INI Example"](https://github.com/DannyBen/bashly/tree/master/examples/ini#readme)

## Color output

Adds functions for printing colored strings.

```bash
$ bashly add colors
```

Then, anywhere in your script:

```bash
echo "before $(red this is red) after"
echo "before $(green_bold this is green_bold) after"
```

See the generated script in `src/lib/colors.sh` for the full list of colors.

[!button variant="primary" icon="code-review" text="Colors Example"](https://github.com/DannyBen/bashly/tree/master/examples/colors#readme)

## Auto-update

Files added by the `bashly add *` commands can be automatically updated to their
original state by running

```bash
bashly generate --upgrade
````

The `--upgrade` flag will scan all the files in the `src/lib` directory for a 
special magic comment in this format:

```
[@bashly-upgrade <library>]
```

When found, and assuming the path of the file matches the one in the library,
this file will be updated.

You are encouraged to modify the generated library functions to your liking, but
if you do so, remember to remove this magic comment to prevent accidentally 
overriding it in future runs of `bashly generate --upgrade`.


