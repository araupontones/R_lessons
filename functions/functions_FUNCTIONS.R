#Functions of the FUNCTIONS lesson

#load packages and paths
source("functions/set_up_FUNCTIONS.R")




####FUNCTIONS FOR ANDRES' PART ------------------------------------------------------------------------------------

## FUNCTION TO CONVERT CHARACTER VECTOR TO ASCII
## Function to convert names into acsii
#name: is the character vector to be transform
to_ascii = function(name, ...){
  
  sapply(asc(name, simplify = T), function(x)paste(unlist(x), collapse = ''))
  
}


asc
strtoi("A",16L)
## FUNCTION TO SPLIT NUMBERS INTO NEW COLUMS
#name: character vector to be transformed to ascii
#prefix: prefix of the new variable to be created
#data base to which the new variables will be bind

split_numbers = function(name,prefix,db, ...) {
  
  number = to_ascii(name)
  
  # get longest name
  longest_name =  max(nchar(number))
  
  ##Where should we do the cuts?
  cut_every = seq(1, longest_name, 8)
  
  ##Number of variables to create
  num_vars = length(cut_every)
  
  
  # Crear nombre de variables
  var_names = paste0(prefix, c(1:num_vars))
  
  
  # Crear variables
  nameNumeric_split = map(cut_every, function(x){
    
    #Split the number in separate variables
    t = substr(number, x, x+7)
    
  })
  
  table_nameNumeric = as.tibble(do.call(cbind,nameNumeric_split))
  names(table_nameNumeric) <- var_names
  
  final_vector = cbind(db, table_nameNumeric)
  
  
}
