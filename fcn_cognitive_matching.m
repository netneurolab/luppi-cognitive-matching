function [TopCorr, AvgCorr, NSxTS, neurosynth_terms] = fcn_cognitive_matching(my_BOLD, atlas_name);
% Perform "Cognitive matching" between BOLD signals and 123 NeuroSynth
% meta-analytic maps, as per Luppi et al 2025 Nature Human Behaviour
% (preprint DOI: https://doi.org/10.1101/2023.11.08.566332)

% INPUTS:
%
% my_BOLD: matrix of N regions by T timepoints; N should be 200 (for
% Schaefer) or 68 for DesikanKilliany. Note that T can also be 1 (for
% example when providing a single brain map).
%
% atlas_name: string, should be 'Schaefer' or 'DesikanKilliany'

% OUTPUTS:
%
% TopCorr: the value of the best (positive) correlation between each
% timepoint and any neurosynth map, averaged across timepoints;
%
% AvgCorr: the value of the mean magnitude (absolute value) of correlation between each
% timepoint and any neurosynth map, averaged across timepoints;
%
% NSxTS: matrix of correlations between 123 neurosynth maps and T timepoints
% neurosynth_terms: the neurosynth maps' names
%
% Andrea Luppi 2023 (contact: al857@cam.ac.uk)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Get input size
[N,T]=size(my_BOLD);

% Sanity check about atlas and ensure proper spelling
switch lower(atlas_name)
    case 'desikankilliany'
        atlas_name = 'DesikanKilliany';
        if N == 68
        else
            disp('##################################################')
            disp('Error! Wrong atlas or number of ROIs provided. Currently only DesikanKilliany 68 and Schaefer 200 are supported')
            disp('##################################################')
            assert(N==68); % stop running
        end
    case {'schaefer', 'schafer'}
        atlas_name = 'Schaefer';
        if N==200
        else
            disp('##################################################')
            disp('Error! Wrong atlas or number of ROIs provided. Currently only DesikanKilliany 68 and Schaefer 200 are supported')
            disp('##################################################')
            assert(N==200); % stop running
        end
    otherwise
            disp('##################################################')
            disp('Error! Wrong atlas or number of ROIs provided. Currently only DesikanKilliany 68 and Schaefer 200 are supported')
            disp('##################################################')
            assert(false) % stop running
end


% Load neurosynth terms and their names
load(['data/NeuroSynth_maps_', atlas_name, num2str(N), '.mat']);
load(['data/neurosynth_terms.mat']);
neurosynth_terms = neurosynth_terms.names;

% Get matrix of correlations
allConcat = [neurosynth_maps, my_BOLD];
allCorr = corrcoef(allConcat);

% We want the part of the matrix pertaining to NS vs TS, not NS-NS or TS-TS
ns_idx = 1:size(neurosynth_maps,2);
ts_idx = size(neurosynth_maps,2)+1 : size(allConcat,2);

% Correlations of NS maps by timepoints
NSxTS = allCorr(ns_idx, ts_idx);


%Find the best (positive) correlation of each timepoint with NeuroSynth maps
[topCorr, topCorrIdx] = maxk(NSxTS,1);

% Summaries: mean over time of the highest match, and mean of all the magnitudes
TopCorr = mean(topCorr);
AvgCorr = mean(mean(abs(NSxTS)));
