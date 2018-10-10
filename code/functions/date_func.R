date_func <- function(col_date, col_val, date_today ){
  for(i in col_date){
    if(as.character(i) == date_today){our_value <- (col_val[which(col_date == i)])}
  }
  return(our_value)}




# date_func <- function(date){
# 
#   month=""
#   day="/"
#   day_single= FALSE
#   month_single=FALSE
#   year ="/"
#   
#   #iterates over string date
#   for(i in strsplit(date,"")[[1]]){
#     
#     if (i != "-" && nchar(year) < 5){year<- paste0(year,i)}
#     
#     else if (i == "0" && nchar(month) <1){month_single = TRUE}
#     else if (i != "-" && nchar(month) <1){month <- paste0(month,i)}
#     else if (i != "-" && nchar(month) <2 && month_single == FALSE){month <- paste0(month,i)}
#     
#     else if (i == "0" && nchar(day) <2) {day_single = TRUE}
#     else if (i != "-" && nchar(day) <2) {day <- paste0(day,i)}
#     else if (i != "-" && nchar(day) <3 && day_single == FALSE) {day <- paste0(day,i)}
#     
#   }
#   date <- paste0(month,day, year)
#   return(date)
# }

