#Getting and Cleaning Data project

#Download the Data
library(httr)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file <- "data.zip"
if(!file.exists(file)) {
    download.file(url, file, method = "curl")
}

#This code will unzip the downloaded file and make the appropriate folders
folder <- "UCI HAR Dataset"
results <- "results"
if(!file.exists(folder)) {
  unzip(file, list = FALSE, overwrite = TRUE)
}


#create a folder to store results
if(!file.exists(results)) {
  dir.create(results)
}

#reading the files
import <- function(filename, cols = NULL) {
  file <- paste(folder, filename, sep = "/")
  data <- data.frame()
  if(is.null(cols)) {
      data <- read.table(file, sep = "", stringsAsFactors = FALSE)
  } else {
          data <- read.table(file, sep= "", stringsAsFactors = FALSE, col.names = cols)
  }
  data
  
}

features <- impot("features.txt")

returndata <- function(type, features) {
  subject <- import(paste(type, "/", "subject_", type, ".txt", sep = ""), "id")
  ydata <- import(paste(type, "/", "y_", type,".txt", sep = ""), "activity")
  xdata <- import(paste(type, "/", "X_", type,".txt", sep = ""), features$V2)
  return(cbind(subject,ydata,xdata))
}

#read in train and test files

train <- returndata("train", features)
test <- returndata("test", features)

#function to save results
save <- function(data, name) {
  file <- paste(results, "/", name, ".txt", sep = "")
  write.table(data,file, row.name = FALSE)
}

#merge the training and the test set
library(plyr)
data <- rbind(train, test)
data <- arrange(data, id)


mean_and_std <- data[,c(1,2,grep("std", colnames(data)), grep("mean", colnames(data)))]
save(mean_and_std, "mean_and_std")

activity_labels <- returntables("activity_labels.txt")

data$activity <- factor(data$activity, levels = activity_labels$V1, labels = activity_labels$V2)

dataset <- ddply(mean_and_std, .(id, activity), .fun = function(x) {colMeans(x[,-c(1:2)])})
colnames(dataset)[-c(1:2)] <- paste(colnames(dataset[-c(1:2)]), "mean_", sep = "")
save(dataset, "tidy_dataset")
