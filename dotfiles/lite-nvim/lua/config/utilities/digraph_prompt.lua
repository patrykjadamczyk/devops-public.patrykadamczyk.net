-- Add Digraph Prompt just to make it easier to search for digraphs
function digraph_prompt()
    local function get_digraph_from_doc()
      local digraph_doc = vim.fn.expand("$VIMRUNTIME/doc/digraph.txt")
      local ok, f_lines = pcall(io.lines, digraph_doc)
      if ok then
        local lines = {}
        local line_number = 1
        local table_found = false
        for line in f_lines do
          if string.match(line, "digraph%-table%-mbyte") then
            table_found = true
            line_number = 1
          elseif
            table_found
            and not string.match(line, "official name")
            and not (line == "")
            and not string.match(line, "vim:tw=78:ts=8:noet:ft=help:norl:")
          then
            lines[line_number] = line
            line_number = line_number + 1
          end
        end
        return lines
      end
      return {}
    end
    vim.ui.select(
    get_digraph_from_doc(),
    { prompt = "Digraphs" },
    function(selected)
      require("notify")(
        "You selected: \n"
        ..selected
        .."\nTo enter this diagraph use Ctrl+K and sequence shown above"
        .."\nNote: You need to be in insert mode to be able to enter digraphs",
        "info", {
          title = "Digraph Prompt",
          timeout = 20000,
        }
      )
    end
  )
end
