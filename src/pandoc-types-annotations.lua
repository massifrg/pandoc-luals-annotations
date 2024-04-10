---@class List A Pandoc List.

---@class EmptyList An empty List.

---@class Attr A Pandoc `Attr` data structure.
---@field identifier string
---@field classes    string[]
---@field attributes table<string,string>

---@class WithTag
---@field tag string The elements's tag.
---@field t   string The elements's tag.

---@class WithAttr: Attr
---@field attr Attr

---@class Block: WithTag A Pandoc `Block`.
---@field content List The content of the Block.

---@class Inline: WithTag A Pandoc `Inline`.
---@field content List The content of the Inline.

---@alias Blocks List<Block>
---@alias Inlines List<Inline>

---@class Plain: Block A Pandoc `Plain`.
---@field content Blocks

---@class Para: Block A Pandoc `Para`.
---@field content Inlines

---@class LineBlock: Block A Pandoc `LineBlock`
---@field content List<Inlines>

---@class CodeBlock: Block,WithAttr A Pandoc `CodeBlock`
---@field text string

---@class RawBlock: Block A Pandoc `RawBlock`
---@field format string
---@field text string

---@class BlockQuote: Block A Pandoc `BlockQuote`
---@field content Blocks

---@alias ListNumberStyle "DefaultStyle"|"Example"|"Decimal"|"LowerRoman"|"UpperRoman"|"LowerAlpha"|"UpperAlpha"
---@alias ListNumberDelim "DefaultDelim"|"Period"|"OneParen"|"TwoParens"

---@class ListAttributes
---@field start integer Number of the first list item.
---@field style ListNumberStyle Style of list numbers.
---@field delimiter ListNumberDelim Delimiter of list numbers.

---@class OrderedList: Block,ListAttributes A Pandoc `OrderedList`
---@field items List<Blocks>
---@field listAttributes ListAttributes|nil

---@class BulletList: Block A Pandoc `BulletList`
---@field content List<Blocks>

---@class DefinitionListItem
---@field term Inlines
---@field data List<Blocks>

---@class DefinitionList: Block A Pandoc `DefinitionList`
---@field content List<DefinitionListItem>

---@class Header: Block,WithAttr A Pandoc `Header`
---@field level integer
---@field content Inlines

---@class HorizontalRule A Pandoc `HorizontalRule`.

---@class Caption A Pandoc `Table` or `Figure` caption
---@field long Blocks
---@field short Inlines|nil

---@alias Alignment "AlignLeft"|"AlignRight"|"AlignCenter"|"AlignDefault"

---@class Cell: WithAttr A Pandoc `Table` cell
---@field alignment Alignment
---@field contents Blocks
---@field col_span integer
---@field row_span integer

---@class Row: WithAttr A Pandoc `Table` row
---@field cells List<Cell>

---@class TableHead: WithAttr A Pandoc `Table` head
---@field rows List<Row>

---@class TableFoot: WithAttr A Pandoc `Table` foot
---@field rows List<Row>

---@class TableBody: WithAttr A Pandoc `Table` body
---@field body List<Row> table body rows.
---@field head List<Row> intermediate head.
---@field row_head_columns integer number of columns taken up by the row head of each row.

---@alias ColSpec [[alignment: Alignment], [colWidth: number]] A pair of cell alignment and relative width.

---@class Table: Block,WithAttr A Pandoc `Table`
---@field caption Caption
---@field colspecs List<ColSpec>
---@field head TableHead
---@field bodies List<TableBody>
---@field foot TableFoot

---@alias SimpleCell Blocks

---@class SimpleTable: Block,WithAttr A Pandoc `SimpleTable` (tables in pre pandoc 2.10)
---@field caption Caption Table caption.
---@field aligns List<Alignment> Alignments of every column.
---@field widths number[] Column widths.
---@field headers List<SimpleCell> Table header row.
---@field rows List<List<SimpleCell>> Table body.

---@class Figure: Block,WithAttr A Pandoc `Figure`.
---@field content Blocks
---@field caption Caption

---@class Div: Block,WithAttr A Pandoc `Div`.
---@field content Blocks

---@class Str: Inline A Pandoc `Str`.
---@field text string

---@class Emph: Inline A Pandoc `Emph`.
---@field content Inlines

