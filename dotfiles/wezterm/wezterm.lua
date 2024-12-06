---------- Imports
---@type Wezterm
local wezterm = require("wezterm")
local act = wezterm.action
-- Config return definition
---@class Config
local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

---------- My own configuration
local cfg = {
    powershell = false,
    nushell = true,
}
---------- Special Functions
local function pass()
end

local function toint(number, increment)
  if increment then
    return math.floor(number / increment) * increment
  end
  return number >= 0 and math.floor(number + 0.5) or math.ceil(number - 0.5)
end

local function mround(number, multiple)
  local remainder = number % multiple
  return number - remainder + (remainder > multiple / 2 and multiple or 0)
end

local function mergeTables(t1, t2)
    for k, v in pairs(t2) do
        t1[k] = v
    end
    return t1
end

local BatteryIcons = {
  Charging = {
    ["00"] = wezterm.nerdfonts.md_battery_alert,
    ["10"] = wezterm.nerdfonts.md_battery_charging_10,
    ["20"] = wezterm.nerdfonts.md_battery_charging_20,
    ["30"] = wezterm.nerdfonts.md_battery_charging_30,
    ["40"] = wezterm.nerdfonts.md_battery_charging_40,
    ["50"] = wezterm.nerdfonts.md_battery_charging_50,
    ["60"] = wezterm.nerdfonts.md_battery_charging_60,
    ["70"] = wezterm.nerdfonts.md_battery_charging_70,
    ["80"] = wezterm.nerdfonts.md_battery_charging_80,
    ["90"] = wezterm.nerdfonts.md_battery_charging_90,
    ["100"] = wezterm.nerdfonts.md_battery_charging_100,
  },
  Discharging = {
    ["00"] = wezterm.nerdfonts.md_battery_outline,
    ["10"] = wezterm.nerdfonts.md_battery_10,
    ["20"] = wezterm.nerdfonts.md_battery_20,
    ["30"] = wezterm.nerdfonts.md_battery_30,
    ["40"] = wezterm.nerdfonts.md_battery_40,
    ["50"] = wezterm.nerdfonts.md_battery_50,
    ["60"] = wezterm.nerdfonts.md_battery_60,
    ["70"] = wezterm.nerdfonts.md_battery_70,
    ["80"] = wezterm.nerdfonts.md_battery_80,
    ["90"] = wezterm.nerdfonts.md_battery_90,
    ["100"] = wezterm.nerdfonts.md_battery,
  },
  Full = {
    ["00"] = wezterm.nerdfonts.md_battery_outline,
    ["10"] = wezterm.nerdfonts.md_battery_10,
    ["20"] = wezterm.nerdfonts.md_battery_20,
    ["30"] = wezterm.nerdfonts.md_battery_30,
    ["40"] = wezterm.nerdfonts.md_battery_40,
    ["50"] = wezterm.nerdfonts.md_battery_50,
    ["60"] = wezterm.nerdfonts.md_battery_60,
    ["70"] = wezterm.nerdfonts.md_battery_70,
    ["80"] = wezterm.nerdfonts.md_battery_80,
    ["90"] = wezterm.nerdfonts.md_battery_90,
    ["100"] = wezterm.nerdfonts.md_battery,
  },
  Unknown = {
    ["00"] = wezterm.nerdfonts.md_battery_outline .. "?",
    ["10"] = wezterm.nerdfonts.md_battery_10 .. "?",
    ["20"] = wezterm.nerdfonts.md_battery_20 .. "?",
    ["30"] = wezterm.nerdfonts.md_battery_30 .. "?",
    ["40"] = wezterm.nerdfonts.md_battery_40 .. "?",
    ["50"] = wezterm.nerdfonts.md_battery_50 .. "?",
    ["60"] = wezterm.nerdfonts.md_battery_60 .. "?",
    ["70"] = wezterm.nerdfonts.md_battery_70 .. "?",
    ["80"] = wezterm.nerdfonts.md_battery_80 .. "?",
    ["90"] = wezterm.nerdfonts.md_battery_90 .. "?",
    ["100"] = wezterm.nerdfonts.md_battery .. "?",
  },
}

local function is_found(str, pattern)
   return string.find(str, pattern) ~= nil
end

