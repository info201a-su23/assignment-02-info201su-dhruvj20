# rpractice / ps-1
#
# A2: Assignment 2 (A2)
#    INFO-201 (Spring 2023)
#    dhruvj20@uw.edu

# Sources used for most of this assignment: 
# https://github.com/rstudio/cheatsheets/blob/main/strings.pdf
# https://cran.r-project.org/doc/contrib/Short-refcard.pdf
# https://canvas.uw.edu/courses/1643812/files/folder/Lectures_PG?preview=107651199
# https://canvas.uw.edu/courses/1643812/files/folder/Lectures_PG?preview=107685009
# https://canvas.uw.edu/courses/1643812/files/folder/Lectures_PG?preview=107752100
# https://learning.oreilly.com/library/view/programming-skills-for/9780135159071/part03.xhtml
# Chapters 5-8 were used from the textbook^

# Practice set info ---- 
practice.begin("A2", learner="Dhruv Jagannath", email="dhruvj20@uw.edu")

# Your 44 prompts ----

#                                         Note 01.
# Overview ----
# Assignment 2
# In this assignment you will analyze data from:
#    Count Love: Protests for a kinder world
#    https://countlove.org
#
## 1.0 Introduction ----
# Before proceeding, you should explore countlove.org and
# consider these questions:
#
#    1. Goals. What are the goals of Count Love? Who is working on this 
#           project? What does Count Love want to achieve? 
#    2. Human values. What values seem to be informing the design of
#           Count Love? Where do these values come from?
#    3. Data sources. Where does the data come from? Is the data credible?
#           What assumptions do the developers make about the data? What
#           data is missing?
#    3. Direct stakeholders. Who might use the data collected at Count
#           Love? What skills and motivations would be needed? How is this
#           this project funded? Who, if anyone, makes money?
#    4. Indirect stakeholders. Who, if anyone, might be impacted by this
#           data but is unaware of Count Love?
#    5. Benefits and harms. What are the potential benefits and harms of
#           Count Love?
#
### Note: Working Definitions:
#    Human Value.  (noun) "What is important to people in their lives,
#                  with a focus on ethics and morality." Example human
#                  values: privacy, safety, intimacy, interdependence,
#                  calmness, dignity, justice, environmental sustainability,
#                  system performance, system reliability, usability (ease of
#                  use), and many more.
#
#    Direct        (noun) "A person who directly uses a tool or technology,
#    stakeholder.  including data and data visualizations." In human-centered
#                  design and design thinking, direct stakeholders are often
#                  called "users."
#
#    Indirect      (noun) "A person who is impacted by a tool or technology
#    stakeholder.  but who never actually uses it." Example: In a court
#                  of law, a judge might use an AI system that predicts
#                  if a convicted defendant is likely to repeat their
#                  crime in the future. This tool might be used by a judge
#                  to make a sentencing decision. The defendant, however,
#                  would NOT interact with such a system. Here, the defendant
#                  would be an indirect stakeholder, whereas the judge and the
#                  AI system engineers would be direct stakeholders.
#
# These definitions come from the Envisioning Cards (Friedman, Nathan, Kane,
# & Lin (2011) and value sensitive design (vsdesign.org).
#
# Data Feminism. As you consider these five dimensions, draw upon your
# reading from D'lgnazio & Klein (2020), and consider how Count Love
# uses and resists "power" to achieve its goals.
#
## 2.0 About the Data ----
# In this assignment, you will download data formatted in a CSV file
# from Count Love.
#
# CSV stands for "comma-separated value".
#
# A CSV file, as you may know, refers to a text file where each row contains
# values that are separated by commas. The rows in the file are sometimes
# called records or observations. And the values are sometimes called
# attributes or features.
#
# CSV files are a very common format for data exchange. You can, for example,
# create and open CSV files with Microsoft Excel. See section 10.3 (Freedman
# & Ross, 2019).
#
## 3.0 Assignment Prompts ----
# This assignment comprises two kinds of prompts:
#
#    Coding prompts:      Write the necessary code to compute the answer. 
#                         For grading, it is important that you store your
#                         answers in the variable names listed with each 
#                         question in `backtics`. Please make sure to store
#                         the appropriate variable type (e.g., 
#                         a string, a vector, a dataframe, etc.).
#
#    Reflection prompts:  For each prompt marked `REFLECTION`, please write
#                         a response in your `README.md` file.
#
# *Note 1:* Grading guidelines are here: 
#    https://canvas.uw.edu/courses/1616427/pages/info-grading-guidelines-and-rubrics
#
## 4.0 Examples ----
### 4.1 Example: Coding prompt ----
# Use the function sum() to compute the sum of three integers. `sum_numbers`
#    sum_numbers <- sum(10,1,-2.5)
#
# Grading: This answer would receive "incomplete" because -2.5 is NOT an integer,
# although the sum() function is correct, there are three numbers, and the
# variable name is correct.
#
### 4.2 Example: Reflection Prompt ----
# Reflection: Look at the US map at https://countlove.org/. What do you notice
# about the distributions of protests?
#
# Grading:
# incomplete: "Protests are shown with blue dots."
# incomplete: "There are more protests in the Eastern US than anywhere else."
# complete:   "There seem to be more protests in the Eastern
#              US, perhaps because 1) more people live there,
#              2) more people are politically or socially
#              active in the Eastern US, or 3) it has been
#              easier to collect data in cities and towns
#              in the Eastern US than elsewhere."

