# -----------------------------------------------------------------------------------------------------------------------------


## Baseline Model For predicting the survivors on Titanic RMS

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

Train$pclass = as.factor(Train$pclass)
Test$pclass = as.factor(Test$pclass)

Train$Sex = as.factor(Train$Sex)
Test$Sex = as.factor(Test$Sex)

Train$Embarked = as.factor(Train$Embarked)
Test$Embarked = as.factor(Test$Embarked)

# -----------------------------------------------------------------------------------------------------------------------------

## Since this is a classification problem , we will firstly build the most basic baseline model which assumes the most frequent
## outcome in the training set as the outcome for all of the observations in the testing set .

## Finding the most frequently occuring output

table(Train$Survived)

## Looking at this we see that the most of the people in the training set did not survive. So in our baseline model , we will
## assume that everyone in our test set will also die .

Test$Survived = rep(0,418)
KaggleSubmit1 = data.frame( PassengerId = Test$PassengerId , Survived = Test$Survived )
write.csv( KaggleSubmit1 , file = "BaselineModel.csv", row.names = FALSE)

## Since , this is very rough model , it does not have a very high accuracy .

# -----------------------------------------------------------------------------------------------------------------------------







