## Shell environment

My interactive shell is **Fish**, not Bash or Zsh.

- Write interactive terminal commands using Fish syntax.
- Use `set name value` for variable assignments, not `name=value`.
- Use `$name` to reference variables.
- Use Fish-compatible loops, conditionals, and command substitutions.
- Do not use Bash-specific syntax such as `[[ ... ]]`, `source` assumptions, `export NAME=value`, or `VAR=$(command)` in commands intended for my interactive terminal.
- When providing multiple commands, ensure they can be pasted directly into Fish.
- For scripts that explicitly use `#!/usr/bin/env bash`, Bash syntax is acceptable. Do not rewrite NixOS system scripts or project scripts that require Bash.
- Before giving shell commands, distinguish between Fish commands, Bash scripts, and Nix expressions.