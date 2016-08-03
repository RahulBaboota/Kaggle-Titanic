# -----------------------------------------------------------------------------------------------------------------------------


## CART Model For predicting the survivors on Titanic RMS

# -----------------------------------------------------------------------------------------------------------------------------

## Reading in the train and test data files

Train = read.csv("train.csv" , stringsAsFactors = FALSE )
Test = read.csv("test.csv" , stringsAsFactors = FALSE )

## By default , R reads in all the strings as factor variables so we set that parameter to false as we will manually set the 
## factors variables .

## Analysing the structure of the Train dataframe

str(Train)
summary(Train)

## Converting the required factor variables into factors

Train$Pclass = as.factor(Train$Pclass)
Test$Pclass = as.factor(Test$Pclass)

Train$Sex = as.factor(Train$Sex)
Test$Sex = as.factor(Test$Sex)

Train$Embarked = as.factor(Train$Embarked)
Test$Embarked = as.factor(Test$Embarked)

## Converting the required strings to strings format

Train$Name = as.character(Train$Name)
Test$Name = as.character(Test$Name)

## Converting the required integers into numerical format

Train$Ticket = as.integer(Train$Ticket)
Test$Ticket = as.integer(Test$Ticket)

# -----------------------------------------------------------------------------------------------------------------------------

## Now , we will use "Decision Trees" to build our model.

library(rpart)
library(rpart.plot)

## In our CART Model , we will use only those features which are not represented of identification information of the passenger 
## like PassengerName , PassengerId etc .

CartModel = rpart( Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked , data = Train , method = "class" )
prp(CartModel)

## Now , we will use this model to make predictions on our Testing data set .

Predictions = predict( CartModel , newdata = Test , type = "class" )
submit = data.frame(PassengerId = Test$PassengerId, Survived = Prediction)
write.csv(submit, file = "CartModel.csv", row.names = FALSE)

## This model has quite improved accuracy .

# -----------------------------------------------------------------------------------------------------------------------------