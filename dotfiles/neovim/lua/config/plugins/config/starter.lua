local dashboard = require("mini.starter")
local config = {}
config.header = table.concat({
    "                                                      ",
    "                                                      ",
    "███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    "████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    "██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    "██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    "██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    "╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    "                                                      ",
    "                                                      ",
}, "\n")
local function section_button(section)
    local function button(key, name, action)
        -- local pad = string.rep(" ", 54 / 2)
        local function pad(s)
            local padstart = string.rep("=", math.floor((54 - #s) / 2))
            local padend = string.rep("=", math.ceil((54 - #s) / 2))
            return padstart .. s .. padend
        end
        return {
            name = name,
            action = action,
            section = pad(section),
        }
    end
    return button
end

config.items = {
    section_button("Files")("e", "   New file", "ene"),
    section_button("Files")("f", "   Find File", "Telescope file_browser"),
    section_button("Files")("p", "   Projects", "Telescope projects"),
    section_button("Config")("v", "   Open NeoVim Config", "e $MYVIMRC"),
    section_button("Plugins")("l", "💤  Show plugins", "Lazy show"),
    section_button("Plugins")("m", "💤  Show Mason", "Mason"),
    section_button("Plugins")("u", "   Update plugins", "Lazy sync"),
    section_button("Actions")("q", "   Quit NVIM", "qa"),
}

local dashboard_footer_quotes = {
    "“You should name a variable using the same care with which you name a first-born child.” — Robert C. Martin",
    "“A long descriptive name is better than a short enigmatic name. A long descriptive name is better than a long descriptive comment.”—Robert C. Martin",
    "“Code that communicates its purpose is very important. I often refactor just when I’m reading some code. That way, as I gain understanding about the program, I embed that understanding into the code for later so I don’t forget what I learned.” — Martin Fowler",
    "“If you have to spend effort looking at a fragment of code and figuring out what it’s doing, then you should extract it into a function and name the function after the what.” — Martin Fowler",
    "“Any code of your own that you haven’t looked at for six or more months might as well have been written by someone else.” — Eagleson’s Law",
    "“Every time you write a comment, you should grimace and feel the failure of your ability of expression.” — Robert C. Martin",
    "“When you see commented-out code, delete it! — Robert C. Martin",
    "“Obsolete comments are worse than no comments.” — Douglas Crockford",
    "“Comments are often lies waiting to happen. Code should speak for itself whenever possible.” — Michael Toppa",
    "“Programmers must avoid leaving false clues that obscure the meaning of code.” — Robert C. Martin",
    "“Clean code always looks like it was written by someone who cares.” — Robert C. Martin",
    "“Simplicity is prerequisite for reliability.” — Edsger W. Dijkstra",
    "“If you’re good at the debugger it means you spent a lot of time debugging. I don’t want you to be good at the debugger.” — Robert C. Martin",
    "“Clean code is not written by following a set of rules. You don’t become a software craftsman by learning a list of heuristics. Professionalism and craftsmanship come from values that drive disciplines.” — Robert C. Martin",
    "“There are two parts to learning craftsmanship: knowledge and work. You must gain the knowledge of principles, patterns, practices, and heuristics that a craftsman knows, and you must also grind that knowledge into your fingers, eyes, and gut by working hard and practicing.” — Robert C. Martin",
    "“Your obligation is that of active participation. You should not act as knowledge-absorbing sponges, but as whetstones on which we can all sharpen our wits.” — Edsger W. Dijkstra",
    "“Practice, Practice, Practice! Musicians don’t only play when they are on stage in front of an audience.”— Michael Toppa",
    "“You are responsible for the quality of your code. Not your client. Not your boss. […] You don’t go to the doctor and say: You know what doc? I’m in a hurry, why won’t you skip washing your hands?”— Michael Toppa",
    "“So much complexity in software comes from trying to make one thing do two things.” — Ryan Singer",
    "“The secret of getting ahead is getting started. The secret of getting started is breaking your complex overwhelming tasks into small manageable tasks, and then start on the first one.” — Mark Twain",
    "“Sometimes it is the people no one imagines anything of who do the things that no one can imagine” - Alan Turing",
    "",
}
-- Custom random function because random function in lua is not random at all for whatever reason
local rnd = vim.fn.localtime() % 0x10000
function Random(n)
    rnd = (rnd * 31421 + 6927) % 0x10000
    local tmp = (rnd * n / 0x10000)
    return tmp - (tmp % 1)
end
function split_string(input, max_length)
    local words = {}
    if input == nil then
        return words
    end
    local current_word = ""
    local current_length = 0

    for word in input:gmatch("%S+") do
        local word_length = #word
        if current_length + word_length + 1 > max_length then
            table.insert(words, current_word)
            current_word = word
            current_length = word_length
        else
            current_word = current_word .. " " .. word
            current_length = current_length + word_length + 1
        end
    end
    table.insert(words, current_word) -- Add the last word

    return words
end
local quote = split_string(dashboard_footer_quotes[Random(#dashboard_footer_quotes)], 54)
config.footer = table.concat(quote, "\n")

config.content_hooks = {
    -- dashboard.gen_hook.adding_bullet(string.rep(" ", 22) .. "░ ", false),
    dashboard.gen_hook.aligning("center", "center"),
}

dashboard.setup(config)
