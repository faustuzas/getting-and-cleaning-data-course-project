# Getting and Cleaning Data Course Project 

## Repository Structure
This repository contains scripts and documentation to process and clean the dataset, creating a tidy dataset suitable for analysis.

## Files
1. **run_analysis.R** - main script for cleaning and processing the data. Outputs **result.txt** which contains summarized raw data by subject id and activity name. Script loads two variables into the workspace: 
    * **data** - contains the whole data set with cleaning performed.
    * **summarized_data** - contains summarized **data** by subject id and activity name.
2. **CodeBook.md** - describes the variables, data, and transformations performed.
3. **README.md** - provides an overview of the repository, its contents, and usage instructions.

## Usage

1. Run this command to install required dependencies (e.g. `dpylr`):
```R
renv::restore()
```
2. Make sure that your working directory contains raw files of the data set.
2. Run the analysis script:
```R
source("run_analysis.R")
```
