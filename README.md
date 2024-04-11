# pandoc-luals-annotations

Type annotations for Pandoc Lua filters and custom writers/readers
with [Lua Language Server - LuaLS](https://luals.github.io) (VS code extension).

## How to get help about pandoc types with LuaLS

Just copy the `pandoc-types-annotations.lua` file among your sources,
and write the following line in your code:

```lua
---@module "pandoc-types-annotations"
```

`pandoc-types-annotations.lua` contains no lua code, just comments
used by LuaLS to provide you information about pandoc types.

## Prevent `undefined-global` warnings

LuaLS does not know about global data structures provided by pandoc.

So it complains with warnings like this:

```
Undefined global `pandoc`. Lua Diagnostics. (undefined-global)
(global) pandoc: unknown
```

The quick solutions LuaLS suggests is to add some configurations 
in the `.vscode` folder in the root of your project, or
to add a line like these:

```lua
---@diagnostic disable: undefined-global
---@diagnostic disable-next-line: undefined-global
```

in your source file, whether you want to disable _all_
the diagnostic warnings about undefined globals or just
in the next line.

There's a better solution for globals provided by pandoc:
just put the `.luarc.json` you find in this repo
in the root directory of your project to prevent
those LuaLS warnings, without the need to annotate
your code with `---@diagnostic ...` lines.