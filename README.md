# R Package *pcapred.largedata*

This is a data repository for use with the R package [pcapred](https://github.com/danjlawson/pcapred). You should install that package first. You may only want the 18 PCs included with it, in which case you don't need this additional dataset.

You can use the data directly if that is helpful.

If you are not an R user but wish to use this data, see the [command line script](https://github.com/danjlawson/pcapred-script).

## Getting started

Install the package using:

```{r}
remotes::install_github("danjlawson/pcapred.largedata")
 ```

## Using the data

Usage is trivial inside of `pcapred`.

```{r}
library(pcapred)
library(pcapred.largedata)
ref=readreference(ukb_pcs_200())
 ```

## Data notes

Note that PC loading files are large. We have therefore distributed PCS 1-100 as a standard dataset (ukb_pcs_100.load.gz) and PCS 101-200 are a separate file of 100 additional PC loadings (ukb_pcs_101-200.load.gz). If you use the dataset through R, the full set of 200 PCs is created for you by the function `(ukb_pcs_200()`. If you want the package just for the data, then you will have to paste these together or similar for use.

## Licence Information

Author: Daniel Lawson (dan.lawson@bristol.ac.uk)
Date: 2020
Licence: This code is released under the GPLv3.
