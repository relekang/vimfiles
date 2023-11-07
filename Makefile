install: $(HOME)/.config/nvim $(HOME)/.config/lazyvim $(HOME)/.config/astro
	@echo "Installed dotfiles"

$(HOME)/.config:
	mkdir $(HOME)/.config

$(HOME)/.config/nvim: $(HOME)/.config
	@ln -s $(shell pwd)/nvim $(HOME)/.config/nvim
	@echo "Created symbolic link for nvim"

$(HOME)/.config/lazyvim: $(HOME)/.config
	@ln -s $(shell pwd)/lazyvim $(HOME)/.config/lazyvim
	@echo "Created symbolic link for LazyVim"

$(HOME)/.config/astro: $(HOME)/.config
	@ln -s $(shell pwd)/astro $(HOME)/.config/astro

	@NVIM_APPNAME=astro nvim +Lazy sync +LspInstall +qa
	@echo "Created symbolic link for AstroVim"

clean:
	@rm -fr $(HOME)/.config/nvim $(HOME)/.config/lazyvim $(HOME)/.config/astro
	@echo "Removed all dotfiles"

.PHONY: vim vim_plugins clean
