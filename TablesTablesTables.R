# Make neat tables in R

# author @ Rahul Venugopal on September 29th 2023

# Load libraries
library(gt)
library(gtExtras)
library(tidyverse)

# Load penguins data
data <- palmerpenguins::penguins

# Picking 10 entries to demonstrate table features
data <- tail(data,10) %>% select(-species,-species,-island, -year)

# Get an executive summary
gt_plt_summary(data)

# Basic stuff and theming
data %>% gt() %>% 
  # Theming
  gt_theme_espn() %>% 
  # Add header with icon
  tab_header(md(glue::glue("Palmer Penguins {fontawesome::fa('ship')}"))) %>% 
  # Rename columns
  cols_label(
    bill_length_mm = 'Bill length (mm)',
    bill_depth_mm = 'Bill Depth (mm)',
    flipper_length_mm = 'Flipper length (mm)',
    body_mass_g = 'Body mass (g)',
    sex = 'Sex') %>% 
  # Background of header
  tab_options(column_labels.background.color = "grey90") %>%
  # Add a bullet
  gt_plt_bullet(column = "flipper_length_mm",
                width = 45,
                palette = c("lightblue", "red"))