library(tidyverse)
library(janitor) 
library(lubridate)

# 1. READ THE DATA
# Using the read_delim because of the semicolons separating the data 
sleep_data <- read_delim("data/sleepdata.csv", delim = ";", show_col_types = FALSE)

# 2. CLEAN THE DATA
sleep_clean <- sleep_data |> 
  clean_names() |> 
  
  mutate(
    # Fix the Date/Time columns
    start = ymd_hms(start),
    end = ymd_hms(end),
    
    # Fix the Percentages 
    sleep_quality = as.numeric(str_remove(sleep_quality, "%")),
    regularity = as.numeric(str_remove(regularity, "%")),
    
    # Create useful Duration columns in hours 
    total_sleep_hours = time_asleep_seconds / 3600,
    time_in_bed_hours = time_in_bed_seconds / 3600,
    deep_sleep_hours = deep_seconds / 3600,
    
    # Extract the Day of the Week and corrects for when start times are past midnight
    sleep_date = date(start - hours(6)),
    day_of_week = wday(sleep_date, label = TRUE)
  )

# 3. INSPECT THE RESULT
glimpse(sleep_clean)

write.csv(sleep_clean, "data/sleep_clean2.csv")