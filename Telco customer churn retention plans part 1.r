
library(readr) ##loading the readr library 
#now importing our data set into the system
data1<- read_csv("C:/Users/dragon/Desktop/WA_Fn-UseC_-Telco-Customer-Churn.csv")

dim(data1) ## lets you view the dimension of our data set
## row vs columns, much like pythons 'data1.shape' format

head(data1,n=10) ## checking out the first 10 observations of our data 

library(dplyr) ## a library useful for transforming data frames
##check out the following pdf written 2018, for more about the library
#https://cran.r-project.org/web/packages/dplyr/dplyr.pdf

### Applying a chain method of coding inplace of using (())
## Think of %>% as the word then, check it in action below!
data1=data1 %>%
    select(Churn,everything(),-c(customerID))  ## switch the order and droping ID

data1=data1 %>% 
    mutate_if(is.character,as.factor) ##changing chr types to factor types

head(data1)

summary(data1) # summary() gives us quick single variable information

head(sort(data1$TotalCharges))## sort by default starts from lowest value than biggest
#Although we already knew 18.8 was the lowest written value

head(sort(data1$tenure),n=13)## sort by default starts from lowest value than biggest


data1[rowSums(is.na(data1))>0,]## using boolean logic if any row has an NA 'True/1' then it will print

## df[row,column] style format much like pythons 'df.iloc[row,column] ' kind of



data1$TotalCharges[is.na(data1$TotalCharges)] <-0  ## This is replacing the na's in totalcharges with zeros
## a bit different from python, where you need to save your changes in a new object. 'data1.totalcharges.replace(np.nan,0,inplace=True)'

dim(data1)

library(dplyr)

dim(distinct(data1)) ## removes duplicate rows based on each columns

str(data1) ## shows the deeper information about the data set
## Its much like pythons  'data1.info() ' 

## In R could also use the class function 'class(data1$gender)'
## In python it would be 'type(data1.gender)'