#                                         Note 02.
## Part 1: Set up ----
# In this section, you will load the necessary packages and data.

#                                         Note 03.
# 1a: Load the `stringr` package, which you will use later.

install.packages("stringr")
library(stringr)

# 1b: Load the data from https://countlove.org/data/data.csv (Variable: `protests`)

protests <- read.csv("/Users/dhruv/Downloads/INFO 201/assignment-02-info201su-dhruvj20/data.csv", 
header = TRUE, sep = ",", stringsAsFactors = TRUE)
View(protests)

#                                         Note 04.
#     *BEST PRACTICE:* Use View() to open and examine the dataset. Some key questions to ask:  
#        1. What information is available? 
#        2. Are there missing values (NA, which means "Not Available.") or odd values? 
#        3. What are the column names (sometimes called variables or features)?

# 1c: Use an R function to determine how many protests are in the dataset? (Variable: `num_protests`)

num_protests <- dim(protests)[1]

# 1d: Use an R function to determine how many how many values (also known as
#    attributes or features) have been recorded for each protest (Variable: `num_features`)

num_features <- dim(protests)[2]

#                                         Note 05.
## Part 2: Attendees ----
# In this part, you will explore the number of people who participated
# in the protests.

# 2a: Extract the `Attendees` column into a variable called `num_attendees`. (Variable: `num_attendees`)

num_attendees <- protests$Attendees

#                                         Note 06.
#     For the following prompts, you will need to consider missing values. In R,
#     missing values are denoted by the symbol NA, which means "Not Available."

# 2b: What is the lowest number of attendees? (Variable: `min_attendees`)

min_attendees <- min(num_attendees, na.rm = TRUE)

# 2c: What is the highest number of attendees? (Variable: `max_attendees`)

max_attendees <- max(num_attendees, na.rm = TRUE)

# 2d: What is the mean number of attendees? (Variable: `mean_attendees`)

mean_attendees <- mean(num_attendees, na.rm = TRUE)

# 2e: What is the median number of attendees? (Variable: `median_attendees`)

median_attendees <- median(num_attendees, na.rm = TRUE)

# 2f: What is the difference between the mean and median number of attendees? (Variable: `mean_median_diff`)

median_mean_diff <- mean_attendees-median_attendees

#                                         Note 07.
#     *Consideration* What does the difference between the mean and the median
#     tell you about the *distribution* of the data? (Note: If you're unfamiliar with
#     working with distributions, ask your TA for clarification.)

# 2g: To further assess the distribution of values, create a boxplot of the
#    number of attendees using the `boxplot()` function. Store the plot in a
#    variable called `attendees_distribution`. (Note: Later in the course, we
#    will use more refined plotting methods.) (Variable: `attendees_distribution`)

attendees_distribution <- boxplot(na.omit(num_attendees), 
ylab = "Number of Attendees", main = "Boxplot Showing Number of Attendees")

# 2h: Create another boxplot of the *log* of the number of attendees.
#    Store the plot in a variable `log_attendees_distribution`. (Note: You will
#    likely see see a warning in the console, which is expected.) (Variable: `log_attendess_distribution`)

log_attendess_distribution <- boxplot(log(na.omit(num_attendees), 10), 
ylab = "Log (Number of Attendees)", main = "Boxplot Showing Log Number of Attendees")

# https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/log

# Used the above source to fix my previous line of code so the boxplot would be correct

#                                         Note 08.
## Part 3: Locations -----
# In this part, you will explore where the protests happened.

