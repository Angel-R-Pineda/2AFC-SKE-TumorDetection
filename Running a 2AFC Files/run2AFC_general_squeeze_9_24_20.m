function run2AFC_general_squeeze_9_24_20(userName,trialType, nImages, trialNumber,pixelFactor)
% Written by: Alexandra O'Neill and Emely Valdez
% Date: 7/28/20
% Modified by: Angel Pineda
% Date: 7/29/20
% Modified by: Alexandra O'Neill
% Date: 9/24/20


% This function is responsible for actually running the 2AFC experiments.
% It does so by calling the Test2AFC_general_squeeze_9_24_20 function and storing 
% the necessary parameters for the study. 

% The inputs are the name of the participant, the type of trial one is
% running (a.k.a file name), and the number of images one would
% like to run in the trial, and the pixel factor one wants to apply to the images
% (this will depend on monitor pixel size as well). 

% The output of this function is the percentage of images that the user
% correctly identified as containing the signal. Additionally, this function stores 
% the trial as a new file with all of the variables from the trial including 
% the array of times in between selected images, the images that were 
% selected correctly or incorrectly as having or not having the signal, 
% and the array of the user's click coordinates.


% horizontally concatenates the character vectors trialType(name of the file) 
% and .mat then returns the new character vector to dataFileName
dataFileName = strcat(trialType,'.mat');

% load variables from the .mat file that contains the image arrays 
% into the workspace
load(dataFileName);

% creates the name of the file that will be saved for the individual run of 2AFC 
trial_File_Name = strcat(userName, trialType,trialNumber);

% initializing variable, will represent the sum of correct answers 
% in the experiment
correctResponsesTotal = 0;

% totalNumImages = numberOfImages, dimR = dimension of rows of individual
% images, dimC = dimension of columns of individual images
[totalNumImages, dimR, dimC] = size(tumorImageArray);

% assuming that the images are square
dimension = dimR;

% initializes array to be filled with the times of each trial
timeOfTrialsArray = zeros(1, nImages);

% creating a 1 x nimages array of all zeros for the variables truPositive,
% trueNegative, falsePositive, and falseNegative

% array of images that the user correctly selected as having signal
truePositive = zeros(1,nImages);

% array of images that the user correctly selected as not having signal
trueNegative = zeros(1,nImages);

% array of images that the user incorrectly selected as having signal
falsePositive= zeros(1,nImages);

% array of images that the user incorrectly selected as not having signal
falseNegative = zeros(1,nImages);



order = 1:totalNumImages;
% creating an array to randomize the order of the images

% randperm returns a row vector of a random permutation of the integers 1
% to totalNumImages so that the images appear in a random order and no
% image will be displayed more than once per trial
randomOrderForNoise =  order(randperm(totalNumImages));
randomOrderForSignal = order(randperm(totalNumImages));

% initializing an array of the x and y coordinates for the images
coordinateArray = zeros(nImages,2);
    
% for loop that calls the function Test2AFC_general_squeeze_9_24_20 for values of j between 1 and 
% nImages
for j = 1:nImages 
    
    
    % Below code selects the no tumor image corresponding to the jth index 
    % from randomOrderForNoise, and squeezes it to be one 2D image
    sampleNoTumorImage = squeeze(noTumorImageArray(randomOrderForNoise(j),:,:)); 
 
    % Below code selects the no tumor image corresponding to the jth index
    % and squeezes it to be one 2D image 
    sampleTumorImage = squeeze(tumorImageArray(randomOrderForSignal(j),:,:));
    
    
    % calls the function Test2AFC_general_squeeze_9_24_20 which prompts the user to select
    % an image and stores the coordinates of the user's click, if the user 
    % chooses the image with a signal, jthAnswer = 1. If the user chooses the
    % image without a signal, jthAnswer = 0
    % function returns the jthAnswer and jthCoordinates
    [jthAnswer, jthCoordinates] = Test2AFC_general_squeeze_9_24_20(dimension,sampleTumorImage,sampleNoTumorImage,signalImage,pixelFactor);
    
    % assigning jthCoordinates to the the jth row of the coordinateArray
    coordinateArray(j,:) = jthCoordinates;
    
    % assigning the time of the jth trial into the jth position in 
    % timeOfTrialsArray
    timeOfTrialsArray(j) =  toc;
   
    % Updates total number of correct responses variable by adding the 
    % jth answer (either 0 or 1) to the total number of correct responses    
    correctResponsesTotal = correctResponsesTotal + jthAnswer;
    
    
    % The below code records the image indices of true positive,
    % true negative, false positive, and false negative which results in
    % correspondingly named arrays
    
    %if user correctly selected image with signal
    if jthAnswer == 1
        
        % the jth entry of the  truePositive array is filled w/ the image # 
        % from array randomOrderForSignal that was displayed in the jth trial
        truePositive(j) = randomOrderForSignal(j);
        
        % the jth entry of the  trueNegative array is filled w/ the image # 
        % from array randomOrderForNoise that was displayed in the jth trial  
        trueNegative(j) = randomOrderForNoise(j);
        
    %if user incorrectly selected image with signal
    else
        
        % the jth entry of the  falsePositive array is filled w/ the image # 
        % from array noiseArrayRandOrder that was displayed in the jth trial 
        falsePositive(j) = randomOrderForSignal(j);
        
        % the jth entry of the  falseNegative array is filled w/ the image # 
        % from array randomOrderForNoise that was displayed in the jth trial  
        falseNegative(j) = randomOrderForNoise(j);
    end 
end

% calculates the number of correct responses out of the number possible 
% to get correctly
percentageCorrect = (sum(correctResponsesTotal)/nImages)*100; 

% displays the individual user's percentage correct
display(percentageCorrect) 

% saves entire workspace to a file
save(trial_File_Name)
end 