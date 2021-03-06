#The credit card data need to be imported before running the program.
#calling the kernlab library for the KSVM
library(kernlab)
#data1<-read.csv('credit_card_data.txt',header = FALSE)


#Building the model based on Featured_Values and the Prediction_Values
#model <- ksvm(as.matrix(data[,1:10]), as.factor(data[,11]), type="C-svc", kernel="vanilladot", C=100, scaled=TRUE)
model<- ksvm(as.matrix(data[,1:10]),as.factor(data[,11]),type="C-svc",kernel="vanilladot",C=100,scaled=TRUE)

#The following section calculates the a1....am coefficient to create the equation for predicting the target which in this 
#case is the credit approval.
# a1x1 + a2x2 + ......+ a10x10 + a0 = 0
#The question did not ask for the coefficient values

a<-colSums(model@xmatrix[[1]]*model@coef[[1]])
a0<-model@b

#After calculating the coefficients it is a time for the prediction and comparing the prediction results with the actual 
#Values

Prediction_Final<- predict(model,data[,1:10])
Accuracy_Check<-sum(Prediction_Final==data[,11])/nrow(data)
print(Accuracy_Check)



