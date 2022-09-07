# HyStakes

## Installation

### Mac OS (First run)

- Install [Quarto](https://quarto.org/docs/get-started/)
- Install the [VSCode extension](https://quarto.org/docs/get-started/hello/vscode.html) for Quarto
- Clone the repo at the command line

```sh
git clone https://github.com/HYLODE/HyStakes.git
cd hystakes
make dev_mac_os_first_run
direnv allow
```

### Development work

- Open VSCode in the hystakes directory
- You may(?) need to specify the Python kernel. This should be the one from the *hystakes* conda environment.
- Navigate to the example files and confirm that they render correctly by following the [Quarto instructions for VSCode](https://quarto.org/docs/get-started/hello/vscode.html)


#### Developing code


#### Developing documentation

We assume the primary documentation will delivered through a website.
A local webserver can be started to preview the work in progress. All files (.qmd, .ipynb, .Rmd, .md etc.) within the `./hystakes` sub-directory will be rendered.

```sh
quarto preview
```

The live preview will not show global changes. You must run `quarto render` to see the site before you deploy.