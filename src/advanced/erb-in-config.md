---
icon: dot
order: 45
---

# ERB in Config

The `bashly.yml` configuration is pre-processed by ERB before it is loaded
by the bashly command line. This means that you can use Ruby code to load
values from external sources into your bashly configuration.

- Use `<%= ... %>` to execute Ruby code and output the result.
- Use `<% ... %>` to execute Ruby code without outputting the result.
