rankall <- function(outcome,num) {
  
  disease <-c("heart attack","heart failure","pneumonia")
  
  if(!any(outcome==disease)){
    stop("invalid outcome")
  }
  
  if(class(num) == "character"){
    if (! (num == "best" || num == "worst")){
      stop("invalid number")
    }
  }
  
  files<- read.csv("outcome-of-care-measures.csv", colClasses = "character",na.strings = "Not Available")
  
  
  if(outcome==disease[1]){
    files<- files[,c(2,7,11)]
    
  } else if(outcome==disease[2]){
    files<- files[,c(2,7,17)]
    
    
  }else if(outcome==disease[3]){
    files<- files[,c(2,7,23)]
    
  }
  
  states<-na.omit(lapply(split(files,files$State),function(x,num) {
    x[order(as.numeric(x[,c(3)]),x$Hospital.Name),]
    if(num=="best"){
      x$Hospital.Name[1]
    }
    else if(num=="worst"){
      x$Hospital.Name[length[x]] 
    }
    else
      x$Hospital.Name[num]
  },num))
  
  
  
  data.frame(hospital=unlist(states), state=names(states))
}

