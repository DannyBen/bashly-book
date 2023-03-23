---
icon: dot
order: 65
---

# Before/After Hooks

In case you need to run common code before or after executing *any* command, you
can add a file named `before.sh` or `after.sh` to your source directory.

Any code within one of these files will be wrapped in its own bash function, and
executed before or after calling any of the command functions.

!!!success Tip
Run `bashly add hooks` to create the two hook files in your source directory.
!!!

Note that this is a general purpose feature, that intends to provide a solution
for use cases that are not covered elsewhere:

- To change bash runtime parameters (e.g. `set -o pipefail`), use the [`strict` setting](/usage/settings/#strict) instead.
- To add custom initialization code, use the [Initialization Function](/usage/writing-your-scripts/#initialization-function) instead.
- To verify a program is installed, use [`dependencies`](/configuration/command/#dependencies) instead.
- To verify an environment variable is defined, use [`environment_variables`](/configuration/command/#environment_variables) instead.
- To perform validation operations, use [Custom Validations](/advanced/validations/) instead.
- To halt the execution of the command unless certain conditions are met, use [Custom Filters](/advanced/filters/) instead.


[!button variant="primary" icon="code-review" text="Hooks Example"](https://github.com/DannyBen/bashly/tree/master/examples/hooks#readme)

