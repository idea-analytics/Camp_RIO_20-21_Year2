#all AP Exam Subjects (used for CSGF)

#pull AP data from server
cache("ap_2",{
  ap_code_all_subjects <- get_table(.table_name = "APCode", .database_name = "Dashboard", .schema = "dbo")%>%
    collect()

  
#filter for the 4 academic years we need, starting with 2017-2018, to 2020-2021.
  ap_result <- get_table(.table_name = "APResult", .database_name = "Dashboard", .schema = "dbo") %>% 
    filter(BestScore == 1) %>%
    filter(SchoolYear == "2020-2021"|SchoolYear == "2019-2020" | SchoolYear == "2018-2019"| SchoolYear == "2017-2018")%>%
    collect()
  
  
#select the 4 columns we need: student_id, SchoolYear, ExamName, and ExamGrade.
  ap <- ap_result %>%
    inner_join(ap_code_all_subjects, by = c("ExamCode" = "ExamCode")) %>%
    filter(!is.na(StudentNumberDelta)) %>%
    mutate(Passed = if_else(ExamGrade >= 3,1,0),
           Taken = if_else(is.na(ExamGrade), 0, 1)) %>%
    select(student_id = StudentNumberDelta,
           SchoolYear,
           ExamName,
           ExamGrade)  
  
  
})


#write to csv, then copy and past those two columns into the spreadsheet for CSGF wrike request from Tarah Burris
write.csv(ap_2, "C:\\Users\\maura.carter\\Documents\\Hiring\\data\\csgf_ap_2020_2021.csv", row.names = FALSE)
