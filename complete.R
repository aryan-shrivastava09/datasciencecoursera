complete <- function(directory, id=1:332)
{
  filenames<- list.files(directory)
  ids <- c()
  nobss <- c()
  for(i in id)
  {
    filepath<- paste(directory, "/",filenames[i],sep = "")
    x<- read.csv(filepath,header = TRUE)
    completeCases<- x[complete.cases(x),]
    ids <- c(ids, i)
    nobss <- c(nobss, nrow(completeCases))
  }
  
  data.frame(id=ids,nobs=nobss)
}