---@class Underline: Inline A Pandoc `Underline`.
---@field content Inlines

---@class Strong: Inline A Pandoc `Strong`.
---@field content Inlines

---@class Strikeout: Inline A Pandoc `Strikeout`.
---@field content Inlines

---@class Superscript: Inline A Pandoc `Superscript`.
---@field content Inlines

---@class Subscript: Inline A Pandoc `Subscript`.
---@field content Inlines

---@class SmallCaps: Inline A Pandoc `SmallCaps`.
---@field content Inlines

---@alias QuoteType "SingleQuote"|"DoubleQuote"

---@class Quoted: Inline A Pandoc `Quoted`.
---@field quotetype QuoteType
---@field content Inlines

---@alias CitationMode "AuthorInText"|"SuppressAuthor"|"NormalCitation"

---@class Citation
---@field id string
---@field mode CitationMode
---@field prefix Inlines
---@field suffix Inlines
---@field note_num integer
---@field hash integer

---@class Cite: Inline A Pandoc `Cite`.
---@field content Inlines
---@field citations List<Citation>

---@class Code: Inline,WithAttr A Pandoc `Code`.

---@class Space: Inline A Pandoc `Space`.

---@class SoftBreak: Inline A Pandoc `SoftBreak`.

---@class LineBreak: Inline A Pandoc `LineBreak`.

---@alias MathType "DisplayMath"|"InlineMath"

---@class Math: Inline A Pandoc `Math`.
---@field mathtype MathType
---@field text string

---@class RawInline: Inline A Pandoc `RawInline`.
---@field format string
---@field text string

---@class Link: Inline,WithAttr A Pandoc `Link`.
---@field content Inlines
---@field target string
---@field title string

---@class Image: Inline,WithAttr A Pandoc `Image`.
---@field caption Inlines
---@field src string
---@field title string

---@class Note: Inline A Pandoc `Note`.
---@field content Blocks

---@class Span: Inline,WithAttr A Pandoc `Span`.
---@field content Inlines

---@class Meta

---@class MetaBool
---@field bool boolean

---@class MetaString
---@field str string

---@class MetaInlines
---@field inlines Inlines

---@class MetaBlocks
---@field blocks Blocks

---@class MetaList
---@field meta_values List<MetaValue>

---@class MetaMap
---@field key_value_map table<string,MetaValue>

---@alias MetaValue MetaBool | MetaString | MetaInlines | MetaBlocks | MetaList | MetaMap

---@class Doc
---@field blocks Blocks
---@field meta Meta

---@class ChunkedDoc
---@field chunks Chunk[] List of chunks that make up the document.
---@field meta Meta The document’s metadata.
---@field toc table Table of contents information.

---@class Chunk
---@field heading Inline[] Heading text.
---@field id string Identifier.
---@field level integer Level of topmost heading in chunk.
---@field number integer Chunk number.
---@field section_number string Hierarchical section number.
---@field path string Target filepath for this chunk.
---@field up Chunk|nil Link to the enclosing section, if any.
---@field prev Chunk|nil Link to the previous section, if any.
---@field next Chunk|nil Link to the next section, if any.
---@field unlisted boolean Whether the section in this chunk should be listed in the TOC even if the chunk has no section number.
---@field contents Block[] The chunk’s block contents.

---@alias InlineFilterResult nil|Inline|Inlines|EmptyList
---@alias BlockFilterResult nil|Block|Blocks|EmptyList

