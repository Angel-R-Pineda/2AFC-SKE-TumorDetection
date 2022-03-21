# 2AFC-SKE-TumorDetection

This repository runs a 2 alternative forced choice experiment where you will attempt to detect a tumor in one of two images presented to you. The 2AFC experiment that you will be participating in is going to measure the detectability of the tumors in the images that you are presented. There are three Matlab function or script files that are used to run this experiment. There are also two example image data files for your use. 

1. run2AFC:

The inputs to this function are the dimension of the images in the array, an array of images with the signal present, an array of images without the signal present, and an image of the isolated signal itself. You will not be directly calling this function, as it is called within a larger function that is described below. 

The outputs of this function are the number of images that the user correctly chose as containing the signal and an array of the coordinates where the user clicked on the image. 


2. iterate2AFC_trials:

The inputs to this function are the name of the participant, the type of trial (name of the image file) that one is running, and the number of images that one would like to run in the study. 

The output of this function is the percentage of images that the user correctly identified as containing the signal. The way to call this function and run the 2AFC test is described below. 

This function also stores the array of coordinates for the entire trial. Lastly, this function stores arrays of the images that the user identified correctly and incorrectly as having or not having the tumor and they are labeled as such: truePositive, trueNegative, falsePositive, falseNegative.

3. runExperiment_Template

This function is the only function you will actually run in Matlab. Once running, you will enter your name, the image file name (WITHOUT .mat), the number of images you want to run in the trial (integer enter), and the trial number of the image set. Most of this information is used to store the data.


Directions: 

In the folder that you have received, along with this ReadMe file, there are 5 files: the 2 function files that are explained above, 1 run template file, and 2 data files with the sets of images that you will be using for this study.

The only file that will be run is the runExperiment_Template file. Open this file and run it. The file will prompt you to enter the necessary information to start the experiment and store the data.

Once you run the template and enter the necessary information as explained above, a figure window will appear with 3 images, one containing the signal, one not containing the signal, and one of the isolated signal itself. Your job is to click on the image (left or right) that you believe the signal is in. After each click, whether you got it correct or incorrect will appear in the command window. After you have completed all nImages trials, your percentage selected correctly will appear as the output.

You will run this experiment twice with both of the data arrays that are provided in the folder and your trials will be recorded and stored. Your trials will be saved as separate files called ‘userName_trialType_trialNumber’ for future reference and analysis. 
