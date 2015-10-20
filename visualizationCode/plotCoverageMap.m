% Zoya Bylinskii, October 19, 2015
% https://github.com/massvis
% massvis.mit.edu

% Overlay coverage map on top of image

function plotCoverageMap(im, fixations, params)
% im is an image on which to overlay fixations
% fixations is an Nx2 array with the (x,y) locations of fixations
% scaleFact scales down the computation for computation purposes (see below)
% sigma of the Gaussian to place at each fixation location

if nargin < 3, params = struct(); end
if ~isfield(params,'thresh'), params.thresh = 0.1; end % threshold to cut heatmap at
if ~isfield(params,'sigma'), params.sigma = 32; end % Gaussian sigma to blur fixations by
if ~isfield(params,'scaleFact'), params.scaleFact = 1; end
% this just scales down the computation,
% computing on a smaller version of the image; thus, if scaleFact > 1, you
% get a faster-to-compute approximation

map = makeMap(fixations,size(im,1),size(im,2),params);
map = map/max(map(:));
     
figure; imshow(map>params.thresh); title('Coverage');

im_new = imresize(im,size(map));

for ii = 1:size(im_new,3)
   temp = im_new(:,:,ii);
   temp(map<=params.thresh) = 0;
   im_new(:,:,ii) = temp;
end

figure; imshow(im_new); title('Overlayed Coverage');