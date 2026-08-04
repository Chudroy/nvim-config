# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Dependency maintenance

Run `:DepsAudit` about once a month. It opens separate Lazy and Mason views to
check for available updates, but it does not install or update anything.

Review the displayed changes and upstream release notes before updating. Apply
plugin updates from Lazy, apply Mason tool updates explicitly from Mason, then
run `:checkhealth`, test the language tooling you use, and review the resulting
`lazy-lock.json` diff before committing it.

This configuration keeps project-local config execution and modelines disabled
because it is regularly used with untrusted repositories and downloaded files.