# 3a: Extract the `Location` column. (Variable: `locations`)

locations <- protests$Location

# 3b: How many *unique* locations are in the dataset? (Variable: `num_locations`)

num_locations <- length(unique(locations))

# 3c: How many protests occurred in Washington State (WA)? (Hint: Use a function, 
#    called str_detect(), from the stringr package (see https://stringr.tidyverse.org/), 
#    to detect the presence (or absence) of WA".) (Variable: `num_in_wa`)

new_list <- str_detect(locations, ", WA") + str_detect(locations, ", wA") 
num_in_wa <- length(new_list[new_list == TRUE])

# 3d: What proportion of protests occurred in Washington? (Variable: `prop_in_wa`)

prop_in_wa <- paste0(num_in_wa * 100/length(locations), "%") 

#                                         Note 09.
#     *R3a: REFLECTION:* Does the number of protests in Washington surprise you?
#     Why or why not?

# 3e: Write a function `count_in_location()` that accepts one parameter:
#        `location` - which is the possible location of a protest
#        
#    The function should return exactly this sentence:
#       "There were N protests in LOCATION."
#       
#    If the `location` is not in the dataset, the function should return
#        "Location (LOCATION) not found."
#        
#    In these two sentences:
#        N is the number of protests that occurred at that location; and
#        LOCATION is the function's parameter.
#   
#    Notes:
#       1. Pay careful attention to spaces and punctuation in the sentences.
#       2. You should count the number of locations that *match* the `location'
#          parameter. For example, `Seattle` should be a match for "Seattle, WA". (Variable: `count_in_location`)

count_in_location <- function(LOCATION) {
  N <- 0
  is_location_there <- str_detect(locations, LOCATION)
  if(length(is_location_there[is_location_there == TRUE]) == 0){
    output <- paste("Location", LOCATION, "not found.")
  }else{
  N <- length(is_location_there[is_location_there == TRUE])
  output <- paste0("There were ", N, " ", "protests in ", LOCATION, ".")
  }
  return(output)
}

# 3f: Use your function above to compute the number of protests in "Washington, DC". (Variable: `dc_summary`)

dc_summary <- count_in_location("Washington, DC")

# 3g: Use your function above to compute the number of protests in "Minneapolis". (Variable: `minneapolis_summary`)

minneapolis_summary <- count_in_location("Minneapolis")

# 3h: Use your function above to demonstrate that it works correctly for a
#    location that is not in the data set. (Variable: `missing_summary`)

missing_summary <- count_in_location("Ljubljana")

# 3i: Create a new vector `states` that holds the state locations, that is, the
#    last two characters of each value in the `locations` vector. (Hint: You may
#    want to again use a function from the `stringr` package 
#    Check, for example, the `str_sub()` function.) (Variable: `states`)

states <- c(str_sub(locations, nchar(as.character(locations))-1, nchar(as.character(locations))))

# 3j: Create a vector of the unique states in your dataset. (Variable: `uniq_states`)

uniq_states <- c(unique(states))
index <- 1
while(index <= length(uniq_states)){
  if (uniq_states[[index]] == "co" | uniq_states[[index]] == "ce" | 
      uniq_states[[index]] == "te"){
        str_sub(uniq_states[[index]],1,2) <- NA
  }
  index <- index + 1
}
uniq_states <- c(unique(str_to_upper(uniq_states)))
rm(index)

# https://www.faa.gov/air_traffic/publications/atpubs/cnt_html/appendix_a.html
# Used this for output help

# 3k: Create a summary sentence for each state by passing your `uniq_states`
#    variable and `count_in_location` variables to the `sapply()` function.
#    (Hint: Study section 8.3 in the textbook. It is important to understand
#    the `sapply()` and `lapply()` functions.) (Variable: `state_summary`)

state_summary <- c(sapply(uniq_states, count_in_location))

# https://www.geeksforgeeks.org/difference-between-lapply-vs-sapply-in-r/
# Used the above link for sapply vs lapply clarification and syntax

#                                         Note 10.
#     *R3b: REFLECTION:* You have applied your function to an entire vector 
#     *at once* with `sapply()`. Do you think this is *AMAZING*? Why not? Briefly comment.

# 3l: Create a summary table by passing your `states` variable to the
#    `table()` function and by storing the result in the variable `state_table`.
#   
#    *SUGGESTION:* Use the View() function to more easily examine the table. (Variable: `state_table`)

