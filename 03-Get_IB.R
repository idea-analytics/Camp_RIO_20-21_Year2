cache("ap",{
  ap_code <- get_table(.table_name = "APCode", .database_name = "Dashboard", .schema = "dbo")%>%
    filter(ExamName == "Biology" | ExamName ==  "Chemistry" | ExamName == "Physics 1" | ExamName == "Environmental Science") %>%
    collect()
  
  ap_result <- get_table(.table_name = "APResult", .database_name = "Dashboard", .schema = "dbo") %>% 
    filter(BestScore == 1) %>%
    filter(SchoolYear == "2020-2021")%>%
    collect()
  
  ap <- ap_result %>%
    inner_join(ap_code, by = c("ExamCode" = "ExamCode")) %>%
    filter(!is.na(StudentNumberDelta)) %>%
    mutate(Passed = if_else(ExamGrade >= 3,1,0),
           Taken = if_else(is.na(ExamGrade), 0, 1)) %>%
    select(student_id = StudentNumberDelta,
           ExamGrade,
           Passed,
           Taken,
           ExamName) %>%
    pivot_wider(names_from = ExamName, values_from = c(ExamGrade,Passed,Taken), values_fill = NULL)
})



cache("ap_1",{
  ap_code_all_subject <- get_table(.table_name = "APCode", .database_name = "Dashboard", .schema = "dbo")%>%
    collect()
})



cache("ap_2",{
  ap_code_all_subjects <- get_table(.table_name = "APCode", .database_name = "Dashboard", .schema = "dbo")%>%
    collect()
  
  ap_result <- get_table(.table_name = "APResult", .database_name = "Dashboard", .schema = "dbo") %>% 
    filter(BestScore == 1) %>%
    filter(SchoolYear == "2020-2021"|SchoolYear == "2019-2020" | SchoolYear == "2018-2019"| SchoolYear == "2017-2018")%>%
    collect()
  
  
  
  ap <- ap_result %>%
    inner_join(ap_code_all_subjects, by = c("ExamCode" = "ExamCode")) %>%
    filter(!is.na(StudentNumberDelta)) %>%
    mutate(Passed = if_else(ExamGrade >= 3,1,0),
           Taken = if_else(is.na(ExamGrade), 0, 1)) %>%
    select(student_id = StudentNumberDelta,
           SchoolYear,
           ExamName,
           ExamGrade) #%>%
  #pivot_wider(names_from = ExamName, values_from = c(ExamGrade,Passed,Taken), values_fill = NULL)  
  
  
})