---@class Filter
---@field traverse?       "topdown"|"typewise" Traversal order of this filter (default: `typewise`).
---@field Pandoc?         fun(doc: Doc): Doc|nil `nil` = leave untouched.
---@field Blocks?         fun(blocks: List): BlockFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Inlines?        fun(inlines: List): BlockFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Plain?          fun(plain: Plain): BlockFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Para?           fun(para: Para): BlockFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field LineBlock?      fun(lineblock: LineBlock): BlockFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field RawBlock?       fun(rawblock: RawBlock): BlockFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field OrderedList?    fun(orderedlist: OrderedList): BlockFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field BulletList?     fun(bulletlist: BulletList): BlockFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field DefinitionList? fun(definitionlist: DefinitionList): BlockFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Header?         fun(header: Header): BlockFilterResult `nil` = leave untouched, `EmptyList` = delete. `nil` = leave untouched, `EmptyList` = delete.
---@field HorizontalRule? fun(): BlockFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Table?          fun(): BlockFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Figure?         fun(): BlockFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Div?            fun(div: Div): BlockFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Str?            fun(str: Str): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Emph?           fun(emph: Emph): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Underline?      fun(underline: Underline): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Strong?         fun(strong: Strong): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Strikeout?      fun(strikeout: Strikeout): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Superscript?    fun(superscript: Superscript): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Subscript?      fun(subscript: Subscript): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field SmallCaps?      fun(smallcaps: SmallCaps): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Quoted?         fun(quoted: Quoted): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Cite?           fun(cite: Cite): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Code?           fun(code: Code): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Space?          fun(): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field SoftBreak?      fun(): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field LineBreak?      fun(): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Math?           fun(): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field RawInline?      fun(rawinline: RawInline): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Link?           fun(link: Link): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Image?          fun(image: Image): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Note?           fun(note: Note): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.
---@field Span?           fun(span: Span): InlineFilterResult `nil` = leave untouched, `EmptyList` = delete.

---@class Template An opaque object holding a compiled template.

---@class LogMessage A pandoc log message. It has no fields, but can be converted to a string via `tostring`.
---@alias VerbosityLevelType "INFO"|"WARNING"|"ERROR"

---@class CommonState The state used by pandoc to collect information and make it available to readers and writers.
---@field input_files? string[] List of input files from command line.
---@field output_file? string|nil Output file from command line.
---@field log? LogMessage[] A list of log messages in reverse order.
---@field request_headers? table Headers to add for HTTP requests; table with header names as keys and header contents as value.
---@field resource_path? string[] Path to search for resources like included images.
---@field source_url? string|nil Absolute URL or directory of first source file.
---@field user_data_dir? string|nil Directory to search for data files.
---@field trace? boolean Whether tracing messages are issued.
---@field verbosity? VerbosityLevelType Verbosity level; one of INFO, WARNING, ERROR.

---@class ReaderOptions
---@field abbreviations? string[] Set of known abbreviations.
---@field columns? integer Number of columns in terminal.
---@field default_image_extension? string Default extension for images.
---@field extensions? string[] String representation of the syntax extensions bit field.
---@field indented_code_classes? string[] Default classes for indented code blocks.
---@field standalone? boolean Whether the input was a standalone document with header.
---@field strip_comments? boolean HTML comments are stripped instead of parsed as raw HTML.
---@field tab_stop? integer Width (i.e. equivalent number of spaces) of tab stops.
---@field track_changes? string Track changes setting for docx; one of accept-changes, reject-changes, and all-changes.

---@class Input The raw input to be parsed by a custom `Reader`, as a list of sources. Use `tostring` to get a string version of the input.

---@alias Reader fun(input: Input, options?: ReaderOptions): Doc

---@alias CiteMethodType "citeproc"|"natbib"|"biblatex"
---@alias EmailObfuscationType "none"|"references"|"javascript"
---@alias HtmlMathMethodType "plain"|"gladtex"|"webtex"|"mathml"|"mathjax"
---@alias ReferenceLocationType "end-of-block"|"end-of-section"|"end-of-document"|"block"|"section"|"document"
---@alias TopLevelDivisionType "top-level-part"|"top-level-chapter"|"top-level-section"|"top-level-default"|"part"|"chapter"|"section"|"default"
---@alias WrapTextType "wrap-auto"|"wrap-none"|"wrap-preserve"|"auto"|"none"|"preserve"

