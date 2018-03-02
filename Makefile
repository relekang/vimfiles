install: $(HOME)/.vim $(HOME)/.vimrc $(HOME)/.config/nvim vim_plugins

$(HOME)/.vim:
	@ln -s $(shell pwd)/vim $(HOME)/.vim
	@echo "Created symbolic link for .vim"

$(HOME)/.vimrc:
	@ln -s $(shell pwd)/vimrc $(HOME)/.vimrc
	@echo "Created symbolic link for .vimrc"

$(HOME)/.config:
	mkdir $(HOME)/.config

$(HOME)/.config/nvim: $(HOME)/.config
	@ln -s $(shell pwd)/nvim $(HOME)/.config/nvim
	@echo "Created symbolic link for nvim"

vim_plugins:
	@vim +PlugInstall +qa
	@nvim +PlugInstall +qa
	pip3 install neovim typing
	pip install python-language-server
	npm i -g ocaml-language-server
	@echo "Updated vim plugins"


clean:
	@rm -f $(HOME)/.vimrc $(HOME)/.vim $(HOME)/.config/nvim
	@echo "Removed all dotfiles"

.PHONY: vim vim_plugins clean