
cache("gpa",{
gpa <- get_table(.table_name = "StudentAcademicSummary", .database_name = "PROD1", .schema = "Schools") %>%
  filter(AcademicYear == '2020-2021' | AcademicYear == '2019-2020' ) %>%
  collect()
})

cache("gpa_2020_2021",{
  gpa_2020_2021 <- get_table(.table_name = "StudentAcademicSummary", .database_name = "PROD1", .schema = "Schools") %>%
    filter(AcademicYear == '2020-2021') %>%
    collect()
})