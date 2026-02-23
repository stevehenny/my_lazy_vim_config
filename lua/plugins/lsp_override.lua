return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- override the default LSP keymaps LazyVim sets
      opts.keys = opts.keys or {}
      vim.list_extend(opts.keys, {
        -- disable the Insert-mode <C-k> → signature help mapping
        { "<C-k>", false, mode = "i" },
      })

      local util = require("lspconfig.util")
      local path = util.path

      local function get_python_path(root_dir)
        local base_dir = root_dir or vim.fn.getcwd()

        local function from_prefix(prefix)
          if not prefix or prefix == "" then
            return nil, nil
          end
          local python = path.join(prefix, "bin", "python")
          if path.is_file(python) then
            return prefix, python
          end
          python = path.join(prefix, "Scripts", "python.exe")
          if path.is_file(python) then
            return prefix, python
          end
          return nil, nil
        end

        local venv, python = from_prefix(vim.env.VIRTUAL_ENV)
        if not venv then
          venv, python = from_prefix(vim.env.CONDA_PREFIX)
        end

        if not venv and base_dir and base_dir ~= "" then
          for _, name in ipairs({ ".venv", "venv", ".env", "env" }) do
            venv, python = from_prefix(path.join(base_dir, name))
            if venv then
              break
            end
          end
        end

        if python then
          return venv, python
        end

        python = vim.fn.exepath("python3")
        if python ~= "" then
          return nil, python
        end

        python = vim.fn.exepath("python")
        if python ~= "" then
          return nil, python
        end
      end

      opts.servers = opts.servers or {}
      opts.servers.pyright = opts.servers.pyright or {}
      local pyright = opts.servers.pyright
      pyright.root_dir = function(fname)
        return util.root_pattern(
          "pyproject.toml",
          "setup.py",
          "setup.cfg",
          "requirements.txt",
          "Pipfile",
          "pyrightconfig.json",
          ".git",
          ".venv",
          "venv",
          ".env",
          "env"
        )(fname) or util.path.dirname(fname)
      end
      local on_new_config = pyright.on_new_config
      pyright.on_new_config = function(config, root_dir)
        if on_new_config then
          on_new_config(config, root_dir)
        end

        local venv, python_path = get_python_path(root_dir)
        if python_path then
          config.settings = config.settings or {}
          config.settings.python = config.settings.python or {}
          config.settings.python.pythonPath = python_path
          if venv then
            config.settings.python.analysis = config.settings.python.analysis or {}
            config.settings.python.analysis.venvPath = vim.fn.fnamemodify(venv, ":h")
            config.settings.python.analysis.venv = vim.fn.fnamemodify(venv, ":t")
          end
        end
      end

      return opts
    end,
  },
}
