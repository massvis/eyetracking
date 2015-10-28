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
[README_targets393](https://github.com/massvis/dataset/blob/master/csv_files/README_targets393.md) 

These include the source, category, and type of each visualization, as well as the following attributes: data-ink ratio, number of distinctive colors, black & white, visual density, human recognizable object (HRO), and human depiction. We also provide the transcribed title for each visualization and where the title was located on the visualization, as well as whether the visualization contained data or message redundancy. From we include at-a-glance memorability scores (after 1 second of viewing) and from we include prolonged memorability scores (after 10 seconds of viewing). 

Additionally, here we include the eye tracking and text description data as well.

###[fixationsByVis.zip](https://github.com/massvis/eyetracking/blob/master/csv_files/fixationsByVis.zip)

For each filename corresponding to one of the 393 visualizations, and for both the encoding and recognition phases of our visualization studies ([Borkin, Bylinskii, et al. 2015](http://vcg.seas.harvard.edu/files/pfister/files/infovis_submission251-camera.pdf)), there is a directory of user fixations. A comma-separated file corresponds to each user. Each line of the file corresponds to a single fixation and is formatted as follows: fixation number (order within fixation sequence), x and y locations of fixation in the image, fixation duration in ms. So, for example, `fixationsByVis/wsj612/enc/wab.csv` contains the fixations (during the encoding phase) of user labeled `wab` on visualizations labeled `wsj612`.

###[userDescriptions.zip](https://github.com/massvis/eyetracking/blob/master/csv_files/userDescriptions.zip)

For each of the 393 visualizations, we provide a filename with all user-generated free-form descriptions, from the recall phase of our visualization studies ([Borkin, Bylinskii, et al. 2015](http://vcg.seas.harvard.edu/files/pfister/files/infovis_submission251-camera.pdf)). Each file is formatted as one user description per line, where the user's initials are separated by a colon: from the textual description.

###[descriptionAnnotations.csv](https://github.com/massvis/eyetracking/blob/master/csv_files/descriptionAnnotations.csv)

These include the manually coded user-generated description texts as described in ([Borkin, Bylinskii, et al. 2015](http://vcg.seas.harvard.edu/files/pfister/files/infovis_submission251-camera.pdf)). This file contains one user description per line, with the following columns:
* `filename` is the name of the visualization (note: the visualization name will occur as many times as there are user descriptions for it)
* `user` includes the code for the user name
* `description quality` is the manual quality rating for the description (0-3)
* `extra insight` indicates whether or not the description includes an insight into the visualization (additional facts/information) above and beyond what was presented in the visualization (1 = mention, 0 = no mention)
* `inaccurate` indicates whether the description includes a mistake or erroneous fact in relation to the elements of the visualization or observed trend/insight (1 = inaccuracy present, 0 = correct)
* `confusion with other` indicates whether the description may be an erroneous recall of (or confusion with) a different visualization in the data set (1 = confusion, 0 = correct)
* `title mention` indicates whether the description includes a re-statement of the title or re-use of key title words/phrases (1 = mention, 0 = no mention)
* `visual element mention` indicates whether or not the description includes a mention of a non-data visual element (1 = mention, 0 = no mention)
* `data element mention` indicates whether or not the description includes a mention of a data element or visual encoding (1 = mention, 0 = no mention)
* `elements mentioned` is a list of elements (e.g. Legend, Label, etc.) that were mentioned during the description; an element is listed here if the description includes a re-statement or re-use of keywords/phrases from this element in the visualization