---@class WriterOptions
---@field chunk_template? string Template used to generate chunked HTML filenames.
---@field cite_method? string How to print cites – one of `citeproc`, `natbib`, or `biblatex`.
---@field columns? integer Characters in a line (for text wrapping).
---@field dpi? integer DPI for pixel to/from inch/cm conversions.
---@field email_obfuscation? string How to obfuscate emails – one of `none`, `references`, or `javascript`.
---@field epub_chapter_level? integer Header level for chapters, i.e., how the document is split into separate files.
---@field epub_fonts? string[] Paths to fonts to embed (sequence of strings).
---@field epub_metadata? string|nil Metadata to include in EPUB.
---@field epub_subdirectory? string Subdir for epub in OCF.
---@field extensions? string[] Markdown extensions that can be used.
---@field highlight_style? table|nil Style to use for highlighting; see the output of pandoc `--print-highlight-style=...` for an example structure. The value nil means that no highlighting is used.
---@field html_math_method? HtmlMathMethodType|table How to print math in HTML; one `plain`, `gladtex`, `webtex`, `mathml`, `mathjax`, or a table with keys method and url.
---@field html_q_tags? boolean Use `<q>` tags for quotes in HTML.
---@field identifier_prefix? string Prefix for section & note ids in HTML and for footnote marks in markdown.
---@field incremental? boolean True if lists should be incremental.
---@field listings? boolean Use listings package for code.
---@field number_offset? integer[] Starting number for section, subsection, …
---@field number_sections? boolean Number sections in LaTeX.
---@field prefer_ascii? boolean Prefer ASCII representations of characters when possible.
---@field reference_doc? string Path to reference document if specified.
---@field reference_links? boolean Use reference links in writing markdown, rst.
---@field reference_location? ReferenceLocationType Location of footnotes and references for writing markdown; one of `end-of-block`, `end-of-section`, `end-of-document`. The common prefix may be omitted when setting this value.
---@field section_divs? boolean Put sections in div tags in HTML.
---@field setext_headers? boolean Use setext headers for levels 1-2 in markdown.
---@field slide_level integer Force header level of slides.
---@field tab_stop? integer Tabstop for conversion btw spaces and tabs.
---@field table_of_contents? boolean Include table of contents.
---@field template? Template Template to use.
---@field toc_depth? integer Number of levels to include in TOC.
---@field top_level_division? TopLevelDivisionType Type of top-level divisions; one of `top-level-part`, `top-level-chapter`, `top-level-section`, or `top-level-default`. The prefix `top-level` may be omitted when setting this value.
---@field variables? table Variables to set in template; string-indexed table.
---@field wrap_text? WrapTextType Option for wrapping text; one of `wrap-auto`, `wrap-none`, or `wrap-preserve`. The `wrap-` prefix may be omitted when setting this value.

---@alias Writer fun(doc: Doc, options: WriterOptions): string

---The state of an extension (enabled, disabled, or default state)
---@alias ExtensionState
---| '"enable"'  # extension enabled
---| true        # extension enabled
---| '"disable"' # extension disabled
---| false       # extension disabled
---| nil         # default state

---@class FormatTable Used as eventual second argument of `pandoc.read`.
---@field format string
---@field extensions table<string,ExtensionState>

---A document source (local file path or URI)
---@alias Source string

