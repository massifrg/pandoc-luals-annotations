# pandoc-luals-annotations

Type annotations for Pandoc Lua filters and custom writers/readers
with [Lua Language Server - LuaLs](https://luals.github.io) (VS code extension).

## How to get help about pandoc types with LuaLs

Just copy theh `pandoc-types-annotations.lua` file among your sources,
and put the following line in your sources to get help about types by LuaLs:

```lua
---@module "pandoc-types-annotations"
```

That file contains no lua code, just comments.

## Prevent `undefined-global` warnings

LuaLs does not know about global data structures provided by pandoc.

So it complains with warnings like this:

```
Undefined global `pandoc`. Lua Diagnostics. (undefined-global)
(global) pandoc: unknown
```

The quick solutions LuaLs suggests to add some configurations 
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
those LuaLs warnings, without the need to annotate
your code with `---@diagnostic ...` lines.