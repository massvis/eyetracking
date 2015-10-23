% Function for working with provided allImages struct and displaying
% fixation locations (by duration, if desired). This function can overlay
% the fixations of one or multiple observers on a chosen visualization.
% The fixations can be overlayed all at once, or allowing the user to 
% display progressively more fixations. According to the experiment in
% Borkin, Bylinskii et al. (2015), here we can plot both the encoding (enc)
% and recognition (rec) fixations separately or together (but in different
% color spaces).

% Zoya Bylinskii
% July 2015
% code for http://massvis.mit.edu

function plotFixationsOnIm(imnum,allImages,toshow,pausewhen,subj,bydur)

% imnum is the image number to access in the allImages struct
% subj is which participants worth of fixations to show
% pausewhen = 0 -> don't pause; show all fixations for all users right away
%           = 1 -> pause after each user; show all fixations per user
%           = 2 -> pause after each fixation
% toshow    = 0 -> all fixations
%           = 1 -> encoding fixations
%           = 2 -> recall fixations
% bydur     = 1 -> make fixation circles proportional to fixation duration
%           = 0 -> fix fixation circles to a constant size

nusers = length(allImages(imnum).userdata);
if nargin < 5, subj = 1:nusers; end
%%

figure;
im = imread(allImages(imnum).impath);
%imshow(rgb2gray(im)); 
imshow(im);
hold on;

for j = subj 
    
    cur = allImages(imnum).userdata(j);
    
    if isempty(cur.fixations), continue; end
    
    colors1 = colormap(autumn(size(cur.fixations.enc,1))); 
    colors2 = colormap(winter(size(cur.fixations.rec,1))); 
    
    if toshow==0 || toshow==1
        nfix = size(cur.fixations.enc,1);
        
        for k = 1:nfix
            
            col = colors1(k,:);

            if bydur
                fixsize = cur.fix_durations.enc(k)/10;
                plot(cur.fixations.enc(k,1),cur.fixations.enc(k,2),'o','Color',col,'MarkerSize',fixsize,'LineWidth',3); 
            else
                plot(cur.fixations.enc(k,1),cur.fixations.enc(k,2),'o','Color',col,'MarkerSize',20,'LineWidth',3); 
            end

            if pausewhen==2, pause; end
        end
    end
    
    if toshow==0 || toshow==2
        nfix = size(cur.fixations.rec,1);
        
        for k = 1:nfix
            
            col = colors2(k,:);

            if bydur
                fixsize = cur.fix_durations.rec(k)/10;
                %plot(cur.fixations.rec(k,1),cur.fixations.rec(k,2),'.','Color',col,'MarkerSize',fixsize);
                plot(cur.fixations.rec(k,1),cur.fixations.rec(k,2),'o','Color',col,'MarkerSize',fixsize,'LineWidth',3);
            else
                plot(cur.fixations.rec(k,1),cur.fixations.rec(k,2),'.','Color',col,'MarkerSize',40); 
            end
                
            if pausewhen==2, pause; end
        end        
    end
    
    if pausewhen==1 || pausewhen==2, pause; end

end



