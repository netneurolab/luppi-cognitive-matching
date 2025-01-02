# Cognitive matching from NeuroSynth
MATLAB code to perform "Cognitive matching" as introduced in Luppi et al (2025) "General anaesthesia reduces the uniqueness of brain functional connectivity across individuals and across species", _Nature Human Behaviour_ ([preprint](https://doi.org/10.1101/2023.11.08.566332))

Authors: A.I. Luppi, D. Golkowski, A. Ranft, R. Ilg, D. Jordan, D. Bzdok, A.M. Owen, L. Naci, E.A. Stamatakis, E. Amico, & B. Misic.

This code was developed in MATLAB 2019a by Andrea Luppi from the the [Network Neuroscience Lab](netneurolab.github.io/) at the Montreal Neurological Institute, McGill University.

Cognitive matching is the idea that even at rest, spontaneous brain activity is not just random. Rather, there is still something going on in the mind, which should be supported by structured brain activity. Cognitive matching seeks to identify and quantify this structured-ness, using 123 meta-analytic maps that aggregate >14,000 neuroimaging studies, as obtained from [NeuroSynth](https://neurosynth.org/) (Yarkoni et al. (2011) _Nature Methods_). Each map represents the literature's summary of the brain activity correspondign to a different cognitive operation.

At every point in time during the scan, we can ask whether there is a good match between sponatenous BOLD and any cognitive operations' maps. We we can also ask how good that match is overall, aggregated across meta-analytic maps and across time. This is the _cognitive matching index_ (available in two flavours: best match across maps, and average match across maps; both are averaged across time).

## Repository Structure
### Main function
The main file is [fcn_cognitive_matching.m](fcn_cognitive_matching.m)
No additional installation should be required.
To run, ensure that the [data](data/) folder is also present.
The user needs to provide their own my_BOLD data input (a matrix of FMRI timeseries with N regions by T timepoints). N must match the requested atlas, so 200 for Schaefer and 68 for DK atlas.
Note: T can even be 1, which would correspond to providing a brain map. In theory, any brain map can be provided, not just FMRI (so long as it is either in Schaefer-200 or DK-68 format): in this case, the function effectively performs NeuroSynth decoding on the provided map.

### `data`
The [data](data/) folder contains the NeuroSynth maps for a canonical set of 123 terms, parcellated in the Schaefer atlas (200 cortical regions) and in the Desikan-Killiany atlas (68 cortical regions), as used in  the paper. The names of the 123 terms are also provided in the [data](data/) folder, and returned by the function if requested.
