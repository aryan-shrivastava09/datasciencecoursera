pollutantmean<- function(directory, pollutant, id=1:332) {
  pollutants = c()
  filename= list.files(directory)
  
  for(i in id)
  {
    filepath= paste(directory,"/",filename[i],sep="") ##I can't paste the format of file ".csv" thats not how it works
    x= read.csv(filepath, header = TRUE)
    pollutants= c(pollutants, x[,pollutant])
  }
  pollutants_mean= mean(pollutants, na.rm = TRUE)
  pollutants_mean
}

