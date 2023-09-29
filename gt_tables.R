# Resources
# https://jthomasmock.github.io/gtExtras/reference/gt_plt_bar_pct.html
# https://jthomasmock.github.io/gtExtras/articles/plotting-with-gtExtras.html

# Load libraries
library(tidyverse)
library(gt)
library(gtExtras)
library(formattable)

# Load data
data <- read.csv('gt_tables.csv')

data %>% gt() %>% 
  gt_theme_espn() %>% 
  tab_header(md(glue::glue("Questionnaire scores {fontawesome::fa('brain')}"))) %>% 
  tab_options(column_labels.background.color = "grey90") %>% 
  #data_color(columns = c("Pre.CASC", "Post.CASC"), method = "numeric", palette = "Set2") %>% 
  gt_plt_bullet(column = "Post.CASC",
                target = 2, width = 45,
                palette = c("lightblue", "red"))

data %>% select(Post.CASC) %>% 
  gt() %>% 
  gt_plt_bullet(column = "Post.CASC",
                target = mean(data$Pre.HDRS), width = 45,
                palette = c("lightblue", "red"))

  

gt_plt_summary(data) 
