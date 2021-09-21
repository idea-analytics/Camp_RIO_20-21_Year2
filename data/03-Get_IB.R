
#CSGF IB Data - pull from server

cache("ib",{
  ib_code <- get_table(.table_name = "IBScores", .database_name = "PROD2", .schema = "Assessments")%>%
    collect()
 
 
})


#clean names
ib <- ib_code %>%
  clean_names()


#get cols: StudentNumber, AcademicYear, CourseName, Grade. 
ib2 <- ib %>%
  select(student_number, academic_year, course_name, grade)
ib2



#filter for the correct 4 academic years (17/18 - 20-21), by removing all dates prior to 2017-2018 (starting with the first year in this table, which is 2010-2011)
ib3 <- ib2 %>%
  filter(academic_year != "2010-2011") %>%
  filter(academic_year != "2011-2012") %>%
  filter(academic_year != "2012-2013") %>%
  filter(academic_year != "2013-2014") %>%
  filter(academic_year != "2014-2015") %>%
  filter(academic_year != "2015-2016") %>%
  filter(academic_year != "2016-2017") 

#final table is "ib3"
ib3 #7838 rows (exams taken over 4 years)


#write to csv, then copy and paste into CSGF spreadsheet "IB" tab, for Tarah Burris wrike request
write.csv(ib3, "C:\\Users\\maura.carter\\Documents\\Hiring\\data\\csgf_ib_2017_2021.csv", row.names = FALSE)