# pandoc-luals-annotations

Type annotations for Pandoc Lua filters and custom writers/readers
with [Lua Language Server - LuaLS](https://luals.github.io) (VS code extension).

A similar project is [pandoc-lua-types](https://github.com/rnwst/pandoc-lua-types).

## How to get help about pandoc types with LuaLS

Just copy the `pandoc-types-annotations.lua` file among your sources,
and write the following lines in your code:

```lua
---@module "pandoc-types-annotations"
local pandoc = pandoc ---@type pandoc
```

`pandoc-types-annotations.lua` contains no lua code, just comments
used by LuaLS to provide you information about pandoc types.

The second line creates a local variable pointing to the global
`pandoc` object.

The `---@type pandoc` annotation is important to get help by LuaLS
on `pandoc` modules and methods.

Creating a local variable has also the side effect of speeding up your code a bit,
especially when you make frequent calls to `pandoc.` methods.

Some examples of annotations:

```lua
---@type Div
local div

local inline ---@type Inline

---A function to check if a Pandoc AST element has a class.
---@param element WithAttr An element with an Attr.
---@return boolean
local function hasClass(element)
  ...
end
```

## Prevent `undefined-global` warnings with `.luarc.json`

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

Here's its contents:

```json
{
  "diagnostics.globals": [
    "FORMAT",
    "PANDOC_READER_OPTIONS",
    "PANDOC_WRITER_OPTIONS",
    "PANDOC_VERSION",
    "PANDOC_API_VERSION",
    "PANDOC_SCRIPT_FILE",
    "PANDOC_STATE",
    "pandoc",
    "lpeg",
    "re"
  ]
}
```