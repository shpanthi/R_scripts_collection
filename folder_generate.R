

# Set working directory
setwd("D:/Dextop/E1/3rd_prediction")

# Get list of files
file_list <- list.files(pattern = "*.csv")

# Loop over files and create folders with same name
for (file in file_list) {
  folder_name <- gsub(".csv", "", file)
  dir.create(folder_name)
  file.rename(file, paste0(folder_name, "/", file))
}
