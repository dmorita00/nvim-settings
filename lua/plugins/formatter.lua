return {
  "stevearc/conform.nvim",
  lazy = false,
  keys = {
    { "<leader>i", "<cmd>Format<cr>", desc = "Format" },
  },
  config = function()
    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_format = "fallback", range = range })
    end, { range = true })
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        php = { "phpcbf" },
        -- biome: JS/TS/JSON/CSS
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        javascript = { "biome" },
        typescript = { "biome" },
        json = { "biome" },
        css = { "biome" },
        -- prettierd: HTML/Markdown
        html = { "prettierd" },
        markdown = { "prettierd" },
        yaml = { "yamlfmt" },
        makefile = { "bake" },
        ruby = { "rubocop", lsp_format = "fallback" },
        sql = { "sqlfluff" },
        terraform = { "terraform_fmt" },
        ["_"] = { "trim_whitespace" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_on_save = {
        -- I recommend these options. See :help conform.format for details.
        lsp_format = "fallback",
        timeout_ms = 500,
      },
      notify_on_error = true,
      notify_no_formatters = true,
    })
  end
}