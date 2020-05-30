rankhospital <- function(state, outcome, rank) {
  data<-read.csv("outcome-of-care-measures.csv")
  datastate <- subset(data,subset = State == state)
  if(outcome== "heart attack"){
    outcome = "Heart.Attack"
  } else if(outcome == "heart failure") {
    outcome = "Heart.Failure"
  } else if(outcome == "pneumonia") {
    outcome = "Pneumonia"
  }
  outcomecolumn <- paste("Hospital.30.Day.Death..Mortality..Rates.from.",outcome, sep="")
  datastate2<- arrange(datastate, datastate$Hospital.Name)
  sorted<- arrange(datastate2,as.numeric(datastate2[[outcomecolumn]]))
  newdata<- data.frame(sorted$Hospital.Name)
  newdata[rank, ]
  }