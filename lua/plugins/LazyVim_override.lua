return {
  "LazyVim/LazyVim",
  opts = function(_, opts)
    opts.keymap = opts.keymap or {}
    opts.keymap["<C-k>"] = false -- disable blink’s <C-k> mapping
    return opts
  end,
}
