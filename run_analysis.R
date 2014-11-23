#calling some used packages
reqpack=c("plyr","dplyr","data.table")
sapply(reqpack,require,character.only=TRUE)

#Reading all the data into R

xtrn <- read.table("train/X_train.txt")       #training data
ytrn <- read.table("train/y_train.txt")       #training labels
strn <- read.table("train/subject_train.txt") #training subjects
xtst <- read.table("test/X_test.txt")         #testing data
ytst <- read.table("test/y_test.txt")         #testing labels
stst <- read.table("test/subject_test.txt")   #testing subjects
ftrs <- read.table("features.txt")            #features-->data column headers
acts <- read.table("activity_labels.txt")     #activities-->label names

#Merging training and testing data to a single data frame

X <- rbind(xtrn,xtst); colnames(X) <- ftrs[,2]  #join measurements and give descriptive var names
Y <- rbind(ytrn,ytst); colnames(Y) <- "Activity"#join label data 
S <- rbind(strn,stst); colnames(S) <- "Subject" #join subject data

meansdfilter <- grep("-mean\\(\\)|-std\\(\\)", ftrs[, 2])   #filtering out mean and sd variables
X <-X[,meansdfilter]         #extracting only the measurements with mean and sd
Y[,1] <- acts[Y[,1],2]       #assigning appropriate activity descriptions
mrg1<-cbind(S,Y,X)           #merging the cleaned data set

#Creating new tidy data set with averages 

tidydata <- aggregate(mrg1[, 3:ncol(mrg1)],
                      by=list(Subject = mrg1$Subject,
                              Activity = mrg1$Activity),
                      mean)

#Output of the project analysis
write.table(tidydata,"tidydata.txt",row.name=FALSE)
View(tidydata)
                              
