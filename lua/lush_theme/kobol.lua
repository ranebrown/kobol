local lush = require "lush"
local hsl = lush.hsl

local c = {
    bg = hsl(202, 32, 15),

    fg = hsl(219, 28, 88),
    fgd1 = hsl(215, 13, 72),
    fgd2 = hsl(206, 11, 45),
    fgd3 = hsl(200, 16, 36),
    fgd4 = hsl(195, 20, 31),

    -- base colors
    red = hsl(357, 79, 65),
    orange = hsl(21, 93, 66),
    yellow = hsl(40, 94, 68),
    green = hsl(114, 31, 68),
    blue = hsl(210, 50, 60),
    aqua = hsl(180, 36, 54),
    lilac = hsl(300, 30, 68),
    brown = hsl(16, 29, 54),

    -- other colors
    bg_blue = hsl(202, 31, 34), -- match paren
    bg_sel = hsl(201, 32, 27), -- visual selection
}

c.fg_comm = c.fgd2 -- comments
c.bg_d1 = c.bg.darken(12) -- color column, tabline
c.bg_l1 = c.bg.lighten(8) -- pmenu selected

if vim.o.background == "light" then
    c.bg = hsl(211, 51, 88)
end

---@diagnostic disable: undefined-global
local theme = lush(function()
    return {
        -- :h highlight-groups
        --
        -- Referenced/linked groups must come before being referenced/linked
        --
        -- Leaving a group table empty disables styling for that group (meaning
        -- they mostly get styled as Normal) Not setting a group uses the Not
        -- setting a group uses the nvim default.

        Comment { fg = c.fg_comm, gui = "italic" }, -- any comment
        ColorColumn { bg = c.bg_d1 }, -- used for the columns set with 'colorcolumn'
        Conceal { fg = c.lilac }, -- placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor { fg = c.fg, gui = "inverse" }, -- character under the cursor
        -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
        -- CursorColumn { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        -- CursorLine   { }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
        -- Directory    { }, -- directory names (and other special names in listings)
        -- DiffAdd      { }, -- diff mode: Added line |diff.txt|
        -- DiffChange   { }, -- diff mode: Changed line |diff.txt|
        -- DiffDelete   { }, -- diff mode: Deleted line |diff.txt|
        -- DiffText     { }, -- diff mode: Changed text within a changed line |diff.txt|
        -- EndOfBuffer  { }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
        -- TermCursor   { }, -- cursor in a focused terminal
        -- TermCursorNC { }, -- cursor in an unfocused terminal
        -- ErrorMsg     { }, -- error messages on the command line
        -- VertSplit    { }, -- the column separating vertically split windows
        -- Folded       { }, -- line used for closed folds
        -- FoldColumn   { }, -- 'foldcolumn'
        -- SignColumn   { }, -- column where |signs| are displayed
        IncSearch { fg = c.fg, bg = c.blue }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        -- Substitute   { }, -- |:substitute| replacement text highlighting
        -- LineNr       { }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        -- CursorLineNr { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        MatchParen { bg = c.bg_blue }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
        -- MsgArea      { }, -- Area for messages and cmdline
        -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        -- MoreMsg      { }, -- |more-prompt|
        -- NonText      { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Normal { fg = c.fg, bg = c.bg }, -- normal text
        -- NormalFloat  { }, -- Normal text in floating windows.
        -- NormalNC     { }, -- normal text in non-current windows
        Pmenu { bg = c.bg_l1 }, -- Popup menu: normal item.
        PmenuSel { fg = c.bg, bg = c.blue }, -- Popup menu: selected item.
        -- PmenuSbar    { }, -- Popup menu: scrollbar.
        -- PmenuThumb   { }, -- Popup menu: Thumb of the scrollbar.
        -- Question     { }, -- |hit-enter| prompt and yes/no questions
        -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        -- Search       { }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
        -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
        SpellBad { fg = c.red, gui = "undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        SpellCap { fg = c.yellow, gui = "undercurl" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        SpellLocal { fg = c.blue, gui = "undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        SpellRare { fg = c.lilac, gui = "undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
        -- StatusLine   { }, -- status line of current window
        -- StatusLineNC { }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        -- TabLine      { }, -- tab pages line, not active tab page label
        -- TabLineFill  { }, -- tab pages line, where there are no labels
        -- TabLineSel   { }, -- tab pages line, active tab page label
        -- Title        { }, -- titles for output from ":set all", ":autocmd" etc.
        Visual { bg = c.bg_sel }, -- Visual mode selection
        -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
        -- WarningMsg   { }, -- warning messages
        -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        WildMenu { PmenuSel }, -- current match in 'wildmenu' completion

        -- These groups are not listed as default vim groups,
        -- but they are defacto standard group names for syntax highlighting.
        -- commented out groups should chain up to their "preferred" group by
        -- default,
        -- Uncomment and edit if you want more specific syntax highlighting.

        Constant { fg = c.aqua }, -- (preferred) any constant
        String { fg = c.green }, --   a string constant: "this is a string"
        Character { fg = c.green }, --  a character constant: 'c', '\n'
        Number { fg = c.orange }, --   a number constant: 234, 0xff
        Boolean { fg = c.red }, --  a boolean constant: TRUE, false
        Float { fg = c.orange }, --    a floating point constant: 2.3e10

        Identifier { fg = c.lilac }, -- (preferred) any variable name
        Function { fg = c.blue }, -- function name (also: methods for classes)

        Statement { fg = c.lilac }, -- (preferred) any statement
        -- Conditional    { }, --  if, then, else, endif, switch, etc.
        -- Repeat         { }, --   for, do, while, etc.
        -- Label          { }, --    case, default, etc.
        -- Operator       { }, -- "sizeof", "+", "*", etc.
        -- Keyword        { }, --  any other keyword
        -- Exception      { }, --  try, catch, throw

        PreProc { fg = c.aqua }, -- (preferred) generic Preprocessor
        -- Incldde        { }, --  preprocessor #include
        -- Define         { }, --   preprocessor #define
        -- Macro          { }, --    same as Define
        -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

        Type { fg = c.yellow }, -- (preferred) int, long, char, etc.
        -- StorageClass   { }, -- static, register, volatile, etc.
        -- Structure      { }, --  struct, union, enum, etc.
        Typedef { fg = c.aqua }, --  A typedef

        Special { fg = c.aqua }, -- (preferred) any special symbol
        -- SpecialChar    { }, --  special character in a constant
        -- Tag            { }, --    you can use CTRL-] on this
        -- Delimiter      { }, --  character that needs attention
        -- SpecialComment { }, -- special things inside a comment
        -- Debug          { }, --    debugging statements

        Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
        Bold { gui = "bold" },
        Italic { gui = "italic" },
        BoldItalic = { gui = "bolditalic" },
        Strikethrough = { sp = "strikethrough" },
        Undercurl = { sp = "undercurl" },

        -- ("Ignore", below, may be invisible...)
        -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

        -- Error          { }, -- (preferred) any erroneous construct

        -- Todo           { }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        -- :h lsp-highlight
        -- LspReferenceText({}), -- used for highlighting "text" references
        -- LspReferenceRead({}), -- used for highlighting "read" references
        -- LspReferenceWrite({}), -- used for highlighting "write" references
        -- LspCodeLens({}), -- Used to color the virtual text of the codelens.
        -- LspCodeLensSeparator({}), -- Used to color the seperator between two or more code lens.
        -- LspSignatureActiveParameter({}), -- Used to highlight the active parameter in the signature help.

        -- :h diagnostic-highlights
        -- DiagnosticError({}), -- Used as the base highlight group.
        -- DiagnosticWarn({}), -- Used as the base highlight group.
        -- DiagnosticInfo({}), -- Used as the base highlight group.
        -- DiagnosticHint({}), -- Used as the base highlight group.
        -- DiagnosticVirtualTextError({}), -- Used for "Error" diagnostic virtual text.
        -- DiagnosticVirtualTextWarn({}), -- Used for "Warn" diagnostic virtual text.
        -- DiagnosticVirtualTextInfo({}), -- Used for "Info" diagnostic virtual text.
        -- DiagnosticVirtualTextHint({}), -- Used for "Hint" diagnostic virtual text.
        -- DiagnosticUnderlineError({}), -- Used to underline "Error" diagnostics.
        -- DiagnosticUnderlineWarn({}), -- Used to underline "Warn" diagnostics.
        -- DiagnosticUnderlineInfo({}), -- Used to underline "Info" diagnostics.
        -- DiagnosticUnderlineHint({}), -- Used to underline "Hint" diagnostics.
        -- DiagnosticFloatingError({}), -- Used to color "Error" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingWarn({}), -- Used to color "Warn" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingInfo({}), -- Used to color "Info" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingHint({}), -- Used to color "Hint" diagnostic messages in diagnostics float.
        -- DiagnosticSignError({}), -- Used for "Error" signs in sign column.
        -- DiagnosticSignWarn({}), -- Used for "Warn" signs in sign column.
        -- DiagnosticSignInfo({}), -- Used for "Info" signs in sign column.
        -- DiagnosticSignHint({}), -- Used for "Hint" signs in sign column.

        -- :h nvim-treesitter-highlights
        -- TSAttribute({}), -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
        -- TSBoolean({}), -- Boolean literals: `True` and `False` in Python.
        -- TSCharacter({}), -- Character literals: `'a'` in C.
        -- TSComment({}), -- Line comments and block comments.
        -- TSConditional({}), -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
        -- TSConstant({}), -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
        -- TSConstBuiltin({}), -- Built-in constant values: `nil` in Lua.
        -- TSConstMacro({}), -- Constants defined by macros: `NULL` in C.
        -- TSConstructor({}), -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
        -- TSError({}), -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
        -- TSException({}), -- Exception related keywords: `try`, `except`, `finally` in Python.
        -- TSField({}), -- Object and struct fields.
        -- TSFloat({}), -- Floating-point number literals.
        -- TSFunction({}), -- Function calls and definitions.
        -- TSFuncBuiltin({}), -- Built-in functions: `print` in Lua.
        -- TSFuncMacro({}), -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
        -- TSInclude({}), -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
        -- TSKeyword({}), -- Keywords that don't fit into other categories.
        -- TSKeywordFunction({}), -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
        -- TSKeywordOperator({}), -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
        -- TSKeywordReturn({}), -- Keywords like `return` and `yield`.
        -- TSLabel({}), -- GOTO labels: `label:` in C, and `::label::` in Lua.
        -- TSMethod({}), -- Method calls and definitions.
        -- TSNamespace({}), -- Identifiers referring to modules and namespaces.
        -- TSNone({}), -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
        -- TSNumber({}), -- Numeric literals that don't fit into other categories.
        -- TSOperator({}), -- Binary or unary operators: `+`, and also `->` and `*` in C.
        -- TSParameter({}), -- Parameters of a function.
        -- TSParameterReference({}), -- References to parameters of a function.
        -- TSProperty({}), -- Same as `TSField`.
        -- TSPunctDelimiter({}), -- Punctuation delimiters: Periods, commas, semicolons, etc.
        -- TSPunctBracket({}), -- Brackets, braces, parentheses, etc.
        -- TSPunctSpecial({}), -- Special punctuation that doesn't fit into the previous categories.
        -- TSRepeat({}), -- Keywords related to loops: `for`, `while`, etc.
        -- TSString({}), -- String literals.
        -- TSStringRegex({}), -- Regular expression literals.
        -- TSStringEscape({}), -- Escape characters within a string: `\n`, `\t`, etc.
        -- TSStringSpecial({}), -- Strings with special meaning that don't fit into the previous categories.
        -- TSSymbol({}), -- Identifiers referring to symbols or atoms.
        -- TSTag({}), -- Tags like HTML tag names.
        -- TSTagAttribute({}), -- HTML tag attributes.
        -- TSTagDelimiter({}), -- Tag delimiters like `<` `>` `/`.
        -- TSText({}), -- Non-structured text. Like text in a markup language.
        -- TSStrong({}), -- Text to be represented in bold.
        -- TSEmphasis({}), -- Text to be represented with emphasis.
        -- TSUnderline({}), -- Text to be represented with an underline.
        -- TSStrike({}), -- Strikethrough text.
        -- TSTitle({}), -- Text that is part of a title.
        -- TSLiteral({}), -- Literal or verbatim text.
        -- TSURI({}), -- URIs like hyperlinks or email addresses.
        -- TSMath({}), -- Math environments like LaTeX's `$ ... $`
        -- TSTextReference({}), -- Footnotes, text references, citations, etc.
        -- TSEnvironment({}), -- Text environments of markup languages.
        -- TSEnvironmentName({}), -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
        -- TSNote({}), -- Text representation of an informational note.
        -- TSWarning({}), -- Text representation of a warning note.
        -- TSDanger({}), -- Text representation of a danger note.
        -- TSType({}), -- Type (and class) definitions and annotations.
        -- TSTypeBuiltin({}), -- Built-in types: `i32` in Rust.
        -- TSVariable({}), -- Variable names that don't fit into other categories.
        -- TSVariableBuiltin({}), -- Variable names defined by the language: `this` or `self` in Javascript.
    }
end)

-- return our parsed theme for extension or use else where.
return theme
