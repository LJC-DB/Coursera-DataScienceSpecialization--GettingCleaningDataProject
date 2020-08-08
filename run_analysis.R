#reading the data
xtrain = read.table('UCI HAR Dataset/train/X_train.txt')
ytrain = read.table('UCI HAR Dataset/train/y_train.txt')
subject_train = read.table('UCI HAR Dataset/train/subject_train.txt')
xtest = read.table('UCI HAR Dataset/test/X_test.txt')
ytest = read.table('UCI HAR Dataset/test/y_test.txt')
subject_test = read.table('UCI HAR Dataset/test/subject_test.txt')

#merging the files on train and test folders
xdata = rbind(xtrain, xtest)
ydata = rbind(ytrain, ytest)
subjectdata = rbind(subject_train, subject_test)

#subsetting the mean and standard deviation
featuresnames = read.table('UCI HAR Dataset/features.txt')
names(xdata) = featuresnames[[2]]
xdata = xdata[, grepl('(mean\\(\\))|(std\\(\\))', names(xdata))]

#changing the activity numbers for its labels
labels = read.table('UCI HAR Dataset/activity_labels.txt')[[2]]
names(ydata) = 'Activity_labels'
ydata[1] = sapply(ydata, function(c) labels[c])

#merging all files
names(subjectdata) = 'Subject'
data = cbind(subjectdata, ydata, xdata)

#taking the average for each activity and each subject
finaldata = aggregate(data[,3:ncol(data)],by=list(data$Activity_labels, data$Subject), mean, na.rm=T)
names(finaldata)[1:2] = c('ByActivityLabels', 'BySubject')
names(finaldata)[3:ncol(finaldata)] = paste('Avarageof', names(finaldata)[3:ncol(finaldata)])

#saving the data to a file
write.table(finaldata, 'tidydata.txt', row.name = F)