---@class pandoc
---@field AlignCenter string
---@field AlignDefault string
---@field AlignLeft string
---@field AlignRight string
---@field Attr fun(identifier?: string, classes?: string[], attributes: table<string,string>): Attr `Attr` constructor.
---field AttributeList fun(attributes: table<string,string>): userdata
---@field AuthorInText string
---field Block
---@field BlockQuote fun(content: Blocks): BlockQuote `BlockQuote` constructor.
---@field Blocks fun(blocks: Block[]): Blocks Creates a `Blocks` list.
---@field BulletList fun(items: List<Blocks>): BulletList `BulletList` constructor.
---@field Cell fun(content: Blocks): Cell `Cell` (of `Table`) constructor.
---@field Citation fun()
---@field Cite fun(content: Inlines, citations: List<Citation>): Cite `Cite` constructor.
---@field Code fun(text: string, attr?: Attr): Code `Code` constructor.
---@field CodeBlock fun(text: string, attr?: Attr): CodeBlock `CodeBlock` constructor.
---@field Decimal string
---@field DefaultDelim string
---@field DefaultStyle string
---@field DefinitionList fun(content: List<DefinitionListItem>): DefinitionList `DefinitionList` constructor.
---@field DisplayMath string
---@field Div fun(content: Blocks, attr?: Attr): Div `Div` constructor.
---@field DoubleQuote string
---@field Emph fun(content: Inlines): Emph `Emph` constructor.
---@field Example string
---@field Figure fun(content: Blocks, caption?: Caption, attr?: Attr): Figure `Figure` constructor.
---@field Header fun(level: integer, content: Inlines, attr?: Attr): Header `Header` constructor.
---@field HorizontalRule fun(): HorizontalRule `HorizontalRule` constructor.
---@field Image fun(caption: Inlines, src: string, title?: string, attr?: Attr): Image `Image` constructor.
---field Inline
---@field InlineMath string
---@field Inlines fun(inlines: Inline[]): Inlines Creates an `Inlines` list.
---@field LineBlock fun(content: List<Inlines>): LineBlock `LineBlock` constructor.
---@field LineBreak fun(): LineBreak `LineBreak` constructor.
---@field Link fun(content: Inlines, target: string, title?: string, attr?: Attr): Link `Link` constructor.
---@field List fun(items: table): List `List` constructor
---@field ListAttributes fun(start?: integer, style?: ListNumberStyle, delimiter?: ListNumberDelim): ListAttributes `ListAttributes` constructor.
---@field LowerAlpha string
---@field LowerRoman string
---@field Math fun(mathtype: MathType): Math `Math` constructor.
---@field Meta fun(meta_maps: table<string,MetaValue>):Meta `Meta` object constructor.
---@field MetaBlocks fun(blocks: Blocks): MetaBlocks `MetaBlocks` constructor.
---@field MetaBool fun(bool: boolean): MetaBool `MetaBool` constructor.
---@field MetaInlines fun(inlines: Inlines): MetaInlines `MetaInlines` constructor.
---@field MetaList fun(meta_values: List<MetaValue>): MetaList `MetaList` constructor.
---@field MetaMap fun(key_value_map: table<string,MetaValue>): MetaMap `MetaMap` constructor.
---@field MetaString fun(str: string): MetaString `MetaString` constructor.
---@field NormalCitation string
---@field Note fun(content: Blocks): Note `Note` constructor.
---@field OneParen string
---@field OrderedList fun(items: List<Blocks>, listAttributes?: ListAttributes): OrderedList `OrderedList` constructor.
---@field Pandoc fun(blocks: Blocks, meta?: Meta): Doc Pandoc document constructor.
---@field Para fun(content: Inlines): Para `Para` constructor.
---@field Period string
---@field Plain fun(content: Inlines): Plain `Plain` constructor.
---@field Quoted fun(quotetype: QuoteType, content: Inlines): Quoted `Quoted` constructor.
---@field RawBlock fun(format: string, text: string): RawBlock `RawBlock` constructor.
---@field RawInline fun(format: string, text: string): RawInline `RawInline` constructor.
---@field ReaderOptions fun(opts: ReaderOptions): ReaderOptions `ReaderOptions` constructor.
---@field Row fun(cells: List<Cell>, attr?: Attr): Row `Table` row constructor.
---@field SimpleTable fun(caption: Caption, aligns: List<Alignment>, widths: List<number>, headers: List<Blocks>, rows: List<List<Blocks>>): SimpleTable `SimpleTable` (pre Pandoc 2.10) constructor.
---@field SingleQuote string
---@field SmallCaps fun(content: Inlines): SmallCaps `SmallCaps` constructor.
---@field SoftBreak fun(): SoftBreak `SoftBreak` constructor.
---@field Space fun(): Space `Space` constructor.
---@field Span fun(content: Inlines, attr?: Attr): Span `Span` constructor.
---@field Str fun(text: string): Str `Str` constructor.
---@field Strikeout fun(content: Inlines): Strikeout `Strikeout` constructor.
---@field Strong fun(content: Inlines): Strong `Strong` constructor.
---@field Subscript fun(content: Inlines): Subscript `Subscript` constructor.
---@field Superscript fun(content: Inlines): Superscript `Superscript` constructor.
---@field SuppressAuthor string
---@field Table fun(caption: Caption, colspecs: List<ColSpec>, head: TableHead, bodies: List<TableBody>, foot: TableFoot, attr?: Attr): Table `Table` constructor.
---@field TableFoot fun(rows?: List<Row>, attr?: Attr): TableFoot `TableFoot` constructor.
---@field TableHead fun(rows?: List<Row>, attr?: Attr): TableHead `TableHead` constructor.
---@field TwoParens string
---@field Underline fun(content: Inlines): Strikeout `Strikeout` constructor.
---@field UpperAlpha string
---@field UpperRoman string
---@field WriterOptions fun(opts: WriterOptions): WriterOptions `WriterOptions` constructor.
---@field cli PandocCliModule
---@field format PandocFormatModule
---@field json PandocJsonModule
---@field layout PandocLayoutModule
---@field mediabag PandocMediabagModule
---@field path PandocPathModule
---@field pipe fun(command: string, args: string[], input: string): string
---@field read fun(markup: string|Source[], format?: string|FormatTable, reader_options?: ReaderOptions): Doc Parse the given string into a Pandoc document.
---@field readers table<string,boolean> Set of formats that pandoc can parse. All keys in this table can be used as the `format` value in `pandoc.read`.
---@field scaffolding PandocScaffoldingModule
---@field sha1 fun(input: string): string Computes the SHA1 hash of the given string input.
---@field structure PandocStructureModule
---@field system PandocSystemModule
---@field template PandocTemplateModule
---@field text PandocTextModule
---@field types PandocTypesModule
---@field utils PandocUtilsModule
---@field walk_block fun(element: Block, filter: Filter): BlockFilterResult
---@field walk_inline fun(element: Inline, filter: Filter): InlineFilterResult
---@field write fun(doc: Doc, format?:string|FormatTable, writer_options?: WriterOptions): string Converts a document to the given target format.
---@field write_classic fun(doc: Doc, writer_options?: WriterOptions): string Runs a classic custom Lua writer, using the functions defined in the current environment.
---@field writers table<string,boolean> Set of formats that pandoc can generate. All keys in this table can be used as the `format` value in `pandoc.write`.
---@field zip PandocZipModule

