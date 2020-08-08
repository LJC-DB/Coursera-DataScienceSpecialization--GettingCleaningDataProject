# Getting and Cleaning Data Project

## Tasks

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data 
* The README that explains the analysis files is clear and understandable.

## Files present on repository

* ['run_analysis.R'](run_analysis.R): Executes the code to generate the tidy dataset from the original data
* ['CodeBook.md'](CodeBook.md): Explanation from original dataset and the process to generate this variables of the tidy dataset
* ['tidydata.txt'](tidydata.txt): The tidy dataset in .txt format

### Reading the dataset

For reading the data into R, the following code can be used:

```{r}
read.table('tidydata.txt', header=T)
```
