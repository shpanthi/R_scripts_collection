
# Set the working directory to the folder that contains the sub-folders
setwd("D:/Dextop/wd")

# Get a list of all folders within the working directory
folder_list <- list.dirs(recursive = FALSE)

# Loop through each folder in the list and perform the desired tasks
for (folder in folder_list) {
  
  # Set the working directory to the current folder
  setwd(folder)
  
  # Perform the desired tasks
  # Task 1:
  df <- read.csv("df_pls.csv")
  library(ggplot2)
  ggplot(df, aes(observed, predicted, color=samples))+
    geom_point()
  ggsave('op.png', width = 4, height = 3.2, dpi = 300)
  
  # Reset the working directory to the main folder
  setwd("..")
}


# df <- read.csv("df_pls.csv")
# library(ggplot2)
# ggplot(df, aes(observed, predicted, color=samples))+
#   geom_point()
# ggsave('op.png', width = 4, height = 3.2, dpi = 300)
# 

