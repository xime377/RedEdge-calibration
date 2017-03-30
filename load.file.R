load.file <- function(file_path, filename_pattern = "") 
{
  # Argument checking ----
  if(missing(file_path)){
    stop("Filepath missing")
  }
  if(!is.character(file_path)){
    stop("Filename is not character")
  }
  if(!is.character(filename_pattern)){
    stop("Pattern is not character")
  }
  # ----
  my_files <- list.files(path = file_path, pattern = filename_pattern)
  
  # Load files ----
  for(file in my_files)
  {
    RefTar <- which(strsplit(file, "")[[1]] == ".")
    assign(gsub(" ","_",substr(file, 1, RefTar - 1)),
           read.csv(paste(file_path, file, sep="")), envir = .GlobalEnv)
  }
}


