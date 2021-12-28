local lush = require "lush"
local hsl = lush.hsl

local c = require("kobol.colors").colors
local ch = require("kobol.colors").hsl_colors
local base = require "kobol.base_theme"

---@diagnostic disable: undefined-global
local plugins = lush(function()
    return {
        -- GitGutter
        GitGutterAdd { fg = c.green },
        GitGutterChange { fg = c.blue },
        GitGutterDelete { fg = c.red },
        GitGutterChangeDelete { fg = c.orange },

        -- Barbar
        BufferTabpageFill { fg = c.bg4, bg = c.bg1 },
        BufferTabpages { fg = c.bg4, gui = "bold" },
        BufferCurrent { base.TabLineSel },
        BufferCurrentMod { fg = c.green, gui = "bold" },
        BufferCurrentSign { fg = c.aqua },
        BufferVisible { fg = c.fg4, bg = c.bg1, gui = "bold" },
        BufferVisibleMod { fg = c.green, bg = c.bg1, gui = "bold" },
        BufferVisibleSign { fg = c.bg4, bg = c.bg1 },
        BufferInactive { base.TabLine },
        BufferInactiveMod { fg = "#65876d", bg = c.bg1, gui = "bold" },
        BufferInactiveSign { BufferTabpageFill },

        -- Cmp
        CmpItemAbbr { fg = c.fg4 }, -- The abbr field (portion of word that isn't the match).
        CmpItemAbbrDeprecated { fg = c.fg4, gui = "strikethrough" }, -- The deprecated item's abbr field.
        CmpItemAbbrMatch { fg = c.fg, gui = "bold" }, -- The matched characters highlight.
        CmpItemAbbrMatchFuzzy { fg = c.fg, gui = "bold" }, -- The fuzzy matched characters highlight.
        CmpItemMenu { fg = c.fg3, gui = "italic" }, -- The menu field (source e.g. [lsp])
        CmpItemKindDefault { fg = c.fg4 },
        CmpItemKindKeyword { fg = c.aqua },
        CmpItemKindVariable { fg = c.aqua },
        CmpItemKindConstant { fg = c.aqua },
        CmpItemKindReference { fg = c.lilac },
        CmpItemKindValue { fg = c.lilac },
        CmpItemKindFunction { fg = c.blue },
        CmpItemKindMethod { fg = c.blue },
        CmpItemKindConstructor { fg = c.blue },
        CmpItemKindClass { fg = c.yellow },
        CmpItemKindInterface { fg = c.yellow },
        CmpItemKindStruct { fg = c.yellow },
        CmpItemKindEvent { fg = c.yellow },
        CmpItemKindEnum { fg = c.yellow },
        CmpItemKindUnit { fg = c.yellow },
        CmpItemKindModule { fg = c.orange },
        CmpItemKindProperty { fg = c.green },
        CmpItemKindField { fg = c.green },
        CmpItemKindTypeParameter { fg = c.green },
        CmpItemKindEnumMember { fg = c.green },
        CmpItemKindOperator { fg = c.green },
        CmpItemKindSnippet { fg = c.fg4 },

        -- Notify
        NotifyERRORBorder { fg = c.red },
        NotifyWARNBorder { fg = c.yellow },
        NotifyINFOBorder { fg = c.blue },
        NotifyDEBUGBorder { fg = c.lilac },
        NotifyTRACEBorder { fg = c.green },
        NotifyERRORIcon { fg = c.red },
        NotifyWARNIcon { fg = c.yellow },
        NotifyINFOIcon { fg = c.blue },
        NotifyDEBUGIcon { fg = c.lilac },
        NotifyTRACEIcon { fg = c.green },
        NotifyERRORTitle { fg = c.red },
        NotifyWARNTitle { fg = c.yellow },
        NotifyINFOTitle { fg = c.blue },
        NotifyDEBUGTitle { fg = c.lilac },
        NotifyTRACETitle { fg = c.green },
        NotifyERRORBody { base.Normal },
        NotifyWARNBody { base.Normal },
        NotifyINFOBody { base.Normal },
        NotifyDEBUGBody { base.Normal },
        NotifyTRACEBody { base.Normal },

        -- lightspeed
        LightspeedLabel {},
        -- The character needed to be pressed to jump to the match position,
        -- after the whole search pattern has been given. It appears once the
        -- first input has been entered, right after the pair (by default), or on
        -- top of the second character (when the beacon should be squeezed into
        -- the 2-column box of the match).

        -- LightspeedLabelOverlapped {},
        -- When matches overlap, labels get next to each other - in that case
        -- they get different highlights, to be more easily distinguishable
        -- (slightly lighter or darker, depending on the global background).

        -- LightspeedLabelDistant {},
        -- LightspeedLabelDistantOverlapped {},
        -- If the number of matches exceeds the available target labels, the next
        -- group of labeled targets are shown with a different color. Those can
        -- be reached by pressing `cycle_group_fwd_key` before the label
        -- character.

        -- LightspeedShortcut {},
        -- LightspeedShortcutOverlapped {},
        -- Labels for positions that can be jumped to right after the first
        -- input (see |lightspeed-shortcuts|).
        -- These are highlighted as "inverted" labels by default
        -- (background/foreground switched).

        -- LightspeedMaskedChar {},
        -- The second character of the match, that is shown on top of the first
        -- one, as a reminder, when the beacon is squeezed into the 2-column box
        -- of the match.

        -- LightspeedGreyWash {},
        -- Foreground color of the "washed out" area for 2-character search.
        -- Depending on the colorscheme, it might be appropriate to link this to
        -- the Comment highlight group.

        -- LightspeedUnlabeledMatch {},
        -- Matches that can be jumped to automatically, i.e. do not get a label
        -- - the only ones, and the first ones if `jump_to_first_match` is on.
        -- (Bold black or white by default, depending on the global background.)

        -- LightspeedOneCharMatch {},
        -- Matching characters of f/t search. (Default: |LightspeedShortcut|
        -- without underline. Setting some background color is recommended, as
        -- there is no "grey wash" for one-character search mode.)

        -- LightspeedUniqueChar {},
        -- Unique characters in the search direction, shown if
        -- `highlight_unique_chars` is on. Uses the same settings as
        -- |LightspeedUnlabeledMatch| by default.

        -- LightspeedPendingOpArea {},
        -- When jumping based on partial input in operator-pending mode, we do
        -- not see the operation executed right away, because of the "safety"
        -- timeout (see |lightspeed-jump-on-partial-input|), therefore we set a
        -- temporary highlight on the operated area.

        LightspeedCursor { base.Cursor },
    }
end)

-- return our parsed theme for extension or use else where.
return plugins
