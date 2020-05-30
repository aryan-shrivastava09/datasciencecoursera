CompleteData<- function (directory, Column) 
{ 
  filename<- list.files(directory)
  filepath <- paste(directory, "/", filename, sep="")
  x <- read.csv(filepath, header=TRUE)
  y<- x[complete.cases(x),]
  print(y)
  data.frame(1:nrow(y),y[,Column])
}