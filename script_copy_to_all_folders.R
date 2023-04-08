

# Set the working directory
setwd("D:/Dextop/E1/OR/Predict")

# Get a list of all subdirectories in the working directory
subdirs <- list.dirs()

# Specify the name of the script file to copy
script_file <- "3rd_prediction.R"

# Loop over the subdirectories and copy the script file to each one
for (dir in subdirs) {
  file_path <- file.path(dir, script_file)
  file.copy(script_file, file_path)
}
