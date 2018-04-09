# Exercise 3: working with built-in data sets

# Load R's "USPersonalExpenditure" dataset using the `data()` function
# This will produce a data frame called `USPersonalExpenditure`
data("USPersonalExpenditure")
USPersonalExpenditure

# The variable `USPersonalExpenditure` is now accessible to you. Unfortunately,
# it's not a data frame (it's actually what is called a matrix)
# Test this using the `is.data.frame()` function
is.data.frame(USPersonalExpenditure)

# Luckily, you can pass the USPersonalExpenditure variable as an argument to the
# `data.frame()` function to convert it a data farm. Do this, storing the
# result in a new variable
personal_expenditure <- data.frame(USPersonalExpenditure)
View(personal_expenditure)

# What are the column names of your dataframe?
colnames(personal_expenditure)

## Consider: why are they so strange? Think about whether you could use a number 
## like 1940 with dollar notation!

# What are the row names of your dataframe?
rownames(personal_expenditure)

# Add a column "category" to your data frame that contains the rownames
categories <- rownames(personal_expenditure)
personal_expenditure$Category <- categories

# How much money was spent on personal care in 1940?
personal_expenditure$X1940[4]
personal_expenditure['Personal Care', 'X1940']
# How much money was spent on Food and Tobacco in 1960?
personal_expenditure$X1960[1]

# What was the highest expenditure category in 1960?
max(personal_expenditure$X1960)

personal_expenditure$Category[personal_expenditure$X1960 == max(personal_expenditure$X1960)]
# Define a function `lowest_category` that takes in a year as a parameter, and
# returns the lowest spending category of that year
lowest_category <- function(year) {
  col <- paste0('X', year)
  personal_expenditure$Category[personal_expenditure[, col] == min(personal_expenditure[, col])]
}

# Using your function, determine the lowest spending category of each year
# Hint: use the `sapply()` function to apply your function to a vector of years
?sapply
sapply(seq(1940, 1960, 5), lowest_category)
