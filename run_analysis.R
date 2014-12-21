working_dir=getwd()
location<-paste(working_dir,"train/X_train.txt",sep="/")
temp1<-read.table(location)
location<-paste(working_dir,"test/X_test.txt",sep="/")
temp2<-read.table(location)
x_train_test<-rbind(temp1, temp2)
## Replacing tmp1 and tmp2 variables
location<-paste(working_dir,"train/subject_train.txt",sep="/")
temp1<-read.table(location)
location<-paste(working_dir,"test/subject_test.txt",sep="/")
temp2<-read.table(location)
subject_train_test<-rbind(temp1, temp2)
## Replacing tmp1 and tmp2 variables again
location<-paste(working_dir,"train/y_train.txt",sep="/")
temp1<-read.table(location)
location<-paste(working_dir,"test/y_test.txt",sep="/")
temp2<-read.table(location)
y_train_test<-rbind(temp1, temp2)
location<-paste(working_dir,"features.txt",sep="/")
features<-read.table(location)
location<-paste(working_dir,"activity_labels.txt",sep="/")
activity_labels<-read.table(location)

## End of reading from files

good_feature_indices<-grep("-mean\\(\\)|-std\\(\\)",features[,2])
x_train_test<-x_train_test[,good_feature_indices] # Replacing x_train_test and removing other rows
names(x_train_test)<-features[good_feature_indices,2]
names(x_train_test)<-gsub("\\(|\\)", "",names(x_train_test))
names(x_train_test)<-tolower(names(x_train_test))

activity_labels[,2]=gsub("_", "",tolower(as.character(activity_labels[,2])))
Y[,1]=activity_labels[Y[,1],2]
names(y_train_test)<-"activity"

names(subject_train_test)<-"subject"
cleaned_data<-cbind(subject_train_test, y_train_test, x_train_test)

unique_subjects=unique(subject_train_test)[,1]
no_of_subjects=length(unique(subject_train_test)[,1])
no_of_activity_labels=length(activity_labels[,1])
no_of_columns=dim(cleaned_data)[2]
result=cleaned_data[1:(no_of_subjects*no_of_activity_labels),]
row=1
for(i in 1:no_of_subjects) {
    for(j in 1:no_of_activity_labels) {
        result[row,1]=unique_subjects[i]
        result[row,2]=activity_labels[j,2]
        temp<-cleaned_data[cleaned_data$subject==i & cleaned_data$activity==activity_labels[j,1],]
        result[row,3:no_of_columns]<-colMeans(temp[,3:no_of_columns],na.rm=TRUE)
        row=row+1
    }
}

## Writing to files

location<-paste(getwd(),"Clean_data.txt",sep="/")
write.table(cleaned_data,location,row.name=FALSE)
location<-paste(getwd(),"Activity_subject_averages.txt",sep="/")
write.table(result,location)