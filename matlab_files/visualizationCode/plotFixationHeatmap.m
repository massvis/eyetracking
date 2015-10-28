% Zoya Bylinskii, October 19, 2015
% https://github.com/massvis
% massvis.mit.edu

% Overlay fixations as a continuous heatmap on top of image by placing a
% Gaussian with a chosen sigma on top of each fixation

function plotFixationHeatmap(im, fixations, params)
% im is an image on which to overlay fixations
% fixations is an Nx2 array with the (x,y) locations of fixations
% params.scaleFact scales down the computation for computation purposes (see below)
% params.sigma of the Gaussian to place at each fixation location

if nargin < 3, params = struct(); end
if ~isfield(params,'sigma'), params.sigma = 32; end % Gaussian sigma to blur fixations by
if ~isfield(params,'scaleFact'), params.scaleFact = 1; end
% this just scales down the computation,
% computing on a smaller version of the image; thus, if scaleFact > 1, you
% get a faster-to-compute approximation

map = makeMap(fixations,size(im,1),size(im,2),params);
map = map/max(map(:));
     
figure; imshow(heatmap_overlay(im,map,'hot')); title('Fixation Heatmap');

