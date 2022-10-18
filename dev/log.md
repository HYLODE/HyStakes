Running notes to keep track of activity
And then lift parts of these out into guides

## 2022-10-17 23:52:51
https://towardsdatascience.com/introduction-to-pymc3-a-python-package-for-probabilistic-programming-5299278b428

and installed version 4 via
https://github.com/pymc-devs/pymc3
and got the local example working
https://www.pymc.io/projects/docs/en/latest/learn/core_notebooks/pymc_overview.html

maybe **resume** here
https://docs.pymc.io/en/v3/pymc-examples/examples/generalized_linear_models/GLM-logistic.html
https://www.pymc.io/projects/examples/en/latest/generalized_linear_models/GLM-binomial-regression.html
https://goldinlocks.github.io/Bayesian-logistic-regression-with-pymc3/
https://www.srose.biz/bayesian-methods/bayesian-logistic-regression-with-pymc3/
https://towardsdatascience.com/bayesian-logistic-regression-with-pymc3-8e17c576f31a
https://towardsdatascience.com/introduction-to-pymc3-a-python-package-for-probabilistic-programming-5299278b428

https://pymc-learn.readthedocs.io/en/latest/index.html

## 2022-10-17
trying to work with PyMC3
usual problems with mac m1 install

followed the recommendations as below
https://makeoptim.com/en/deep-learning/tensorflow-metal

```bash
conda create -n hyseer tensorflow python=3.9.5
conda activate hyseer
conda install -c apple tensorflow-deps==2.10.0
python -m pip install tensorflow-macos
python -m pip install tensorflow-metal
conda install -y matplotlib jupyterlab pandas
```

## 2022-10-10
working on https://github.com/HYLODE/HyStakes/issues/15


## 2022-09-07

Setting up website
https://quarto.org/docs/websites/
all done 
uses github actions and gh-pages
deployed at https://hylode.github.io/HyStakes/



## 2022-09-06

Working from MacBook Air (M2, 2022) 
mac os monterey 12.4

- initialised github repo
- installed visual studio code

```sh
brew install --cask visual-studio-code
```

- installed basic python and jupyter extensions
- installed [quarto](https://quarto.org/docs/get-started/)
- installed the [VSCode extension](https://quarto.org/docs/get-started/hello/vscode.html) 

- prepared an `environment.yml` for conda
- installed the conda environment
- added `.env` and `.envrc` files that allow [direnv](https://direnv.net) to automatically activate the correct environment when I `cd` into the directory
- do `direnv allow` the first time you enter the directory