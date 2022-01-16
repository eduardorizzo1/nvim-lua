vim.g.dashboard_preview_file_height = 12
vim.g.dashboard_preview_file_width = 100
vim.g.dahsboard_preview_command = "cat"
vim.g.dashboard_preview_pipeline = 'lolcat --spread=2.5 -t --seed=156'

vim.g.dashboard_custom_section = {
    a = {description = {'  Find File          '}, command = 'Telescope find_files find_command=rg,--files,--hidden,--ignore-file,~/.rgignore'},
    b = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
    c = {description = {'  Load Last Session  '}, command = 'SessionLoad'},
    d = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
    e = {description = {'  Settings           '}, command = ':e ~/.config/nvim/nv-settings.lua'}
}

vim.g.dashboard_custom_header = {
                 "=================     ===============     ===============   ========  ========",
                 "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
                 "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
                 "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
                 "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
                 "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
                 "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
                 "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
                 "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
                 "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
                 "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
                 "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
                 "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
                 "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
                 "||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
                 "||.=='    _-'                                                     `' |  /==.||",
                 "=='    _-'                        N E O V I M                         \\/   `==",
                 "\\   _-'                                                                `-_   /",
                 " `''                                                                      ``'  ", 
}