local function _platform()
   local is_win = is_found(wezterm.target_triple, 'windows')
   local is_linux = is_found(wezterm.target_triple, 'linux')
   local is_mac = is_found(wezterm.target_triple, 'apple')
   local os = is_win and 'windows' or is_linux and 'linux' or is_mac and 'mac' or 'unknown'
   return {
      os = os,
      is_win = is_win,
      is_linux = is_linux,
      is_mac = is_mac,
   }
end

local platform = _platform()

---@param table table
---@param value any
local function appendToTable(table, value)
  table[#table+1] = value
end

---@param table1 table
---@param table2 table
local function appendTableToTable(table1, table2)
  for _, v in ipairs(table2) do
    table1[#table1+1] = v
  end
end

---------- Configuration


-- if wezterm.target_triple == "x86_64-pc-windows-msvc" then
--   config.term = "xterm-256color"
-- else
--   -- URL: https://github.com/MariaSolOs/dotfiles/blob/e63b36c8590469786f266fa7158585fd28951702/.config/wezterm/wezterm.lua
--
--   -- For this to work run this in bash:
--   -- tempfile=$(mktemp) && curl -o $tempfile https://raw.githubusercontent.com/wez/wezterm/main/termwiz/data/wezterm.terminfo && tic -x -o ~/.terminfo $tempfile  && rm $tempfile
--   -- If you don't run this and try to run wezterm with this setting it will bug powershell
--
--   -- Support for undercurl, etc.
--   config.term = "wezterm"
-- end


---------- My Config
-- Catpuccin Color Sheme
config.color_scheme = "Catppuccin Mocha"
-- My Default Shell - PowerShell Core
config.default_prog = { "pwsh" }
-- My Default Shell - Nushell
config.default_prog = { "nu" }
-- Launch Menu
-- Cross Platform shells
config.launch_menu = {}
local shell_launch_menu = {}
local special_launch_menu = {}
appendToTable(shell_launch_menu, {
    label = "Tools - LazyGit",
    args = { "nu", "-c", "go install github.com/jesseduffield/lazygit@latest; ~/go/bin/lazygit" }
})
appendToTable(shell_launch_menu, { label = "PowerShell Core", args = { "pwsh" } })
appendToTable(shell_launch_menu, { label = "Nushell", args = { "nu" } })
appendToTable(shell_launch_menu, { label = "Hilbish", args = { "hilbish" } })
appendToTable(shell_launch_menu, { label = "Murex", args = { "murex" } })
-- Platform dependent shells
if platform.is_win then
  appendToTable(shell_launch_menu, { label = "Windows PowerShell", args = { "powershell" } })
  appendToTable(shell_launch_menu, {{ label = "Command Prompt", args = { "cmd" } } })
  appendToTable(shell_launch_menu, {{ label = "Bash", args = { "bash" } } })
elseif platform.is_mac or platform.is_linux then
  appendToTable(shell_launch_menu, { label = "Bash", args = { "bash" } })
  appendToTable(shell_launch_menu, { label = "Zsh", args = { "zsh" } })
  appendToTable(shell_launch_menu, { label = "Fish", args = { "fish" } })
end

-- Special Apps
if cfg.powershell then
    appendToTable(special_launch_menu, {
        label = "Special - Checking Internet Connection",
        args = { "pwsh", "-Command", 'title "Checking Network Connection"; Check-InternetConnection' }
    })
    if platform.is_win then
        pass()
    end
    if platform.is_mac or platform.is_linux then
        appendToTable(special_launch_menu, {
            label = "Special - HTOP",
            args = { "pwsh", "-Command", 'title "HTOP"; sudo htop' }
        })
        appendToTable(special_launch_menu, {
            label = "Special - BTM",
            args = { "pwsh", "-Command", 'title "BTM"; btm' }
        })
    end
    if platform.is_linux then
        appendToTable(special_launch_menu, {
            label = "Special - Start GitAutoSync Deamon in TMUX (Use C-b d to detach)",
            args = {
                "pwsh",
                "-Command",
                'title "GitAutoSync"; sudo systemctl stop GitAutoSyncPwshService;tmux new -s "GitAutoSync" ~/go/src/devops.patrykadamczyk.net/utility_scripts/git-auto-sync/deamon.ps1'
            }
        })
    end
    appendToTable(special_launch_menu, {
        label = "Special - Neovim",
        args = { "pwsh", "-Command", 'title "Neovim"; n' }
    })
    appendToTable(special_launch_menu, {
        label = "Special - Lite Neovim",
        args = { "pwsh", "-Command", 'title "Neovim"; lln' }
    })
    appendToTable(special_launch_menu, {
        label = "Special - Empty Neovim",
        args = { "pwsh", "-Command", 'title "Neovim"; n --clean' }
    })
    appendToTable(special_launch_menu, {
        label = "Special - Vim",
        args = { "pwsh", "-Command", 'title "Vim"; vim' }
    })
    --[[
    appendToTable(special_launch_menu, {
        label = "Special Projects - TEST",
        args = { "pwsh", "-Command", 'title "TEST"; c TEST; pwsh' }
    })
    appendToTable(special_launch_menu, {
        label = "Projects - TEST",
        args = { "pwsh", "-Command", 'title "TEST"; c TEST; pwsh' }
    })
    --]]
    --#region PowerShell Projects
    appendToTable(special_launch_menu, {
        label = "Special Projects - Neovim",
        args = { "pwsh", "-NoExit", "-Command", 'title "neovim"; c neovim' }
    })
    appendToTable(special_launch_menu, {
        label = "Special Projects - Neorg",
        args = { "pwsh", "-NoExit", "-Command", 'title "neorg"; c neorg' }
    })
    appendToTable(special_launch_menu, {
        label = "Special Projects - DevOps",
        args = { "pwsh", "-NoExit", "-Command", 'title "devops.patrykadamczyk.net"; c devops.patrykadamczyk.net' }
    })
    appendToTable(special_launch_menu, {
        label = "Special Projects - DevOps LazyGit",
        args = { "pwsh", "-Command", 'title "devops.patrykadamczyk.net"; c devops.patrykadamczyk.net; lg' }
    })
    appendToTable(special_launch_menu, {
        label = "Special Projects - DevOps Go",
        args = { "pwsh", "-NoExit", "-Command", 'title "devops-go.patrykadamczyk.net"; c devops-go.patrykadamczyk.net' }
    })
    appendToTable(special_launch_menu, {
        label = "Special Projects - DevOps Go LazyGit",
        args = { "pwsh", "-Command", 'title "devops-go.patrykadamczyk.net"; c devops-go.patrykadamczyk.net; lg' }
    })
    -- Projects
end
--#endregion
--#region Nu Specials
if cfg.nushell then
    -- appendToTable(special_launch_menu, {
    --     label = "Nu Special - Checking Internet Connection",
    --     args = { "nu", "-e", 'title "Checking Network Connection"; Check-InternetConnection' }
    -- })
    appendToTable(special_launch_menu, {
        label = "Nu Special - Checking Internet Connection",
        args = {
            "nu",
            "-e",
            'tab-title "Checking Network Connection"; gping google.com store.steampowered.com 9.9.9.9 8.8.8.8 8.8.4.4 1.1.1.1'
        },
    })
    appendToTable(special_launch_menu, {
        label = "Nu Special - Checking Internet Connection - Buffer 5 minutes",
        args = {
            "nu",
            "-e",
            'tab-title "Checking Network Connection - Buffer 5 min"; gping -b (60 * 5) google.com store.steampowered.com 9.9.9.9 8.8.8.8 8.8.4.4 1.1.1.1'
        },
    })
    appendToTable(special_launch_menu, {
        label = "Nu Special - Checking Internet Connection - Ping every 50ms",
        args = {
            "nu",
            "-e",
            'tab-title "Checking Network Connection - Buffer 2 min"; gping -n 0.05 -b 60 google.com store.steampowered.com 9.9.9.9 8.8.8.8 8.8.4.4 1.1.1.1'
        },
    })
    appendToTable(special_launch_menu, {
        label = "Nu Special - Go into temporary directory",
        args = { "nu", "-e", 'tab-title "TMP"; Set-LocationToTemporaryDirectory' }
    })
    appendToTable(special_launch_menu, {
        label = "Nu Special - File Manager",
        args = { "nu", "-e", 'tab-title "FM"; fm' }
    })
    if platform.is_win then
        pass()
    end
    if platform.is_mac or platform.is_linux then
        appendToTable(special_launch_menu, {
            label = "Nu Special - HTOP",
            args = { "nu", "-e", 'tab-title "HTOP"; sudo htop' }
        })
        appendToTable(special_launch_menu, {
            label = "Nu Special - BTM",
            args = { "nu", "-e", 'tab-title "BTM"; btm' }
        })
    end
    if platform.is_linux then
        appendToTable(special_launch_menu, {
            label = "Nu Special - Start GitAutoSync Deamon pwsh in TMUX (Use C-b d to detach)",
            args = {
                "nu",
                "-e",
                'tab-title "GitAutoSync"; sudo systemctl stop GitAutoSyncPwshService;tmux new -s "GitAutoSync" ~/go/src/devops.patrykadamczyk.net/utility_scripts/git-auto-sync/deamon.ps1'
            }
        })
        appendToTable(special_launch_menu, {
            label = "Nu Special - Start GitAutoSync Deamon v2 task in TMUX (Use C-b d to detach)",
            args = {
                "nu",
                "-e",
                'tab-title "GitAutoSync"; cd ~/go/src/devops.patrykadamczyk.net/utility_scripts/git-auto-sync-task; task tmux'
            }
        })
    end
end
--#endregion
--#region Nushell Projects
if cfg.nushell then
    appendToTable(special_launch_menu, {
        label = "Nu Special Projects - Neovim",
        args = { "nu", "-e", 'tab-title "NeoVim"; c neovim' }
    })
    appendToTable(special_launch_menu, {
        label = "Nu Special Projects - Neorg",
        args = { "nu", "-e", 'tab-title "Neorg"; c neorg' }
    })
    appendToTable(special_launch_menu, {
        label = "Nu Special Projects - DevOps",
        args = { "nu", "-e", 'tab-title "DevOps"; c devops.patrykadamczyk.net' }
    })
    appendToTable(special_launch_menu, {
        label = "Nu Special Projects - DevOps LazyGit",
        args = { "nu", "-e", 'tab-title "DevOps LG"; c devops.patrykadamczyk.net; lazygit' }
    })
    appendToTable(special_launch_menu, {
        label = "Nu Special Projects - DevOps Go",
        args = { "nu", "-e", 'tab-title "DevOps Go"; c devops-go.patrykadamczyk.net' }
    })
    appendToTable(special_launch_menu, {
        label = "Nu Special Projects - DevOps Go LazyGit",
        args = { "nu", "-e", 'tab-title "DevOps Go LG"; c devops-go.patrykadamczyk.net; lazygit' }
    })
    -- Projects
end
--#endregion

appendTableToTable(config.launch_menu, special_launch_menu)
appendTableToTable(config.launch_menu, shell_launch_menu)
-- Fonts to use
config.font = wezterm.font_with_fallback({
    -- My Test Drive
    -- "Iosevka NFM",
    -- "IosevkaTerm NFM",
    -- "IosevkaTermSlab NFM",
    -- "JetBrainsMono NFM",
    -- "CaskaydiaCove NFM",
    -- "CommitMono Nerd Font Mono",
    -- "DaddyTimeMono NFM",
    -- "FiraCode Nerd Font Mono",
    -- "FiraMono NFM",
    -- "FuraCode Nerd Font Mono",
    -- "FuraMono Nerd Font Mono",
    -- This looks super interesting
    -- "GohuFont 14 Nerd Font Mono",
    -- "GoMono Nerd Font Mono",
    -- This looks nice
    -- "MesloLGLDZ Nerd Font Mono",
    -- "MesloLGL Nerd Font Mono",
    -- "MesloLGMDZ Nerd Font Mono",
    -- "MesloLGM Nerd Font Mono",
    -- "MesloLGSDZ Nerd Font Mono",
    -- "MesloLGS Nerd Font Mono",
    -- This looks nice
    -- "MonaspiceAr NFM",
    -- "MonaspiceKr NFM",
    -- "MonaspiceNe NFM",
    -- "MonaspiceRn NFM",
    -- "MonaspiceXe NFM",
    -- "NotoMono NFM",
    -- "ProFont IIx Nerd Font Mono",
    -- "RobotoMono Nerd Font Mono",
    -- "SauceCodePro NFM",
    -- This looks nice
    -- "SpaceMono Nerd Font Mono",
    -- "UbuntuMono Nerd Font Mono",
    -- "VictorMono NFM",
    -- No
    -- "OpenDyslexicM Nerd Font Mono",
    -- "BlexMono Nerd Font Mono",
    -- "Inconsolata Nerd Font Mono",
    -- "InconsolataGo Nerd Font Mono",
    -- "Inconsolata LGC Nerd Font Mono",
    -- This looks nice
    -- "MartianMono NFM",
    -- This looks super interesting
    -- "Monofur Nerd Font Mono",
    -- This looks nice
    -- "Monoid Nerd Font Mono",
    -- This looks nice
    -- "Mononoki Nerd Font Mono",
    -- "OverpassM Nerd Font Mono",
    -- "ProggyClean Nerd Font Mono",
    -- This looks nice
    -- "RecMonoCasual Nerd Font Mono",
    -- "RecMonoDuotone Nerd Font Mono",
    -- "RecMonoLinear Nerd Font Mono",
    -- "RecMonoSmCasual Nerd Font Mono",
    -- This looks nice
    -- "Terminess Nerd Font Mono",
    -- "ZedMono NFM",
    -- -- fonts folder
    -- "Sometype Mono",
    -- "FixedsysTTF",
    -- "Fixedsys Excelsior",
    -- This looks nice
    -- "Fragment Mono",
    -- "iA Writer Mono S",
    -- "iA Writer Mono V",
    -- This looks super nice
    -- paid
    -- "Indicate Mono",
    -- This looks super nice
    -- "Lotion",
    -- This looks nice
    -- "Maple Mono NF",
    -- Minecraft Enchanting Programming
    -- "Monocraft Nerd Font",
    -- "Miracode",
    -- This looks super nice
    -- paid
    -- "Monoflow",
    -- This looks nice
    -- "Monofoki",
    -- This looks nice
    -- "NovaMono",
    -- Perfect for game dev, perfect for TUI-like game
    -- "Press Start 2P",
    -- This looks nice
    -- "Recursive Monospace",
    -- "Recursive Monospace Casual",
    -- This looks nice
    -- "Reddit Mono",
    -- "Red Hat Mono",
    -- "Red Hat Mono VF",
    -- This looks super nice
    -- "scientifica",
    -- "Share Tech Mono",
    -- This looks ok
    -- "Twilio Sans Mono",
    ---------- My Actual Test Drive
    -- paid
    -- "Indicate Mono",
    -- "Monoflow",
    -- Pixelly font
    -- "GohuFont 14 Nerd Font Mono",
    -- "scientifica",
    -- Minecraft Enchanting Programming
    -- "Monocraft Nerd Font",
    -- Blocky font
    -- "Terminess Nerd Font Mono",
    -- Very nice fonts
    -- "Monofur Nerd Font Mono",
    -- "Monoid Nerd Font Mono",
    -- Nice fonts
    -- "MonaspiceAr NFM",
    -- "MonaspiceNe NFM",
    {
        family = "MonaspiceRn NFM",
        harfbuzz_features = {
            "calt",
            "ss01",
            "ss02",
            "ss03",
            "ss04",
            "ss05",
            "ss06",
            "ss07",
            "ss08",
            "ss09",
            "liga"
        },
    },
    -- "SpaceMono Nerd Font Mono",
    -- "MartianMono NFM",
    -- "Mononoki Nerd Font Mono",
    -- "Lotion",
    -- "Maple Mono NF",
    -- "Monofoki",
    -- This looks ok
    -- "RecMonoCasual Nerd Font Mono",
    -- "RecMonoDuotone Nerd Font Mono",
    -- "RecMonoLinear Nerd Font Mono",
    -- "RecMonoSmCasual Nerd Font Mono",
    -- "NovaMono",
    -- "Recursive Monospace",
    -- "Reddit Mono",
    -- "Twilio Sans Mono",
    ---------- My Fonts
    {
        family = "IosevkaTerm NFM SemiBold",
        harfbuzz_features = { "calt", "clig", "liga", "ss14" },
    },
    -- My Main Font - JetBrains Mono
    "JetBrainsMono NF",
    "JetBrainsMono NFM",

    ---------- WezTerm Fallback Fonts
    -- JetBrains Mono
    "JetBrains Mono",
    -- Nerd Symbols Font
    "Nerd Font Symbols",
    -- Noto Emoji Font
    "Noto Color Emoji",
})

-- Tabbar Font Size
-- Windows does that differently so it has need for different font size, why idk
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
    config.window_frame = {
        font_size = 12.0,
    }
else
    config.front_end = "OpenGL"
    config.window_frame = {
        font_size = 14.0,
    }
end

-- Content Font Size
config.font_size = 16.0

-- Change default font size based on font selected
local font_to_size = {
    ["IosevkaTerm NFM SemiBold"] = config.font_size,
    ["GohuFont 14 Nerd Font Mono"] = config.font_size - 1,
    ["MonaspiceAr NFM"] = config.font_size - 1,
    ["MonaspiceNe NFM"] = config.font_size - 1,
    ["MonaspiceRn NFM"] = config.font_size - 1,
    ["SpaceMono Nerd Font Mono"] = config.font_size - 2,
    ["MartianMono NFM"] = config.font_size - 3,
    ["Monofur Nerd Font Mono"] = config.font_size + 1,
    ["Monoid Nerd Font Mono"] = config.font_size - 3,
    ["RecMonoCasual Nerd Font Mono"] = config.font_size - 1,
    ["RecMonoDuotone Nerd Font Mono"] = config.font_size - 1,
    ["RecMonoLinear Nerd Font Mono"] = config.font_size - 1,
    ["RecMonoSmCasual Nerd Font Mono"] = config.font_size - 1,
    ["Indicate Mono"] = config.font_size - 1,
    ["Monoflow"] = config.font_size - 2,
    ["Maple Mono NF"] = config.font_size - 2,
    ["Monocraft Nerd Font"] = config.font_size - 2,
    ["Monofoki"] = config.font_size - 1,
    ["Recursive Monospace"] = config.font_size - 1,
    ["scientifica"] = config.font_size + 2,
    ["Twilio Sans Mono"] = config.font_size - 1,
}
local font_size_set = false
for _, font in ipairs(config.font.font) do
    for font_name, font_size in pairs(font_to_size) do
        if font_name == font.family then
            config.font_size = font_size
            font_size_set = true
            break
        end
    end
    if font_size_set then
        break
    end
end

-- Content have scrollbar (this controls only if scrollbar is shown not scroll history itself)
config.enable_scroll_bar = true

-- Default background + Alpha as default (other you can change through command palette action)
config.window_background_opacity = 0.88

-- Text opacity (which is mostly visible on stuff like neovim status line (on background of it))
-- config.text_background_opacity = 0.5

-- Do not run wsl by default (this is super slow if wsl is completely borked)
config.wsl_domains = {}

-- Support Kitty keyboard protocol
-- TODO: This option currently is not working correctly
-- URL: https://github.com/wez/wezterm/issues/4785  &  https://github.com/wez/wezterm/issues/3621
-- This option doesn't work as expected. You can check if it's fixed already
-- by enabling this option and checking if DELETE key work as backspace and CTRL+H
-- if yes then this option doesn't work as expected if no then it's fixed
-- This options should make <C-i> not work in insert mode as tab
config.enable_kitty_keyboard = true
config.enable_csi_u_key_encoding = false

-- Window Padding
-- config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.window_padding = {
  -- Left Padding
  left = "1cell",
  -- Scrollbar
  right = "1cell",
  top = 0,
  bottom = 0
}

-- config.use_fancy_tab_bar = false

---------- Command Palette
local function get__look_switcher()
  return wezterm.action_callback(function(window, _, line)
    --function(window, pane, line)
      local config = window:get_config_overrides() or {}
      if line == "background" then
        config.window_background_opacity = 1
        config.background = {
          {
            source = {
              File =  wezterm.config_dir .. "/background.gif",
            },
            width = "Cover",
            height = "Cover",
            vertical_align = "Middle",
            horizontal_align = "Center",
            opacity = 1,
            attachment = "Fixed",
          },
          {
            source = {
              File =  wezterm.config_dir .. "/black.jpg",
            },
            width = "Cover",
            height = "Cover",
            vertical_align = "Middle",
            horizontal_align = "Center",
            opacity = 0.5,
            attachment = "Fixed",
          },
        }
        window:set_config_overrides(config)
        return
      end
      if line == "background0" then
        config.window_background_opacity = 1
        config.background = {
          {
            source = {
              File =  wezterm.config_dir .. "/background.jpg",
            },
            width = "Cover",
            height = "Cover",
            vertical_align = "Middle",
            horizontal_align = "Center",
            opacity = 1,
            attachment = "Fixed",
          },
          {
            source = {
              File =  wezterm.config_dir .. "/black.jpg",
            },
            width = "Cover",
            height = "Cover",
            vertical_align = "Middle",
            horizontal_align = "Center",
            opacity = 0.5,
            attachment = "Fixed",
          },
        }
        window:set_config_overrides(config)
        return
      end
      if line == "background1" then
        config.window_background_opacity = 1
        config.background = {
          {
            source = {
              File =  wezterm.config_dir .. "/background1.jpg",
            },
            width = "Cover",
            height = "Cover",
            vertical_align = "Middle",
            horizontal_align = "Center",
            opacity = 1,
            attachment = "Fixed",
          },
          {
            source = {
              File =  wezterm.config_dir .. "/black.jpg",
            },
            width = "Cover",
            height = "Cover",
            vertical_align = "Middle",
            horizontal_align = "Center",
            opacity = 0.5,
            attachment = "Fixed",
          },
        }
        window:set_config_overrides(config)
        return
      end
      if line == "background2" then
        config.window_background_opacity = 1
        config.background = {
          {
            source = {
              File =  wezterm.config_dir .. "/background2.jpg",
            },
            width = "Cover",
            height = "Cover",
            vertical_align = "Middle",
            horizontal_align = "Center",
            opacity = 1,
            attachment = "Fixed",
          },
          {
            source = {
              File =  wezterm.config_dir .. "/black.jpg",
            },
            width = "Cover",
            height = "Cover",
            vertical_align = "Middle",
            horizontal_align = "Center",
            opacity = 0.5,
            attachment = "Fixed",
          },
        }
        window:set_config_overrides(config)
        return
      end
      if line == "black" then
        config.window_background_opacity = 1
        config.background = {
          {
            source = {
              File =  wezterm.config_dir .. "/black.jpg",
            },
            width = "Cover",
            height = "Cover",
            vertical_align = "Middle",
            horizontal_align = "Center",
            opacity = 1,
            attachment = "Fixed",
          },
        }
        window:set_config_overrides(config)
        return
      end
      if line == "color" then
        config.window_background_opacity = 1
        config.background = {}
        window:set_config_overrides(config)
        return
      end
      config.background = {}
      config.window_background_opacity = 0.88
      window:set_config_overrides(config)
    end)
end
wezterm.on("augment-command-palette", function(_, _)
  --function(cp_win, cp_pane)
  return {
    {
      brief = "Switch looks",
      icon = "cod_color_mode",
      action = act.PromptInputLine({
        description = "Enter Look (alpha/backgroundX/black/color) :",
        action = get__look_switcher(),
      }),
    },
  }
end)

---------- Right Status

wezterm.on("update-status", function(window, _)
  -- function(window, pane)
  local batteries = wezterm.battery_info()
  local battery_status = ""
  if #batteries > 0 then
    ---@class BatteryInfo
    local battery = batteries[#batteries]
    battery.lvl = toint(mround(battery.state_of_charge * 100, 10))
    battery.ico = BatteryIcons[battery.state][tostring(battery.lvl)]
    battery_status = ("%s %i%%"):format(
      battery.ico,
      tonumber(math.floor(battery.state_of_charge * 100 + 0.5))
    )
  end
  window:set_right_status(wezterm.format({
    {
      Foreground = {
        Color = "#808080",
      },
    },
    {
      Background = {
        Color = "#333333",
      },
    },
    {
      Text = battery_status,
    },
    {
      Text = string.format(" %s ", wezterm.strftime("%d/%m %H:%M:%S")),
    },
    {
      Text = string.format(" Workspace: %s ", window:active_workspace()),
    },
  }))
end)

---------- Custom Events
wezterm.on("toggle-opacity", function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if not overrides.window_background_opacity then
        -- if no override is setup, override the default opacity value with 1.0
        overrides.window_background_opacity = 1.0
    else
        -- if there is an override, make it nil so the opacity goes back to the default
        overrides.window_background_opacity = nil
    end
    window:set_config_overrides(overrides)
end)

-- TODO: Add switching to workspaces (through muxwindow)

---------- Keybinds
config.keys = {
    -- Rebind back Ctrl+C
    {
        key = "c",
        mods = "CTRL",
        action = act.SendKey({
            key = "c",
            mods = "CTRL",
        }),
    },
    -- Rebind back Ctrl+Shift+Arrows
    {
        key = "UpArrow",
        mods = "CTRL|SHIFT",
        action = act.SendKey({
            key = "UpArrow",
            mods = "CTRL|SHIFT",
        }),
    },
    {
        key = "DownArrow",
        mods = "CTRL|SHIFT",
        action = act.SendKey({
            key = "DownArrow",
            mods = "CTRL|SHIFT",
        }),
    },
    {
        key = "LeftArrow",
        mods = "CTRL|SHIFT",
        action = act.SendKey({
            key = "LeftArrow",
            mods = "CTRL|SHIFT",
        }),
    },
    {
        key = "RightArrow",
        mods = "CTRL|SHIFT",
        action = act.SendKey({
            key = "RightArrow",
            mods = "CTRL|SHIFT",
        }),
    },
    -- Toggle Transparency
    {
        key = "T",
        mods = "ALT|SHIFT",
        action = act.EmitEvent("toggle-opacity"),
    },
    -- Change look
    {
        key = "L",
        mods = "SUPER|SHIFT",
        action = act.PromptInputLine({
          description = "Enter Look (alpha/backgroundX/black/color) :",
          action = get__look_switcher(),
        }),
    },
    -- Run Project
    {
        key = "R",
        mods = "SUPER|SHIFT",
        action = act.SpawnCommandInNewTab({
            args = {
                "nu",
                "-e",
                "tab-title (input \"Choose title: \"); z (fd . --type d --max-depth 2 ~/go/src | fzf --prompt \"Choose a directory: \" --preview \"tree -C -L 2 {}\")"
            },
        }),
    },
    -- Switch Workspace
    {
      key = 'W',
      mods = 'SHIFT|ALT',
      action = act.ShowLauncherArgs({ flags = 'FUZZY|WORKSPACES' }),
    },
    {
      key = 'k',
      mods = 'SHIFT|ALT',
      action = act.SwitchWorkspaceRelative(1)
    },
    {
      key = 'j',
      mods = 'SHIFT|ALT',
      action = act.SwitchWorkspaceRelative(-1)
    },
    -- Name Workspace
    {
        key = "F10",
        mods = "SHIFT|ALT",
        action = act.PromptInputLine({
          description = "Enter Name for Workspace:",
          action = wezterm.action_callback(function(_, _, line)
            wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
          end),
        }),
    },
    -- Launcher
   {
     key = 'g',
     mods = 'SHIFT|ALT',
     desc = 'Show Launcher',
     -- General Launcher
     -- action = act.ShowLauncher,
     -- Show only launch menu items like Shells, Projects and tools instead of everything
     action = act.ShowLauncherArgs({ flags = 'FUZZY|LAUNCH_MENU_ITEMS' }),
   },
   -- WezTerm Debug Overlay and Lua REPL
   {
     key = 'F12',
     mods = 'SHIFT|ALT',
     action = act.ShowDebugOverlay,
   },
}

-- Add mappings for kitty keyboard protocol
if (config.enable_kitty_keyboard == true) then
    local kitty_fix_keys = {
        {
            key = "Delete",
            action = wezterm.action_callback(function(win, pane)
                local proc = pane:get_foreground_process_name()
                if proc ~= "nvim" and proc ~= "nu" then
                    win:perform_action(
                        act.SendKey({
                            key = "Delete"
                        }),
                        pane
                    )
                    return
                end

                local key_code = utf8.char(0x1b) .. "[3;1~"
                win:perform_action(act.SendString(key_code), pane)
            end),
        },
        -- There is no way to make different mappings for press and release
        -- {
        --     key = "Pause",
        --     action = wezterm.action_callback(function(win, pane)
        --         -- local proc = pane:get_foreground_process_name()
        --         -- if proc ~= "nvim" then
        --         --     win:perform_action(
        --         --         act.SendKey({
        --         --             key = "Delete"
        --         --         }),
        --         --         pane
        --         --     )
        --         --     return
        --         -- end
        --         --
        --         local key_code = utf8.char(0x1b) .. "[57362u"
        --         win:perform_action(act.SendString(key_code), pane)
        --     end),
        -- },
    }
    appendTableToTable(config.keys, kitty_fix_keys)
end

return config

