% Written by: Alexandra O'Neill and Emely Valdez
% Date: 7/28/20
% Modified by: Angel Pineda
% Date: 7/29/20
% Modified by: Alexandra O'Neill
% Date: 9/24/20

% This file is meant to run each trial and the variables
% will be saved in a new file of the function run2AFC_general_squeeze_9_24_20. The file
% will be of the form "yourNametrialType_trialNumber"

% This script prompts the user to enter their name, file name of the image 
% set, and the number of images that will be displayed in the trial.

% The inputs of the user are stored into three variables. Those variables 
% are then used as parameters that are needed to call the function
% run2AFC_general_squeeze_9_24_20.

clear

% dialog box is shown to the user, prompting the user to enter their name
% the entered text is returned to the variable w
w = inputdlg('Enter your name','s');

% the character arrays in w are converted to stringarrays
strw = convertCharsToStrings(w);

% dialog box is shown to the user, prompting the user to enter the file name
% the entered text is returned to the variable x
x = inputdlg('Enter the file name','s');

% the character arrays in x are converted to stringarrays
strx = convertCharsToStrings(x);


% dialog box is shown to the user, prompting the user to enter the number
% of images in the trial
% the entered text is returned to the variable y
y = inputdlg('Enter the number of images in this trial');

% the string scalar stored in y is converted to a double precision value
numy = str2double(y);

% dialog box is shown to the user, prompting the user to enter the trial
% number of the particular image set they are working with
z = inputdlg('Enter the number trial that you are performing for this set of images (ex. 1st time using this image set, enter the word one)');
numz = convertCharsToStrings(z);

pixelFactor = 1;
% changes the size of individual pixels to magnify images based on the
% user's monitor pixel size

% run2AFC_general_squeeze_9_24_20 function is called
run2AFC_general_squeeze_9_24_20(strw, strx, numy, numz, pixelFactor);
