 " >> load plugins
call plug#begin(stdpath('data') . 'vimplug')
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'preservim/nerdtree'
"   Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
    Plug 'sheerun/vim-polyglot'
    Plug 'flazz/vim-colorschemes'
    Plug 'felixhummel/setcolors.vim'
    Plug 'morhetz/gruvbox'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'ojroques/vim-oscyank', {'branch': 'main'}
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'ervandew/supertab'
    Plug 'tomasr/molokai'
    Plug 'fmoralesc/molokayo'
    Plug 'mattn/emmet-vim'
    Plug 'alvan/vim-closetag'
    Plug 'AndrewRadev/tagalong.vim'

" Start of lsp/snippy config
"
"call plug#begin(s:plug_dir)
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    " For vsnip users.
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'

    " More LSP config
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'

    " For luasnip users.
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy'

call plug#end()

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require'lspconfig'.pyright.setup {
capabilities = capabilities
  }

  -- managing & installin lsp servers
require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    -- Replace these with whatever servers you want to install
    'cssls',
    'clangd',
    'gopls',
    'html',
    'jsonls',
    'lua_ls',
    'marksman',
    'psalm',
    'rust_analyzer',
    'solidity',
    'sqlls',
    'tsserver',
  }
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(client, bufnr)
  -- Create your keybindings here...
end

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = lsp_attach,                      j
      capabilities = lsp_capabilities,
    })
  end,
})

EOF

"debugging
"    Plug 'mfussenegger/nvim-dap'
"    Plug 'yriveiro/dap-go.nvim'
"    Plug 'rcarriga/nvim-dap-ui'
"    Plug 'theHamsta/nvim-dap-virtual-text'
"    Plug 'nvim-telescope/telescope-dap.nvim'
"

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
filetype indent on

"colorscheme papercolor
"colorscheme murphy
hi Normal ctermbg=NONE guibg=NONE


" remapping gp and gd to switch buffers
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>  

" basic settings
syntax on
set mouse=nv
"set termguicolors
set guifont=ProggyCleanTT\ 12
set number
set relativenumber
set ignorecase      " ignore case
set smartcase     " but don't ignore it, when search string contains uppercase letters 
set hidden      " makes vim work like every other multiple file editor
set switchbuf=usetab,newtab     "switching to existing tab if buffer is open, or creating new if not
set nocompatible
set incsearch        " do incremental searching
set visualbell
set expandtab
set tabstop=4
set ruler
set smartindent
set shiftwidth=4
set hlsearch
set virtualedit=all
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent
"set mouse=a  " mouse support
"searches the current directory and recursivly thereafter
"set path=.,,** 
set wildchar=<Tab> wildmenu wildmode=full
set nohlsearch
"View multiple lines pasted
set viminfo='100,<1000,s100,h

"remap trigger for emma, the HTML helper
" , ,  is the leader that will give you the expansions that emmet can
" comma, comma, is the leader <, ,> 
let g:user_emmet_leader_key=','

"vim-surround to wrap in brackets
xnoremap <leader>s xi()<Esc>P

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
"delete HTML tags
nnoremap <space> vat<Esc>da>`<da>
"Vertical split
nnoremap <C-s> <:vsp<C-i>
"NerdTree
nnoremap <C-q> :NERDTreeToggle<CR>
"JSON formatting
nnoremap <C-j> <:.!jq .<CR>
"
nnoremap <C-'> <"\><CR>
"
"
""insert mode autocompletion shortcuts
inoremap ^] ^X^]
inoremap ^F ^X^F
inoremap ^D ^X^D
inoremap ^L ^X^L

"filetree mapping cp from Primeagen
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
"Open a new split for the program running
nnoremap <leader>r :vsplit term://python3 %<cr>
"move throught colorshcemes 
noremap <silent> <leader>nc :call NextColor(0)<CR>
vnoremap <leader>c :OSCYank<CR>

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
"
    
"
"EOF

