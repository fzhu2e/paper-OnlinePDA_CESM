# Code repository for _An Online Data Assimilation Framwork for Reconstructing Paleoclimates in CESM_

This repository gathers notebooks for the manuscript _An Online Data Assimilation Framwork for Reconstructing Paleoclimates in CESM_.

The code is tested with Python 3.13, and the package [`x4c`](https://ncar.github.io/x4c/) is required to perform essential analysis and the corresponding visualization.

## Repository Structure
- `notebooks`: the directory that includes the Jupyter notebooks and the utility scripts
    - [`Fig.02.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/Fig.02.ipynb): the notebook that performs analysis and generates Fig. 2 in the main text
    - [`Fig.03.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/Fig.03.ipynb): the notebook that performs analysis and generates Fig. 3 in the main text
    - [`Fig.04.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/Fig.04.ipynb): the notebook that performs analysis and generates Fig. 4 in the main text
    - [`Fig.05.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/Fig.05.ipynb): the notebook that performs analysis and generates Fig. 5 in the main text
    - [`Fig.06.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/Fig.06.ipynb): the notebook that performs analysis and generates Fig. 6 in the main text
    - [`Fig.07.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/Fig.07.ipynb): the notebook that performs analysis and generates Fig. 7 in the main text
    - [`Fig.08.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/Fig.08.ipynb): the notebook that performs analysis and generates Fig. 8 in the main text
    - [`Fig.09.ipynb`](https://github.com/fzhu2e/paper-OnlinePDA_CESM/blob/main/notebooks/Fig.09.ipynb): the notebook that performs analysis and generates Fig. 9 in the main text
- `sims`: the iCESM1.3 Pliocene simulated variables serving as the prior for offline DA, plus those from the online DA runs
- `recons`: the offline DA based reconstructions, plus the data for internal variability diagnostics
- `pseudoproxy`: the pseudoproxy data and the corresponding SST fields from the Truth runs


## How to cite this repository
This repository can be cited with DOI: [10.5281/zenodo.15883769](https://doi.org/10.5281/zenodo.15883769)