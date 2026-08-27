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
                },
                forwardSearchAfter = false,
                onSave = false,
            },
        },
    },
}
