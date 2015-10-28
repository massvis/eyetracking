# Dataset

The user data included here corresponds to the following [paper](http://vcg.seas.harvard.edu/files/pfister/files/infovis_submission251-camera.pdf): 

```
Beyond Memorability: Visualization Recognition and Recall.
Borkin, M.*, Bylinskii, Z.*, Kim, N.W., Bainbridge C.M., Yeh, C.S., Borkin, D., Pfister, H., & Oliva, A.
IEEE Transactions on Visualization and Computer Graphics (Proceedings of InfoVis 2015)
```

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

###[targets393_metadata_withuserdata.mat](https://github.com/massvis/eyetracking/blob/master/matlab_files/targets393_metadata_withuserdata.mat)

This is a Matlab allImages struct, which contains all the fields as described in [README_targets393](https://github.com/massvis/dataset/blob/master/matlab_files/README_targets393.md) but with an additional `userdata` field.
Here we describe what you can find in the `allImages(i).userdata` field for the i-th image. To access the data for the j-th user on the i-th image: `allImages(i).userdata(j)`

Eye movements:
* `userdata(j).fixations` contains the (x,y) fixation locations collected during the encoding (`enc`) and recognition (`rec`) phases of our visualization studies ([Borkin, Bylinskii, et al. 2015](http://vcg.seas.harvard.edu/files/pfister/files/infovis_submission251-camera.pdf))
* `userdata(j).fix_durations` contains the durations (in ms) of each fixation listed in `userdata(j).fixations` (e.g. the r-th row of userdata(j).fixations corresponds to the r-th row of userdata(j).fix_durations)

Text description:
* `userdata(j).description` contains the original text created by the user and collected during the recall phase of our visualization studies ([Borkin, Bylinskii, et al. 2015](http://vcg.seas.harvard.edu/files/pfister/files/infovis_submission251-camera.pdf))
* `userdata(j).coded_desc` is the manually coded description text ([Borkin, Bylinskii, et al. 2015](http://vcg.seas.harvard.edu/files/pfister/files/infovis_submission251-camera.pdf))

The `coded_desc` field has a number of properties. We describe there here:
Text coding:
* `userdata(j).coded_desc.orig` is the original description
* `userdata(j).coded_desc.qual` is the manual quality rating for the description (0-3)
* `userdata(j).coded_desc.inclVis` indicates whether or not the description includes a mention of a non-data visual element (1 = mention, 0 = no mention)
* `userdata(j).coded_desc.inclData` indicates whether or not the description includes a mention of a data element or visual encoding (1 = mention, 0 = no mention)
* `userdata(j).coded_desc.infer` indicates whether or not the description includes an insight into the visualization (additional facts/information) above and beyond what was presented in the visualization (1 = mention, 0 = no mention)
* `userdata(j).coded_desc.title` indicates whether the description includes a re-statement of the title or re-use of key title words/phrases (1 = mention, 0 = no mention)
* `userdata(j).coded_desc.elem` is a list of elements (e.g. Legend, Label, etc.) that were mentioned during the description; an element is listed here if the description includes a re-statement or re-use of keywords/phrases from this element in the visualization
* `userdata(j).coded_desc.inacc` indicates whether the description includes a mistake or erroneous fact in relation to the elements of the visualization or observed trend/insight (1 = inaccuracy present, 0 = correct)
* `userdata(j).coded_desc.confusion` indicates whether the description may be an erroneous recall of (or confusion with) a different visualization in the data set (1 = confusion, 0 = correct)

###[visualization code](https://github.com/massvis/eyetracking/blob/master/matlab_files/visualizationCode)

We include Matlab scripts for visualizing the eyetracking data.
These visualizations were presented in the following [paper](http://web.mit.edu/zoya/www/Bylinskii_eyefixations_small.pdf):

```
Eye Fixation Metrics for Large Scale Analysis of Information Visualizations
Bylinskii, Z., Borkin, M.
First Workshop on Eyetracking and Visualizations (ETVIS 2015) in conjunction with IEEE VIS 2015
```

Please cite this paper if you use this code.


