# example 1.1 of section 1.2.3 
# (example 1.1 of section 1.2.3)  : The data science process : Stages of a data science project : Modeling 
# Title: Building a decision tree 

library('rpart')
setwd('D:\\study\\r\\learn_data_science\\Data\\Charpter1')
load('GCDData.RData')

str(creditdata)
head(creditdata)
table(creditdata$Good.Loan)


model <- rpart(Good.Loan ~
   Duration.in.month +
   Installment.rate.in.percentage.of.disposable.income +
   Credit.amount  +
   Other.installment.plans,
   data=d,
   control=rpart.control(maxdepth=4),
   method="class")

