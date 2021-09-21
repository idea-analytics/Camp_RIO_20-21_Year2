#install necessary packages, run respective libraries

#install.packages("R.cache")
library(R.cache)

library(dplyr)

#install.packages("bigrquery")
library(bigrquery)

#install.packages("SOAR")
library(SOAR)

#pull Attendance data from server. Filter for 3 years.
cache("attendance",{
  attendance <- get_table(.table_name = "Students", .database_name = "PROD1", .schema = "Attendance")%>%
    filter(SchoolYear == "2020-2021"|SchoolYear == "2019-2020" | SchoolYear == "2018-2019")%>%
    collect()


})
  