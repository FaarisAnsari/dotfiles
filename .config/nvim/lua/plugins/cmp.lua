return {
  'hrsh7th/nvim-cmp',
  version = false,
  event = "InsertEnter",
  dependencies = { 'hrsh7th/cmp-nvim-lsp', { 'L3MON4D3/LuaSnip', config = true }, 'saadparwaiz1/cmp_luasnip' },
  config = function()
    local cmp = require 'cmp'
    local lsnip = require 'luasnip'

    cmp.setup {
      snippet = {
        expand = function(args)
          lsnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif lsnip.expand_or_jumpable() then
            lsnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif lsnip.jumpable(-1) then
            lsnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      },
    }
  end,
}
