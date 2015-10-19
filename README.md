# Dataset

The eyetracking data corresponds to the following paper: 

<dl>
Beyond Memorability: Visualization Recognition and Recall.<br>
Borkin, M., Bylinskii, Z., Kim, N.W., Bainbridge C.M., Yeh, C.S., Borkin, D., Pfister, H., & Oliva, A.<br>
IEEE Transactions on Visualization and Computer Graphics (Proceedings of InfoVis 2015)<br>
</dl>

Please cite this paper if you use this data.

On this public github repository we can only provide the meta-data and labels.
To obtain the source images, please fill out the following [request form](http://massvis.mit.edu/#data).

By using this dataset, you are agreeing to the following license agreement:
> Access to, and use of, the images, and annotations in this dataset are for research and educational uses only. No commercial use, reproduction or distribution of the images, or any modifications thereof, is permitted.* 

---

*To use any of these images in a research paper or technical report, do not exceed thumbnail size.

This data contains taxonomic labels and attributes for 393 visualizations, as described in:
[README_targets393](https://github.com/massvis/dataset/blob/master/matlab_files/README_targets393.md) 

These include the source, category, and type of each visualization, as well as the following attributes: data-ink ratio, number of distinctive colors, black & white, visual density, human recognizable object (HRO), and human depiction. We also provide the transcribed title for each visualization and where the title was located on the visualization, as well as whether the visualization contained data or message redundancy. From we include at-a-glance memorability scores (after 1 second of viewing) and from we include prolonged memorability scores (after 10 seconds of viewing). 

Additionally, here we include the eye tracking and text description data as well.

###[targets393_metadata_withfixations.mat](https://github.com/massvis/eyetracking/blob/master/targets393_metadata_withfixations.mat)

This is a Matlab allImages struct, which contains all the fields as described in [README_targets393](https://github.com/massvis/dataset/blob/master/matlab_files/README_targets393.md) but with an additional userdata field.
Here we describe what you can find in the `allImages(i).userdata` field for the i-th image. To access the data for the j-th user on the i-th image: `allImages(i).userdata(j)`


Eye movements:
* `userdata(j).fixations` contains the (x,y) fixation locations collected during the encoding (`enc`) and recognition (`rec`) phases of our visualization studies (Borkin, Bylinskii, et al. 2015)
* `userdata(j).fix_durations` contains the durations (in ms) of each fixation listed in `userdata(j).fixations` (e.g. the r-th row of userdata(j).fixations corresponds to the r-th row of userdata(j).fix_durations)

Text description:
* `userdata(j).description` contains the original text created by the user and collected during the recall phase of our visualization studies (Borkin, Bylinskii, et al. 2015)
* `userdata(j).coded_desc` is the manually rated description text (Borkin, Bylinskii, et al. 2015)

###[fixationsByVis.zip](https://github.com/massvis/eyetracking/blob/master/fixationsByVis.zip)

For each filename corresponding to one of the 393 visualizations, and for both the encoding and recognition phases of our visualization studies (Borkin, Bylinskii, et al. 2015), there is a directory of user fixations. A comma-separated file corresponds to each user. Each line of the file corresponds to a single fixation and is formatted as follows: fixation number (order within fixation sequence), x and y locations of fixation in the image, fixation duration in ms. So, for example, `fixationsByVis/wsj612/enc/wab.csv' contains the fixations (during the encoding phase) of user labeled `wab' on visualizations labeled `wsj612'.
