cache("iabwa",{
iabwa <- get_table(.table_name = "IABWA", .database_name = "PROD2", .schema = "Assessments") %>%
  filter(Subject == "Science", AcademicYear == '2019-2020' | AcademicYear == '2020-2021') %>%
  filter((AssessmentName %like% '%_F20_SE%' | 
          AssessmentName %like% '%_F19_SE%' | 
          AssessmentName %like% '%_S20_SE%' | 
          AssessmentName %like% '%_S21_SE%' | 
          AssessmentName %like% '%_F20_SE%' | 
          AssessmentName %like% '%_F19_FINAL%' | 
          AssessmentName %like% '%_S20_FINAL%' | 
          AssessmentName %like% '%_S21_FINAL%')) %>%
  collect()
})