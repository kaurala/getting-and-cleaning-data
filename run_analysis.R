#set the work directory
setwd("E:/coursera/Getting and cleaning data/assignment/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/")
#load the two dataset, subject, state of activities
initial<-read.table("train/X_train.txt", nrows=100)
classes<-sapply(initial,class)
traindata <- read.table("train/X_train.txt", colClasses = classes)
system.time(read.table("train/X_train.txt", colClasses = classes))
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
testdata <- read.table("test/X_test.txt")
#step4.label the dataset with descriptive variable names
features <- read.table("features.txt", stringsAsFactors = FALSE)
colnames(traindata) <- features[,2];colnames(testdata) <- features[,2]
#create two new variable that identify the dataset and subject
traindata$subject <- subject_train[, 1]
testdata$subject <- subject_test[, 1]
traindata$identity <- "train" 
testdata$identity <- "test"
#create a new columns that describe the activities
trainlabel <- read.table("train/y_train.txt")
testlabel <- read.table("test/y_test.txt")
traindata$label <- trainlabel[, 1]
testdata$label <- testlabel[, 1]
#step1. merges the training and test sets
##test the identical column names of the two data
which(ifelse(names(testdata) == names(traindata), 1, 0) == 0)
rownames(traindata) <- NULL; rownames(testdata) <- NULL
alldata <- rbind(testdata, traindata)
#step2. extract on the measurement on the mean and sd
## identify the variable of mean and sd
mean <- grep("mean()", colnames(alldata), fixed = TRUE)
std <- grep("std()", colnames(alldata), fixed = TRUE)
selcol <- c(unique(c(mean, std)), 562, 563, 564)
data_ms <- alldata[, selcol]
#step3. add descriptive activity names to the label column in the dataset
act <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
activitylabel <- unique(act[, 2])
data_ms$descrip_acti <- factor(data_ms$label, levels = 1:6, labels = activitylabel)
#step5.new dataset with the average of each variable for each activity
grouptable <- function(dataset, func) {
        ncol <- dim(dataset)[2] - 4
        nrow <- dim(aggregate(dataset[, 1], list(dataset[, ncol + 1], 
                                                 dataset[, ncol + 4]), func))[1]
        newdata <- data.frame(nrow = nrow)
        datafunc <- data.frame()
        for (i in 1:ncol) {
                ncolname <- names(dataset)[i]
                datafunc <- aggregate(dataset[, i], list(dataset[, ncol + 1], 
                                                         dataset[, ncol + 4]), func)
                newdata <- cbind(newdata, datafunc[, 3])
                names(newdata)[i + 1] <- ncolname
                datalabel <- datafunc[, 1:2]
        }
        datafunlab <- data.frame(datalabel, newdata)
        datafunlab <- datafunlab[, -3]
        names(datafunlab)[1] <- "subject"; 
        names(datafunlab)[2] <- "activity";
        datafunlab
}
tidydata <- grouptable(data_ms, "mean")
write.table(tidydata,"tidy data.txt", row.name = FALSE)










