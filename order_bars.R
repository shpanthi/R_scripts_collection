

data <- data.frame(x = 1:5, y = 1:5, group = LETTERS[1:5])
#library(ggplot2)
ggp <- ggplot(data, aes(group, y, fill = group)) +          
  geom_bar(stat = 'identity')
ggp                                                      

data_new <- data                                         
data_new$group <- factor(data_new$group, levels = c("B", "D", "A", "E", "C"))

ggp_new <- ggplot(data_new, aes(group, y, fill = group)) +  
  geom_bar(stat = 'identity')+
  theme_classic()
ggp_new                                                  