---@class PandocCliModule
---@field parse_options fun(args: string[]): table<string,string> Parses command line arguments into pandoc options. Typically this function will be used in stand-alone pandoc Lua scripts, taking the list of arguments from the global `arg`.
---@field default_options table<string,any> Default CLI options, using a JSON-like representation.
---@field repl fun(env: table<string,string>): any Starts a read-eval-print loop (REPL). The function returns all values of the last evaluated input.

---@class PandocUtilsModule
---@field normalize_date
---@field run_json_filter
---@field Version
---@field sha1
---@field blocks_to_inlines
---@field to_simple_table
---@field make_sections
---@field stringify
---@field from_simple_table
---@field citeproc
---@field equals
---@field type
---@field to_roman_numeral
---@field references

---@class PandocFormatModule
---@field extensions
---@field default_extensions
---@field from_path
---@field all_extensions

---@class PandocJsonModule
---@field decode
---@field encode
---@field null

---@class PandocLayoutModule
---@field parens
---@field nest
---@field concat
---@field cblock
---@field height
---@field render
---@field nowrap
---@field flush
---@field min_offset
---@field braces
---@field rblock
---@field before_non_blank
---@field blankline
---@field vfill
---@field nestle
---@field after_break
---@field prefixed
---@field inside
---@field double_quotes
---@field hang
---@field cr
---@field is_empty
---@field brackets
---@field update_column
---@field empty
---@field blanklines
---@field offset
---@field space
---@field real_length
---@field lblock
---@field quotes
---@field chomp
---@field literal

---@class PandocMediabagModule
---@field list
---@field empty
---@field fetch
---@field fill
---@field items
---@field delete
---@field lookup
---@field write
---@field insert

---@class PandocPathModule
---@field split_extension
---@field join
---@field filename
---@field is_relative
---@field is_absolute
---@field directory
---@field split
---@field separator
---@field make_relative
---@field normalize
---@field treat_strings_as_paths
---@field split_search_path
---@field search_path_separator

---Scaffolding for custom writers.
---@class PandocScaffoldingModule
---@field Writer

---Access to the higher-level document structure, including hierarchical sections and the table of contents.
---@class PandocStructureModule
---@field make_sections
---@field table_of_contents
---@field slide_level
---@field split_into_chunks

---@class PandocSystemModule
---@field list_directory
---@field make_directory
---@field environment
---@field get_working_directory
---@field with_temporary_directory
---@field os
---@field with_environment
---@field arch
---@field with_working_directory
---@field remove_directory
---@field cputime

---@class PandocTextModule
---@field lower
---@field reverse
---@field fromencoding
---@field len
---@field upper
---@field toencoding
---@field sub

---@class PandocTemplateModule
---@field meta_to_context
---@field compile
---@field default
---@field apply

---@class PandocTypesModule
---@field Version

---@class PandocZipModule
---@field Archive
---@field Entry
---@field read_entry
---@field zip
