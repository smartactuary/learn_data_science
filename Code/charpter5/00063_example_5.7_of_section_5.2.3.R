# example 5.7 of section 5.2.3 
# (example 5.7 of section 5.2.3)  : Choosing and evaluating models : Evaluating models : Evaluating probability models 
# Title: Plotting the receiver operating characteristic curve 
# install.packages('ROCR')
library('ROCR')
eval <- prediction(spamTest$pred,spamTest$spam)
plot(performance(eval,"tpr","fpr"))
print(attributes(performance(eval,'auc'))$y.values[[1]])
## [1] 0.9660072

mitrFPR<-NA
mitrTPR<-NA

for (i in 1:99999) {

mtb<-table(spamTest$spam,spamTest$pred>=i/100000)

TPR<-mtb[2,2]/sum(mtb[2,2]+mtb[2,1])
FPR<-mtb[1,2]/sum(mtb[1,2]+mtb[1,1])

mitrFPR[i]<-FPR
mitrTPR[i]<-TPR

}

plot(mitrFPR,mitrTPR)

myframe<-data.frame(FPR=mitrFPR,TPR=mitrTPR)

ggplot(myframe,aes(x=FPR,y=TPR))+geom_line()+ylim(0,1)
