This is a code book that explains the variables, the data,
transformation or any other work used to clean up data for a Data
Science course ‘Getting and Cleaning Data’ on Coursera. The
corresponding R script is “run.analysis.R”.

**The Data Source**

Original data:
<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" class="uri">https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>
Original description of the dataset:
<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" class="uri">http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a>

**Project Requirements**

The purpose of this project is to demonstrate your ability to collect,
work with, and clean a data set. The goal is to prepare tidy data that
can be used for later analysis. You will be graded by your peers on a
series of yes/no questions related to the project. You will be required
to submit: 1) a tidy data set as described below, 2) a link to a Github
repository with your script for performing the analysis, and 3) a code
book that describes the variables, the data, and any transformations or
work that you performed to clean up the data called CodeBook.md. You
should also include a README.md in the repo with your scripts. This repo
explains how all of the scripts work and how they are connected.

You should create one R script called run\_analysis.R that does the
following.

1.  Merges the training and the test sets to create one data set.

2.  Extracts only the measurements on the mean and standard deviation
    for each measurement.

3.  Uses descriptive activity names to name the activities in the data
    set

4.  Appropriately labels the data set with descriptive variable names.

5.  From the data set in step 4, creates a second, independent tidy data
    set with the average of each variable for each activity and each
    subject.

**Details of the Data**

-   ‘README.txt’

-   ‘features\_info.txt’: Shows information about the variables used on
    the feature vector.

-   ‘features.txt’&lt;- `features`: List of all features.

-   ‘activity\_labels.txt’ &lt;- `activities`: Links the class labels
    with their activity name.

-   ‘subject\_test.txt’ &lt;- `subject test`: Data of volunteers for
    test data being observed

-   ‘subject\_train.txt’ &lt;- `subject train`: Data of volunteers for
    training data being observed

-   ‘train/X\_train.txt’ &lt;- `x_train`: Training set.

-   ‘train/y\_train.txt’ &lt;- `y_train`: Training labels.

-   ‘test/X\_test.txt’ &lt;- `x_test`: Test set.

-   ‘test/y\_test.txt’ &lt;- `x_test`: Test labels

**Steps followed in analysis**

Packages used: `{library(dplyr)`

1.  Data downloaded from the URL

2.  Variables (as mentioned above) assigned.

3.  Merged the data using `rbind` and `cbind` functions into one data
    set called `FinalData`

4.  Assigned descriptive names to each column using `gsub` function.

5.  Created an independent new data called `MainData`, which contains
    the mean of each variable for each activity and each subject.

6.  Exported the data into `'MainData.txt'`file.
