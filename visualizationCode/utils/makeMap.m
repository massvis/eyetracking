% Zoya Bylinskii, October 19, 2015
% https://github.com/massvis
% massvis.mit.edu

function heatMap = makeMap(fixations,imsize1,imsize2,params)
% fixations is an Nx2 array with the (x,y) locations of fixations

if nargin < 3, params = struct(); end
if ~isfield(params,'sigma'), params.sigma = 32; end % Gaussian sigma to blur fixations by
if ~isfield(params,'scaleFact'), params.scaleFact = 1; end
% this just scales down the computation,
% computing on a smaller version of the image; thus, if scaleFact > 1, you
% get a faster-to-compute approximation

scaleFact = params.scaleFact;
sigma = params.sigma/scaleFact; 
filtersize = max(imsize1,imsize2)/scaleFact;

heatMap = zeros(floor(imsize1/scaleFact),floor(imsize2/scaleFact));
for i = 1:size(fixations,1)
    heatMap(max(floor(fixations(i,2)/scaleFact),1),max(floor(fixations(i,1)/scaleFact),1)) = 1;
end

heatMap = imfilter(heatMap,fspecial('gaussian',filtersize,sigma));