other_index <- 1
while(other_index <= length(states)){
  if(states[[other_index]] == "ce" | states[[other_index]] == "co" | 
  states[[other_index]] == "te"){
    str_sub(states[other_index], 1, 2) <- NA
  }
  other_index = other_index + 1
}
state_table <- table(str_to_upper(states))
rm(other_index)
View(state_table)

# For some reason, need to run code all the way from assigning 
# states variable for the while loop to work after it's already been run once, 
# not an issue for previous while loop

# https://statisticsglobe.com/r-error-in-if-while-condition-missing-value-where-true-false-needed#:~:text=start%20right%20away%3A-,Basic%20Explanation%3A%20Missing%20Value%20Where%20TRUE%2FFALSE%20Needed,is%20(partly)%20not%20existent.&text=In%20the%20previous%20R%20syntax,parentheses%20of%20the%20if%20statement.
# Used this source for a while loop error
#                                         Note 11.
#     *R3c: REFLECTION:* Looking at the `state_table` variable, what data quality
#     issues do you notice? How would you change your analysis? (Note: There is no
#     need to actually change your analysis)?

# 3m: What was the maximum number of protests in a state? (Hint: Use the
#    `state_table` variable.) (Variable: `max_in_state`)

max_in_state <- max(state_table)

#                                         Note 12.
## Part 4: Dates ----
# In this part, you will exploring *when* protests happened.

# 4a: Extract the `Date` column into a variable called `dates` by passing the
#    column to the `as.Date()` function. (Note: The `as.Date()` function will
#    process the values as dates, which are *fortunately* already in an optimal
#    format for parsing.) (Variable: `dates`)

dates <- as.Date(protests$Date)

# 4b: What is the most recent date in the dataset? (Variable: `most_recent`)

most_recent <- sort(dates)[[length(sort(dates))]]

# 4c: What is the earliest date in the dataset? (Variable: `earliest`)

earliest <- sort(dates)[[1]]

# 4d: What is the length of the time span of the dataset? (Hint: R can do math with
#    dates pretty well by default!) (Variable: `time_span`)

time_span <- print(most_recent - earliest)

# 4e: Create a vector of the dates that are in 2020. (Variable: `in_2020`)

true_false_2020dates <- as.character(str_detect(dates, "2020"))
in_2020 <- dates[str_which(true_false_2020dates, "TRUE")]
rm(true_false_2020dates)
  
# 4f: Create a vector of the dates that are in 2019. (Variable: `in_2019`)

true_false_2019dates <- as.character(str_detect(dates, "2019"))
in_2019 <- dates[str_which(true_false_2019dates, "TRUE")]
rm(true_false_2019dates)

# 4g: What is the ratio of the number of protests in 2020 compared to 2019? (Variable: `ratio_2020_2019`)

ratio_2020_2019 <- length(in_2020)/length(in_2019)

#                                         Note 13.
#     *CONSIDER:* Does the change in the number of protests from 2019 to 2020
#     surprise you? Why or why not? (Nothing to write.)

# 4h: Write a function `count_on_date()` that accepts the parameter `date`,
#    and returns the sentence:
#       "There were N protests on DATE." - where
#           N is the number of protests on that date; and
#           DATE is the date provided. (Variable: `count_on_date`)

count_on_date <- function(DATE){
  N <- length(str_which(dates, DATE))
  how_many_protests <- (paste0("There were ", N, " protests on ", DATE, "."))
  return(how_many_protests)
}

# 4i: Using your function you just wrote, how many protests were there on
#    May 24th, 2020? (Variable: `num_on_may_24`)

num_on_may_24 <- count_on_date("2020-05-24")

# 4j: Using your function you just wrote, how many protests were there on
#    May 31th, 2020? (Variable: `num_on_may_31`)

num_on_may_31 <- count_on_date("2020-05-31")

# 4k: How many protests occurred each month in 2020? (Hint: Use the `months()`
#    function, your `in_2020` dates, and the `table()` function. If you like, you
#    can do this in multiple steps.) (Variable: `by_month_table`)

protests_per_month_2020 <- months(in_2020)
by_month_table <- table(protests_per_month_2020)
rm(protests_per_month_2020)

# 4l: As a comparison, let's assess the change between July 2019 and July 2020.
#    What is the *difference* in the number of protests between July 2020 and
#    July 2019? You'll want to do this in multiple steps as you see fit, though
#    your answer should be stored in the variable. (Variable: `change_july_protests`)

