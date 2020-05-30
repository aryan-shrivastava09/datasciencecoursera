best<- function(state, outcome) {
  data<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
  datastate <- subset(data,subset = State == state)
  if(outcome== "heart attack"){
    outcome2 = "Heart.Attack"
  } else if(outcome == "heart failure") {
    outcome2 = "Heart.Failure"
  } else if(outcome == "pneumonia") {
    outcome2 = "Pneumonia"
  }
  outcomecolumn <- paste("Hospital.30.Day.Death..Mortality..Rates.from.",outcome2, sep="")
  minimum <- min(as.numeric(datastate[[outcomecolumn]]), na.rm = TRUE)
  subset2 <- subset(datastate, subset = as.numeric(datastate[[outcomecolumn]]) == minimum)
  hospital <- subset2$Hospital.Name
  hospitalvector <- sort(as.vector(hospital))
  hospitalvector
}