# Makefile for 

.PHONY: preview jupyter

dev_mac_os_first_run:
	brew install --cask visual-studio-code
	brew install --cask quarto
	brew install --cask miniconda
	conda env create -f environment.yml

dev_mac_os_update:
	conda env update --file environment.yml --prune

jupyter:
	jupyter lab

preview:
	quarto preview hystakes

render:
	cd hystakes && quarto render
	open hystakes/_site/index.html
