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
- You may(?) need to specify the Python kernel. This should be the one from the *hystakes* conda environment. To do this on Mac, type command-shift-P to bring up VSCode's command palette, then search for Python Interpreter, then pick the HyStakes interpreter from the dropdown list of options. 
- Navigate to the example files and confirm that they render correctly by following the [Quarto instructions for VSCode](https://quarto.org/docs/get-started/hello/vscode.html)


#### Developing code


#### Developing documentation

We assume the primary documentation will delivered through a website.
A local webserver can be started to preview the work in progress. All files (.qmd, .ipynb, .Rmd, .md etc.) within the `./hystakes` sub-directory will be rendered.

```sh
quarto preview
```

The live preview will not show global changes. You must run `quarto render` to see the site before you deploy.

The actual site is automatically built using github actions. Anything pushed to the **main** branch will be rendered (as per the rules in `./hystakes/_quarto.yml`) and published to https://hylode.github.io/HyStakes/. Note that the **main** branch is protected and so a pull request will need to be created and approve before the site can be built. Guidance on this can be found at [The Turing Way](https://the-turing-way.netlify.app/collaboration/maintain-review.html), and this [tutorial](https://yangsu.github.io/pull-request-tutorial/).

### PyMC installation

and installed version 4 via
https://github.com/pymc-devs/pymc3
and got the local example working
https://www.pymc.io/projects/docs/en/latest/learn/core_notebooks/pymc_overview.html