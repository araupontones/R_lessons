#load packages and functions
source("functions/set_up_FUNCTIONS.R")
source("functions/functions_FUNCTIONS.R")

## In this practice we are going to use a function that creates multiple variables(vectors) from one vector


##THE PROBLEM TO SOLVE: In a survey we have been given the names of teachers and students,
## We need to transform these names into ASCII so we can upload this data into a CAPI software
## The capi software has a limitation that each column cannot be longer than 8 digits, so
## we have to split each name into an X number of columns each no longer than 8 digits

##NOTE ASCII stands for American Standard Code for Information Interchange. 
##Computers can only understand numbers, so an ASCII code is the numerical representation 
#of a character such as 'a' or '@' or an action of some sort



## for example
paste(asc("ANDRES ARAU", simplify = T)[,1], collapse = '')

#ANDRES ARAU in ASCII is "6578688269833265826585"


names = c("MARTINA GARCIA", "ANDRES ARAU", "SILVIO RODRIGUEZ")





## HOW WOULD I DO IT WITH OUT A FUNCTION

# I'd create a vector with the names in ascii
Name_numeric = sapply(asc(names, simplify = T), function(x)paste(unlist(x), collapse = ''))

#i'd then split the vector every 8 digits and create a new vector for each cut (so I meet the software limits)

# get longest name
longest_name =  max(nchar(Name_numeric))



##After knowing the longest number, I can calculate how many cuts I need

##Where should we do the cuts?
cut_at = seq(1, longest_name, 8)

##And the number of variables (vectors) I have to create 
num_vars = length(cut_at)


# Then I can even assign a name to each of these variables
var_names = paste0("name_", c(1:num_vars))




# Instead of ussing a loop, I "map" over every element of my vector
nameNumeric_split = map(cut_every, function(x){
  
  #Split the number in separate variables
  t = substr(Name_numeric, x, x+7)
  
})

table_nameNumeric = as.tibble(do.call(cbind,nameNumeric_split))
names(table_nameNumeric) <- var_names

# And finally I bind the new colums to the original vector:

final_vector = cbind(names, table_nameNumeric)


### Imagine that I have to do this over many names in my data.... 
###.. prone to errors, long, tedious, and difficult to make changes...


##USE A FUNCTION!!


data_for_example = import(file.path(dir_data, "students.csv"))

names(data_for_example)
#In this data we have 2 names and 2,600 observations. Let's use our functions

data_with_numbers = data_for_example %>%
  mutate(split_numbers(name = Name_Teacher, prefix = "teacher", db =.))


## coclusion, it would take me a lot of time to repeat myself over over again to do this. Instead, I create a function
##that I can use in a single line




