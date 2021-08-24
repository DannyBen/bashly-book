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

## INI handler

Adds the ability to create, read and write INI files.

```bash
$ bashly add config
```

By default, these functions will work on a file named `config.ini` but
you can change it by setting the `CONFIG_FILE` environment variable in your
`src/initialize.sh` file.

You can then use thees functions anywhere in your script:

```bash
# Create a new config file.
# There is normally no need to use this fucntion, it is used by other
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
