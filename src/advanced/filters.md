---
icon: dot
order: 70
---

# Custom Filters

Bashly supports custom filter functions for your commands. These filters allow
you to define custom conditions that can prevent your command from running
unless they are met.

This is how it works:

1. In your bashly configuration file, commands may have a
   `filters` option, specifying an array of one or more function names.
2. Whenever your run your script, it will look for functions with that name,
   prefixed by `filter_` and will run them before calling the command code.
3. If any of the functions returns any string, it is considered an error. The
   string will be displayed on screen, as the error message.

+++ Configuration

```yaml bashly.yml
name: viewer
filters:
- docker_running
```

+++ Custom Function

```shell src/lib/filter_docker_running.sh
filter_docker_running() {
  docker info > /dev/null 2>&1 || echo "Docker must be running"
}
```

+++

[!button variant="primary" icon="code-review" text="Filters Example"](https://github.com/DannyBen/bashly/tree/master/examples/filters#readme)


!!! Notes
- To verify a program is installed, use [`dependencies`](/configuration/command/#dependencies) instead.
- To verify an environment variable is defined, use [`environment_variables`](/configuration/command/#environment_variables) instead.
!!!
