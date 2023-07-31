-- local ls = require("luasnip")
-- local s = ls.snippet
-- local t = ls.text_node
-- local i = ls.insert_node

-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local fmt = require("luasnip.extras.fmt").fmt
-- local extras = require("luasnip.extras")
-- local m = extras.m
-- local l = extras.l
-- local rep = extras.rep
-- local postfix = require("luasnip.extras.postfix").postfix

return {
 "L3MON4D3/LuaSnip",
  keys = function()
    return {}
  end,

-- adding snippets for cpp
opts= function()

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
	s(":cpp", {
		t({ "#include <bits/stdc++.h>", "using namespace std;","#define ll long long"," ", "void solve(){", "  " }),
		i(1),
		t({ " ", "}", " ", "int main(){", '  // cout<<"hello";',"  ios::sync_with_stdio(false);","  cin.tie(nullptr);","  int t=1;","  cin>>t;","  while(t--){","    solve();", '    cout<<"\\n";', "  }", "}" }),
	}),
})

end,
}
