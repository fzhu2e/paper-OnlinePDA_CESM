[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20751456.svg)](https://doi.org/10.5281/zenodo.20751456)


# Code & data repository for _An Online Data Assimilation Framework for Reconstructing Paleoclimates in CESM_

This repository gathers the notebooks and corresponding data for the manuscript _An Online Data Assimilation Framework for Reconstructing Paleoclimates in CESM_.

The code is tested with Python 3.13, and the package [`x4c`](https://ncar.github.io/x4c/) is required to perform essential analysis and the corresponding visualization.

## Repository Structure
- `notebooks`: the directory that includes the Jupyter notebooks and the utility scripts
    - [`ppe_400ppm_DA_R0.01_loc10000.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/ppe_400ppm_DA_R0.01_loc10000.ipynb): the notebook that performs the offline PDA for the P-case
    - [`ppe_490ppm_DA_R4.00_loc10000.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/ppe_490ppm_DA_R4.00_loc10000.ipynb): the notebook that performs the offline PDA for the N-case
    - [`create_restoring_target_SR.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/create_restoring_target_SR.ipynb): the notebook that generates the restoring target field for the standard restoring (SR) run
    - [`create_restoring_target_FR.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/create_restoring_target_FR.ipynb): the notebook that generates the restoring target field for the fixed-tendency restoring (FR) run
    - [`Fig.02.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/Fig.02.ipynb): the notebook that performs analysis and generates Fig. 2 in the main text
    - [`Fig.03.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/Fig.03.ipynb): the notebook that performs analysis and generates Fig. 3 in the main text
    - [`Fig.04.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/Fig.04.ipynb): the notebook that performs analysis and generates Fig. 4 in the main text
    - [`Fig.05.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/Fig.05.ipynb): the notebook that performs analysis and generates Fig. 5 in the main text
    - [`Fig.06.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/Fig.06.ipynb): the notebook that performs analysis and generates Fig. 6 in the main text
    - [`Fig.07.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/Fig.07.ipynb): the notebook that performs analysis and generates Fig. 7 in the main text
    - [`Fig.08.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/Fig.08.ipynb): the notebook that performs analysis and generates Fig. 8 in the main text
    - [`Fig.09.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/Fig.09.ipynb): the notebook that performs analysis and generates Fig. 9 in the main text
- `sims`: the iCESM1.3 Pliocene simulated variables serving as the prior for offline DA, plus those from the online DA runs
- `priors`: the iCESM1.3 Pliocene model priors, including Truth runs
- `recons`: the offline DA based reconstructions, plus the data for internal variability diagnostics
- `pseudoproxy`: the pseudoproxy data and the corresponding SST fields from the Truth runs
- `CESM_scripts`: the scripts for running the iCESM1.3 online DA framework
    - [`run_SR.zsh`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/CESM_scripts/run_SR.zsh): the script to run the standard restoring (SR) case
    - [`run_FR.zsh`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/CESM_scripts/run_FR.zsh): the script to run the fixed-tendency restoring (FR) case
    - [`forcing_pt_interior_fixed.F90`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/CESM_scripts/forcing_pt_interior_fixed.F90): the modified iCESM1.3 Fortran source code for the fixed-tendency restoring (FR) case


## How to cite this repository
This repository can be cited with DOI: [10.5281/zenodo.20751456](https://doi.org/10.5281/zenodo.20751456)