return {
  "L3MON4D3/LuaSnip",
  config = function()
    require("luasnip").setup({
      history = true,
      updateevents = "TextChanged,TextChangedI",
    })

    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node

    -- Snippets

    ls.add_snippets("typst", {
      -- Math mode
      s("mm", { t("$"), i(1), t("$") }), -- `mm` → $ $
      s("sq", { t("space.quad") }), -- `sq` →  space.quad
      s("dhr", { t("#horizontalrule(dashed: true)") }), -- `dhr` →  #horizontalrule(dashed: true)
      s("hr", { t("#horizontalrule()") }), -- `hr` →  #horizontalrule()
    })

    ls.add_snippets("tex", {
      -- Math mode
      s("mk", { t("$"), i(1), t("$") }), -- `mk` → $ $
      s("dm", { t("$$"), i(1), t("$$") }), -- `dm` → $$ $$
      s("mq", { t("\\["), i(1), t("\\]") }), -- `mq` → \[\]

      -- Symbols
      s("zvec", { t("\\overline0") }), -- `zvec` → \overline0
      s("rarw", { t("\\rightarrow") }), -- `rarw` → \rightarrow
      s("larw", { t("\\leftarrow") }), -- `larw` → \leftarrow
      s("lrarw", { t("\\longrightarrow") }), -- `lrarw` → \longrightarrow
      s("llarw", { t("\\longleftarrow") }), -- `llarw` → \longleftarrow
      s("iff", { t("\\Leftrightarrow") }), -- `iff` → \Leftrightarrow
      s("liff", { t("\\Longleftrightarrow") }), -- `liff` → \Longleftrightarrow

      -- Math
      s("set", { t("\\{"), i(1), t("\\}") }), -- `set` → \{\}
      s("-ify", { t("-\\infty") }), -- `-ify` →  -\infty
      s("ify", { t("\\infty") }), -- `ify` →  \infty
      s("di", { t("\\int_{"), i(1), t("}^{"), i(2), t("} "), i(3), t(" \\,d"), i(4) }), -- `di` → \int_{}^{} \,d
      s("//", { t("\\frac{"), i(1), t("}"), t("{"), i(2), t("}") }), -- `//` → \frac{}{}

      -- Boxes
      s("dfn", { t("\\dfn{"), i(1), t("}"), t("{"), i(2), t("}") }), -- `dfn` → \dfn{}{}
      s("thm", { t("\\thm{"), i(1), t("}"), t("{"), i(2), t("}") }), -- `thm` → \thm{}{}
      s("ex", { t("\\ex{"), i(1), t("}"), t("{"), i(2), t("}") }), -- `ex` → \ex{}{}

      -- Writing
      s("tit", { t("\\textit{"), i(1), t("}") }), -- `tit` → \textit{}
      s("tbf", { t("\\textbf{"), i(1), t("}") }), -- `tbf` → \textbf{}
    })
  end,
}
