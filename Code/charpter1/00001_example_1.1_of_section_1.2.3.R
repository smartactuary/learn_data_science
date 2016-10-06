# example 1.1 of section 1.2.3 
# (example 1.1 of section 1.2.3)  : The data science process : Stages of a data science project : Modeling 
# Title: Building a decision tree 
library(ggplot2)
library('rpart')
setwd('D:\\study\\r\\learn_data_science\\Data\\Charpter1')
load('GCDData.RData')

#move to result  directory
setwd('D:\\study\\r\\learn_data_science\\Results\\Charpter1')

str(creditdata)
head(creditdata)
table(creditdata$Good.Loan)

pdf(file="the fraction of defaulting loans by credit history category.pdf")

ggplot(data=creditdata,aes(x=Credit.history,fill=Good.Loan))+
                       geom_bar(position='fill')+coord_flip()

dev.off()

model <- rpart(Good.Loan ~
   Duration.in.month +
   Installment.rate.in.percentage.of.disposable.income +
   Credit.amount  +
   Other.installment.plans,
   data=d,
   control=rpart.control(maxdepth=4),
   method="class")

