#Reading the file into system
files<-list.files("UCI HAR Dataset")
files<-list.files("UCI HAR Dataset", recursive = T,full.names = T)
ActTest<- read.table(files[16])
ActTrain<-read.table(files[28])
SubTest<-read.table(files[14])
SubTrain<-read.table(files[26])
FeaTest<-read.table(files[15])
FeaTrain<-read.table(files[27])
#1 Merges the training and the test sets to create one data set.
Act<-rbind(ActTest,ActTrain)
Sub<-rbind(SubTest,SubTrain)
Fea<-rbind(FeaTest,FeaTrain)
FNames<-read.table(files[2])
names(Fea)<- FNames$V2
Comb<-cbind(Sub, Act)
Data <-cbind(Fea,Comb)

#2 Extracts only the measurements on the mean and standard deviation for each measurement
F<-FNames$V2[grep("mean\\(\\)|std\\(\\)", FNames$V2)]
colnames(Data)[562]<- "subjects"
colnames(Data)[563]<- "Activities"
SubData<-subset(Data, select=F)

#3 Uses descriptive activity names to name the activities in the data set
Data$activites[Data$Activities==1]<-"Walking"
Data$activities[Data$Activities== 2] <- "Walking Upstairs"
Data$activities[Data$Activities== 3] <- "Walking Downstairs"
Data$activities[Data$Activities== 4] <- "Sitting"
Data$activities[Data$Activities== 5] <- "Standing"
Data$activities[Data$Activities== 6] <- "Laying"
# 4 Appropriately labels the data set with descriptive variable names. 
names(Data) <- gsub("Acc", "Accelerator", names(Data))
names(Data) <- gsub("Mag", "Magnitude", names(Data))
names(Data) <- gsub("Gyro", "Gyroscope", names(Data))
names(Data) <- gsub("^t", "time", names(Data))
names(Data) <- gsub("^f", "frequency", names(Data))
Data$subjects <- as.character(Data$subjects)
Data$subjects[Data$subjects == 1] <- "Subject 1"
Data$subjects[Data$subjects == 2] <- "Subject 2"
Data$subjects[Data$subjects == 3] <- "Subject 3"
Data$subjects[Data$subjects == 4] <- "Subject 4"
Data$subjects[Data$subjects == 5] <- "Subject 5"
Data$subjects[Data$subjects == 6] <- "Subject 6"
Data$subjects[Data$subjects == 7] <- "Subject 7"
Data$subjects[Data$subjects == 8] <- "Subject 8"
Data$subjects[Data$subjects == 9] <- "Subject 9"
Data$subjects[Data$subjects == 10] <- "Subject 10"
Data$subjects[Data$subjects == 11] <- "Subject 11"
Data$subjects[Data$subjects == 12] <- "Subject 12"
Data$subjects[Data$subjects == 13] <- "Subject 13"
Data$subjects[Data$subjects == 14] <- "Subject 14"
Data$subjects[Data$subjects == 15] <- "Subject 15"
Data$subjects[Data$subjects == 16] <- "Subject 16"
Data$subjects[Data$subjects == 17] <- "Subject 17"
Data$subjects[Data$subjects == 18] <- "Subject 18"
Data$subjects[Data$subjects == 19] <- "Subject 19"
Data$subjects[Data$subjects == 20] <- "Subject 20"
Data$subjects[Data$subjects == 21] <- "Subject 21"
Data$subjects[Data$subjects == 22] <- "Subject 22"
Data$subjects[Data$subjects == 23] <- "Subject 23"
Data$subjects[Data$subjects == 24] <- "Subject 24"
Data$subjects[Data$subjects == 25] <- "Subject 25"
Data$subjects[Data$subjects == 26] <- "Subject 26"
Data$subjects[Data$subjects == 27] <- "Subject 27"
Data$subjects[Data$subjects == 28] <- "Subject 28"
Data$subjects[Data$subjects == 29] <- "Subject 29"
Data$subjects[Data$subjects == 30] <- "Subject 30"
Data$subjects <- as.factor(Data$subjects)

#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#I don't know  how to do it

