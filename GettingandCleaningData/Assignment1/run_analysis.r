workdir="C:/Users/Venkata Adusumilli/Documents/JM/Coursera-DataScience/GettingandCleaningData/Assignment1"
setwd(workdir)


#Reading test data
test.x<-read.table("./test/X_test.txt",na.strings ="")
dim(test.x)  #2947*561
test.subject<-read.table("./test/subject_test.txt",na.strings ="")
dim(test.subject) #2947*1
test.y<-read.table("./test/y_test.txt",na.strings ="")
dim(test.y) #2947*1

#Reading train data
train.x<-read.table("./train/X_train.txt",na.strings ="")
dim(train.x) #7352*561
train.subject<-read.table("./train/subject_train.txt",na.strings ="")
dim(train.subject)  #7352*1
train.y<-read.table("./train/y_train.txt",na.strings ="")
dim(train.y)  #7352*1

#Reading activity labels 
activitylabel<-read.table("activity_labels.txt")[,2]

#Reading features and eliminating extra characters 
feature<-read.table("features.txt")[,2]
feature<-gsub("-mean","Mean",feature)
feature<-gsub("-std","STD",feature)
feature<-gsub("[-()]","",feature)

#Extracting Mean and STD columns
col_meanstd <- grepl("Mean|STD", feature)

#Assinging the activity label and names to column in the data frame
test.y[,2]<-activitylabel[test.y[,1]]
names(test.y)=c("Activity_ID","Activity_Label")
names(test.subject)="Subject"
names(test.x)=feature

#Extracting the Mean and STD column 
test.x=test.x[,col_meanstd]

#Merging test data
test.data<-cbind(test.subject,test.y,test.x)

#Assinging the activity label to training data
train.y[,2]<-activitylabel[train.y[,1]]

#Assigning column names to training data set
names(train.y)=c("Activity_ID","Activity_Label")
names(train.subject)="Subject"
names(train.x)=feature


#Extracting the Mean and STD column for training data set
train.x=train.x[,col_meanstd]

#Merge Training data
train.data<-cbind(train.subject,train.y,train.x)

#Combining train and test data
ttdata<-rbind(train.data,test.data)
dim(ttdata) #10299*89

write.table(ttdata, "./MergedData.txt", sep="\t")


#Means of columns group by Activity and Subject 
tidydata<-aggregate(ttdata[,4:89],by=list(ttdata$Activity_Label,factor(ttdata$Subject)),mean,na.rm=TRUE)

#Creating a tidydata text file
write.table(ttdata, "./tidydata.txt", sep="\t")