num_jul_2020 <- length(str_which(dates, "2020-07"))
num_jul_2019 <- length((str_which(dates, "2019-07")))
change_july_protests <- num_jul_2020 - num_jul_2019
rm(num_jul_2019)
rm(num_jul_2020)

#                                         Note 14.
## Part 5: Protest Purpose ----
# In this section, you will explore *why* the protests happened. That is, 
# our goal is to understand the purposes of the protests.

# 5a: Extract the `Event..legacy..see.tags.` column into a variable called `purpose`.
#    
#    *CONSIDER:* The name of this column, "Event..legacy..see.tags.", is very odd. Why? 
#    What can be learned from this column name? (Variable: `purpose`)

purpose <- protests$Event..legacy..see.tags.

# 5b: How many different purposes are listed in the dataset? (Variable: `num_purposes`)

num_purpose <- unique(purpose)

# 5c: That's quite a few! Why are there so many purposes? Type `print(purpose)` to
#    examine the values in the vector. You will notice a common pattern. Here, for
#    example, are the first six elements: 
#         [1] "Healthcare"
#         [2] "Civil Rights"                           
#         [3] "Environment"     
#         [4] "Other (Martin Luther King Jr.)"         
#         [5] "Healthcare (Pro-Planned Parenthood)" 
#         [6] "Executive"
#    
#    What is the common pattern? In short, the value of each vector element is one of 
#    two possible patterns: 
#       "<CATEGORY>" or                         <-  (1)
#       "<CATEGORY> (<additional_detail>)"      <-  (2)
#    
#    To regularize the data into a high-level purpose, we need to transform each 
#    vector element, as follows: 
#         [1] "Healthcare"
#         [2] "Civil Rights"                           
#         [3] "Environment"     
#         [4] "Other"         
#         [5] "Healthcare" 
#         [6] "Executive"
#   
#    This will give us a high-level understanding of the purpose of the protest. 
#    
#    This is a string processing problem. Generally, these kind of problems are
#    solved with "regular expressions". Like much of computer science, regular 
#    expressions are tricky at first; but, once you understand them, they 
#    allow you to do amazing things.
#    
#    Hint: Use the str_replace() function from the stringr library
#    (https://stringr.tidyverse.org/). To do so, you will need to write a regular
#    expression that matches " (blah blah)" and replaces it with the empty string (`""`). 
#    Note: The space before the left parenthesis needs to be matched too.
#   
#    Write a function, `get_purposes()`, that returns a vector of high-level 
#    purposes. Your function will take no parameters. 
#    
#    To solve this problem, you might do a web search and/or find an introduction
#    to regular expressions and R. Take your time. You will likely need to do some
#    thoughtful trial and error. (Variable: `get_purposes`)

get_purposes <- function(){
  new_num_purpose <- str_split_fixed(num_purpose, " \\(.*\\)", n = 2)[, 1]
  return(new_num_purpose)
}

# https://stackoverflow.com/questions/24173194/remove-parentheses-and-text-within-from-strings-in-r
# https://cran.r-project.org/web/packages/stringr/vignettes/regular-expressions.html
# https://www.geeksforgeeks.org/string-manipulation-in-r/#
# I started looking at regular expressions with the 2nd source 
# and then used it to understand how the parentheses and everything inside was removed
# via the solution provided for a way to solve the issue in the first source
# I thought about string split and string replace but the issue I was running into 
# was that I didn't know how to handle the parentheses and everything inside, so
# I looked up a resource for some help

# 5d: Show that your function, `get_purposes()` works. (Variable: `high_level_purpose`)

high_level_purpose <- get_purposes()

# 5e: How many "high level" purposes have you identified? (Variable: `num_high_level`)

num_high_level <- unique(high_level_purpose)

# 5f: Use the table() function to count the number of protests for each high level purpose. (Variable: `high_level_table`)

high_level_table <- table(high_level_purpose)
View(high_level_table)

#                                         Note 15.
#     *CONSIDER:* Use View() to examine your `high_level_table` variable. What
#     picture does this paint of the U.S.?

