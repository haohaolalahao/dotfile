# My  dotfiles

## linux needed

```bash
# for ubuntu 
sudo apt-get install zsh git tar gzip curl wget
sudo apt-get install fzf ripgrep sed fd
sudo apt-get install autojump bat tmux
sudo apt install build-seesntial
```

```bash
# for ubuntu nodejs npm
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get update
sudo apt-get install nodejs
```

```bash
# for ubuntu neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```

## zsh

![image-20220322182009428](.picture/image-20220322182009428.png)

1. 插件管理：[zplug](https://github.com/zplug/zplug)

   ```bash
   $ curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
   ```

2. 提示符：[Starship](https://starship.rs/)

   ```bash
   # for linux
   curl -sS https://starship.rs/install.sh | sh
   # for windows
   scoop install starship
   # for macOS
   brew install starship
   ```

## neovim

![image-20220322181854901](.picture/image-20220322181854901.png)



```bash
~/.config/nvim/
	-- lua
		-- core
			-- colors.lua # theme
			-- config.lua # basic config
			-- keybinds.lua # keybings
			-- settings.lua # someelse
		-- dap
			-- python.lua
		-- lsp
			-- jsonls.lua # json
			-- pyright.lua # python
			-- sumeko_lua.lua # lua
			-- zeta_note.lua # markdown
		-- plugins
			-- alpha-nvim.lua # nvim dashboard
			-- AutoSave.lua # autosave file
			-- bufferline.lua # nvim tab
			-- Comment.lua # nvim comment
			-- fidget.lua # show lsp 
			-- gitsigns.lua # show git sings in line
			-- hop.lua # search word or character
			-- indent-blankline.lua # indent 
			-- lsp_signature.lua # lsp
			-- lspsage.lua # lsp theme
			-- lualine.lua # nvim line
			-- marks.lua # show marks in nvim
			-- neoformat.lua # format file
			-- nvim-autopairs.lua 
			-- nvim-cmp.lua # cmp like vscode
			-- nvim-dap-ui.lua
			-- nvim-dap-virtual-text.lua
			-- nvim-dap.lua
			-- nvim-gps.lua
			-- nvim-hlslens.lua
			-- nvim-lastplace.lua
			-- nvim-lightbulb.lua
			-- nvim-lspconfig.lua
			-- nvim-notify.lua
			-- nvim-scrollbar.lua
			-- nvim-tree.lua
			-- nvim-treesitter.lua
			-- onenord.lua
			-- packer_compiled.lua
			-- surround.lua
			-- telescope.lua
			-- toggleterm.lua
			-- undotree.lua
			-- vista.lua
			-- which-key.lua
		-- packer_init.lua
```

1. packer 插件管理

   ```bash
   # for linux or unix
   git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
   # for pwsh
   git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
   ```

   

2. 共享系统剪切板

   ```
   sudo apt install xsel
   ```

3. neoformat

   ```bash
   python: sudo apt install python3-autopep8
   lua: npm install -g lua-fmt
   html css vue js ts json: npm install -g prettier
   ```


4. dap

   ```bash
   python: python3 -m pip install debugpy
   
   -- 指定 Python 解释器路径
   -- 修改lua/core/settings.lua
   vim.g.python_path = "/usr/bin/python3.8"
   ```

## tmux

**tmux+nvim**

![image-20220322182153014](.picture/image-20220322182153014.png)

**btop**

![image-20220322182243464](.picture/image-20220322182243464.png)

## pwsh

![image-20220322182443069](.picture/image-20220322182443069.png)

[Windows-Terminal](https://github.com/microsoft/terminal)

[PowerShell](https://github.com/PowerShell/PowerShell)

```
# install scoop
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
Set-ExecutionPolicy RemoteSigned -scope CurrentUser

# install tools
scoop install git curl wget starship fzf torch sudo

# install psreadline
Install-Module -Name PSReadLine -AllowPrerelease

# install psfzf
Install-Module PSFzf

# install terminal-icon
Install-Module -Name Terminal-Icons -Repository PSGallery

# install psconsoletheme
Install-Module PSConsoleTheme
```

