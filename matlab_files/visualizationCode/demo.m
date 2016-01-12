% Zoya Bylinskii, October 19, 2015
% https://github.com/massvis
% massvis.mit.edu

% Depends on code from: https://github.com/cvzoya/fixation-visualization


%% set parameters for visualization purposes

params = struct();
params.thresh = 0.1;
params.sigma = 32;
params.scaleFact = 4; % a larger number speeds up computation

%% if you want to accumulate fixations from the massvis dataset:
% if you want to input your own images or fixations, skip to the code below

load('allImages.mat');

whichfix = 'enc'; % or 'rec'
whichim = 1;
% whichusers = [3,4,5]; 
% to use all users:
whichusers = 1:length(allImages(whichim).userdata); 

% accumulate fixations from multiple users

im = imread(allImages(whichim).impath);
imsize = [size(im,1),size(im,2)];
maxsize = max(imsize(1),imsize(2));

fixations = [];
for j = 1:length(whichusers)
    
    whichuser = whichusers(j);
    
    % check if fixations exist for this user and include them if they do
    if isempty(allImages(whichim).userdata(whichuser).fixations) || ...
            ~isfield(allImages(whichim).userdata(whichuser).fixations,whichfix) || ...
            isempty(allImages(whichim).userdata(whichuser).fixations.(whichfix))
        continue;
    end
    
    fixdata = allImages(whichim).userdata(whichuser).fixations.(whichfix);
    fixations = [fixations ; fixdata];

end
    
%% plot fixation heatmap

plotFixationHeatmap(im, fixations, params);

%% plot coverage map

plotCoverageMap(im, fixations, params); 
   
%% plot coverage at different thresholds

for i = 1:2:10
    params.thresh = i/10;
    plotCoverageMap(im, fixations, params); 
end

%% plot the ordered sequence of fixations for a particular observer
% on a particular visualization
whichuser = 5;

fix = allImages(whichim).userdata(whichuser).fixations.(whichfix);
nfix = size(fix,1);

im = imread(allImages(whichim).impath);
%im_cur = rgb2gray(im);
im_cur = im;

% plot fixations in a sequence with numbers indicating order of fixations, 
% and lines connecting consecutive fixations
figure; cols = colormap(autumn(nfix));
imshow(im_cur);
hold on;
for f = 1:(nfix-1)
    plot(fix(f:(f+1),1),fix(f:(f+1),2),'LineWidth',5,'color',cols(f,:))
end
for f = 1:nfix
    text(fix(f,1),fix(f,2),['{\color{black}\bf', num2str(f), '}'],...
        'FontSize', 16, 'BackgroundColor', cols(f,:));
end

%% plot the fixations of a single observer on current visualization

if strcmp(whichfix,'enc')
    plotFixationsOnIm(whichim,allImages,1,0,whichuser,1)
else
    plotFixationsOnIm(whichim,allImages,2,0,whichuser,1)
end


%% plot the fixations of a group of observers on current visualization, 
% pausing between observers

if strcmp(whichfix,'enc')
    plotFixationsOnIm(whichim,allImages,1,1,whichusers,1)
else
    plotFixationsOnIm(whichim,allImages,2,1,whichusers,1)
end

     