#                                         Note 16.
## Part 6: Developing data systems ----
#
# "Count Love" and similar systems are developed by writing functions that each
# do one thing. The function, `get_purposes()`, which you wrote earlier, is an
# example. 
#
# To work on this part of the assignment, you should carefully examine the 
# column `Tags` in the `protests` dataframe.  Also, you will find this blog post 
# useful: https://countlove.org/blog/new-protest-topics.html 
#
# Below, you will see the implementation of two functions, 
# which you should study:
#    format_doc() 
#    write_report()
# 
# In this part of A2, you will write two new functions: 
#   
# FUNCTION 1: filter_positions()
# filter_positions() takes two arguments: 
#     purpose             A string for the purpose of the protest (e.g., "Environment")
#     position_taken      A string for the position taken (e.g., "Against noise")
#                         The default value should be NULL 
#                            
# filter_positions() should return a dataframe of the protests that match on `purpose` 
# and `position_taken`. If `position_taken` is NULL then all protests that 
# match the `purpose` should be returned.
# 
# FUNCTION #2: filter_and_report() 
# filter_and_report() takes two arguments: 
#     purpose             A string for the purpose of the protest (e.g., "Environment")
#     position_taken      A string for the position taken (e.g., "Against noise")
#                         The default value should be NULL 
#                           
# This function should do two things:(1) It should call `filter_positions()`,
# to create a sub-set of protests, stored in a dataframe; and (2) It should 
# call `format_doc()`, to create the report.
# 
# CODING PROMPT 
# (1) Write the two functions (1 and 2), just described 
# (2) Write code to test the functions and show that they work
# (3) Document your code.

#                                         Note 17.
## Reporting ---- 
# This function produces a markdown report that summarizes a subset 
# of the protests. 
# 
#    protest_df       A dataframe of the subset of protests to be summarized 
#    category         A string for the protest category name (e.g., "Civil Rights")
#    position_taken   A string of the position taken (e.g., "For women's rights").
#                     If NULL, then the data has NOT been filtered by a position_taken 
#
# The output takes this form: 
#     # Category:  Environment 
#     ## Position taken:  For renewable energy 
#     _Summary_
#
#     * Number of Protests: 19
#     * Total Attendees: 686
#
#     _List of Protests (Attendees)_
#
#     * 2017-04-01: Indianapolis, IN [Article](http://www.tribstar.com/news/solar-proponents-rally-against-bill/article_7c7a7af8-b024-5ad8-a2de-75154083601c.html) (_160_)
#     * 2017-04-24: Cambridge, MA [Article](http://www.cambridgeday.com/2017/04/25/climate-rally-calls-for-all-renewable-energy-steps-against-anti-science-of-white-house/) (_NA_)
#     ... 
#
# To view the report: 
#    1. Call the function `write_report()` NOTE: Check the directory path
#    2. Open the file in markdown viewer

format_doc <- function(protest_df, purpose, position_taken=NULL) {
  # Heading components
  heading1 <- paste("# Protest purpose: ", purpose, "\n")
  heading2 <- "\n"
  if (!is.null(position_taken)) {
    heading2 <- paste("## Position taken: ", position_taken, "\n")
  }
  
  # Summary component
  num_protests <- format(nrow(protest_df), big.mark=",")
  total_attendees <- format(sum(protest_df$Attendees, na.rm=TRUE), big.mark=",")
  
  summary <- paste0("_Summary_\n\n", 
                    "* Number of Protests: ", num_protests, "\n", 
                    "* Total Attendees: ", total_attendees, "\n\n",
                    "_List of Protests (Attendees)_\n\n")
  
  # List of protests component (Note: Bullet_list is a vector)
  bullet_list <- paste0("* ", protest_df$Date, ": ", protest_df$Location,
                        " [Article](", protest_df$Source, ")", " (_", protest_df$Attendees, "_)\n")
  
  # Collapse the vector into a string
  url_str <- paste0(bullet_list, collapse="")
  
  # Paste together each of the report components
  md_doc <- paste0(heading1, heading2, summary, url_str)
  
  return(md_doc)
}

# A helper function to write the report to a file
# NOTE: Check and update the filename for your machine
write_report <- function(md_doc, fname="~/Documents/info201/reports/report.md") {
  output_fn <- file(fname, "w")
  writeLines(md_doc, output_fn)
  close(output_fn)
}

# 6a: Write the filter_positions() function, as described above. Please comment 
#    your function. (Variable: `filter_protests`)

filter_protests

# 6b: Write the filter_and_report() function, as described above. Please comment 
#    your function. (Variable: `filter_and_report`)

#                                         Note 18.
# 6c: Demonstrate that your two functions, filter_protests() and 
#    and filter_and_report(), work correctly. Comment on your tests. 
#    For example, do your functions have limitations? Or, do they 
#    work perfectly? If so, how do you know> Do think these two 
#    functions are useful? What might you do next if you had more time?