---
icon: code
order: 90
---

# Writing Your Scripts

## Using the input arguments in your code

In order to access the parsed arguments in any of your partial scripts, you may simply access the `$args` associative array.

For example:

1. Generate a minimal configuration with `bashly init --minimal`
2. Generate the bash script with `bashly generate`
3. Run the script with `./download hello --force`

You will notice that all the arguments of the associative array are printed on screen. This is done by the `inspect_args` function that was inserted into the generated partial script `src/root_command.sh`.

You can now access these variables by modifying `sec/root_command.sh` like this:


```bash src/root_command.sh
source_url=${args[source]}
force=${args[--force]}

if [[ $force ]]; then
  echo "downloading $source_url with --force"
else
  echo "downloading $source_url"
fi
```

After editing the file, run `bashly generate` (or `bashly g` for short) and run:

```shell
$ ./download a --force
downloading a with --force
```
