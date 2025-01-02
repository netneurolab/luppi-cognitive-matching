# Cognitive matching from NeuroSynth
MATLAB code to perform "Cognitive matching" as described in Luppi et al (2025) "General anaesthesia reduces the uniqueness of brain functional connectivity across individuals and across species", _Nature Human Behaviour_ ([preprint](https://doi.org/10.1101/2023.11.08.566332))

Authors: A.I. Luppi, D. Golkowski, A. Ranft, R. Ilg, D. Jordan, D. Bzdok, A.M. Owen, L. Naci, E.A. Stamatakis, E. Amico, & B. Misic.

It was developed in MATLAB 2019a by Andrea Luppi from the the [Network Neuroscience Lab](netneurolab.github.io/) at the Montreal Neurological Institute, McGill University.

## Repository Structure
### Main function
The main file is [Luppi_macaque_brain_gene_translation_code_4GitHub.m](Luppi_macaque_brain_gene_translation_code_4GitHub.m)
This script should work out of the box, if run from the parent directory. 
To run, ensure you are in the main directory of the repo.

### `data`
The [data](data/) folder contains all the data you need to make this code run. 

### `utils`
The [utils](utils/) folder contains support functions called by the main script, including some third-party code.
