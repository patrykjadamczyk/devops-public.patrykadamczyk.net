return {
    {
        "chrisbra/csv.vim",
        priority = vim.g.patconfig_highest_base_priority - 400,
        ft = {
            "csv",
            "*.csv",
            "*.dat",
        },
    },
}
