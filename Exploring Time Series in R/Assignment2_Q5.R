print(getwd())
setwd('/Users/yoges/A_Python_code/R Code/Restaurant_chain_data/')
print(getwd())
data <- read.csv("input.csv")
print(data$ingredients)
print(strsplit("Bulgur Wheat, Lamb Mince, Cumin, Coriander, Paprika, Garlic, Olive Oil, Bun, Cucumber, Greek Yogurt, Mint", " , "))

MyColumn <- data$ingredients
#print(MyColumn)
#lst  <- unlist(strsplit(MyColumn,split=","))

#MyColumn <- c("A, B,C", "D,E", "F","G")
print(MyColumn)
FlatColumn <- unlist(strsplit(MyColumn,split=","))
print(FlatColumn)

b <- data.frame(do.call("rbind", strsplit(as.character(data$ingredients), "-", fixed = TRUE))) 
print(FlatColumn)

as.data.frame(table(b))                
aggregate(data.frame(count = b),       list(value = b),         length)

my_dataframe <- as.data.frame.matrix(b)
print(my_dataframe)
