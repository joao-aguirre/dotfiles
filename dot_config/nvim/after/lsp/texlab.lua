return {
    settings = {
        texlab = {
            build = {
                executable = "tectonic",
                args = {
                    "%f",
                    "--synctex",
                    "--keep-logs",
                    "--keep-intermediates",
                    "--print",
                },
                forwardSearchAfter = false,
                onSave = false,
            },
            forwardSearch = {
                executable = "zathura",
                args = {
                    "--synctex-forward",
                    "%l:1:%f",
                    "%p",
                },
            },
        },
    },
}
