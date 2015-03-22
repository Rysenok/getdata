test_subject<-as.numeric(readLines('./test/subject_test.txt'))
which(test_subject==2)
test_x<-read.table('./test/X_test.txt')
test_y<-readLines('./test/y_test.txt')
features<-readLines('./features.txt')
names(test_x)<-features
test_labels<-test_y
subject<-test_subject
labels<-test_labels
sum(is.na(labels))
test<-cbind(subject,labels,test_x)
names(test)

train_subject<-as.numeric(readLines('./train/subject_train.txt'))
train_x<-read.table('./train/X_train.txt')
train_y<-readLines('./train/y_train.txt')
features<-readLines('./features.txt')
names(train_x)<-features
train_labels<-train_y
subject<-train_subject
labels<-train_labels
sum(is.na(labels))
train<-cbind(subject,labels,train_x)

all<-rbind(test,train)

library(tidyr)
library(dplyr)

cut_mean<-select(all,contains("mean()"))
cut_std<-select(all,contains("std()"))

cut<-cbind(all[,1:2],cut_mean,cut_std)



b<- cut %>%
  gather(feature_letter,number,-(subject:labels)) %>%
  separate(col = feature_letter, into = c("feature","measure", "letter"),sep='-',extra='drop') %>%
  separate(col = feature, into = c("feature_id","feature"),sep=' ')

activ<-data.frame(activ=readLines('./activity_labels.txt'));activ
act<-separate(activ,activ,into=c('num','activity'),sep=' ')

bob<-b[,1:2]
bob[] <- lapply(bob, as.character)

bb<-cbind(bob,b[3:7])

for (i in 1:length(act[,1])) {
  bb[bb[,2]==act[i,1],2]=act[i,2]
}

unique(bb[,2])
names(bb)[2]<-'activity'

step4<-bb

rm(list=ls()[which(ls()!='step4'&ls()!='bb')])


#---------------
sub<-unique(bb[,1])
act<-unique(bb[,2])
id<-unique(bb[,3])

q<-filter(bb,subject==sub[1],activity==act[1])
qq<-group_by(q,feature_id)
abc<-summarize(qq,mean(number))
qqq<-unique(q[q[,3]==abc[1,1],-c(3,7)])
step5<-cbind(qqq,abc[,2])
for (i in 1:length(sub)) {
  for (j in 1:length(act)) {
    if((i!=1)|(j!=1)) {
      q<-filter(bb,subject==sub[i],activity==act[j])
      qq<-group_by(q,feature_id)
      abc<-summarize(qq,mean(number))
      qqq<-unique(q[q[,3]==abc[1,1],-c(3,7)])
      step<-cbind(qqq,abc[,2])
      step5<-rbind(step5,step)
    } 
  }
}
rm(list=ls()[which(ls()!='step4'&ls()!='step5')])
#---final tidy data----
head(step5)

#---how to use it-----
filter(step5, subject=='3',activity=='STANDING')

write.table(step5,'step5.txt', row.name=FALSE )

unique(step5[,3])
