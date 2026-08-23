local server_starting = false

local function ensure_languagetool_server()
    if server_starting then
        return
    end
    server_starting = true
    local tcp = (vim.uv or vim.loop).new_tcp()
    tcp:connect(
        "127.0.0.1",
        8081,
        function(err)
            tcp:close()
            vim.schedule(
                function()
                    server_starting = false
                    if not err then
                        return
                    end
                    if vim.fn.executable("java") == 0 then
                        vim.notify(
                            "LanguageTool server was not started: java executable not found!",
                            vim.log.levels.WARN
                        )
                        return
                    end
                    local job_id = vim.fn.jobstart({
                        "java",
                        "--class-path",
                        "/opt/LanguageTool-6.9/languagetool-server.jar",
                        "org.languagetool.server.HTTPServer",
                        "--config",
                        "/opt/LanguageTool-6.9/server.properties",
                        "--port",
                        "8081",
                        "--allow-origin",
                    }, { detach = true })
                    if job_id <= 0 then
                        vim.notify(
                            "LanguageTool server could not be started",
                            vim.log.levels.ERROR
                        )
                    end
                end
            )
        end
    )
end

return {
    "liba2k/languagetool.nvim",
    init = function()
        vim.api.nvim_create_user_command(
            "LTStartServer",
            ensure_languagetool_server, {
                desc = "Start the LanguageTool server if it is not already running.",
            }
        )
    end,
    keys = {
        {"<leader>lc", "<cmd>LTCheck<cr>", desc = "Check line"},
        {"<leader>lc", ":LTCheck<cr>", mode = "v", desc = "Check selection"},
        {"<leader>lb", "<cmd>LTCheckBuffer<cr>", desc = "Check buffer"},
        {"<leader>lf", "<cmd>LTFix<cr>", desc = "Show fixes"},
        {"<leader>lx", "<cmd>LTClear<cr>", desc = "Clear diagnostics"},
    },
    config = function()
        require("languagetool").setup({
            -- LanguageTool server URL
            server_url = "http://localhost:8081",
            -- Language code (e.g., "en-US", "de-DE", "fr")
            language = "en-US",
            -- Severity mapping for different issue types
            severity = {
                typographical = vim.diagnostic.severity.HINT,
                grammar = vim.diagnostic.severity.WARN,
                misspelling = vim.diagnostic.severity.ERROR,
                style = vim.diagnostic.severity.INFO,
                default = vim.diagnostic.severity.WARN,
            },
        })
    end,
}
