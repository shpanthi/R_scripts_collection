df <- read.csv('check.csv', header = T)


# Initialize variables
count <- 0
start_row <- NULL
end_row <- NULL
output <- character()

# Loop through rows in the data frame
for (i in seq_len(nrow(df))) {
  # Check if y value has decreased since the last iteration
  if (!is.null(end_row) && df[i, "y"] < df[end_row, "y"]) {
    count <- count + 1
    if (count == 1) {
      start_row <- i
    }
    # Check if y value has decreased continuously for 5 rows
    if (count >= 5) {
      output <- c(output, paste0(start_row-1))#, "-", i))
      count <- 0
      start_row <- NULL
    }
  } else {
    count <- 0
    start_row <- NULL
  }
  end_row <- i
}

output
rn <- as.numeric(output)
rn



library(ggplot2)

ggplot(df, aes(x,y))+
  geom_bar(stat = 'identity', fill='lightblue', color='black')+
  theme_bw()+
  scale_fill_discrete(name = "Labels") +
  scale_y_continuous(expand = c(0, 2))+
  geom_text(data = subset(df, x %in% sl), aes(label = x),
            position = position_dodge(width = 0.9), vjust = -0.5)


# Load ggplot2 library
library(ggplot2)


sl <- rn

# Create bar plot
ggplot(data = df, aes(x = x, y = y)) +
  geom_bar(stat = "identity") +
  scale_fill_discrete(name = "Labels") +
  geom_text(data = subset(df, x %in% sl), aes(label = x),
            position = position_dodge(width = 0.9), vjust = -0.5)


head(df)



