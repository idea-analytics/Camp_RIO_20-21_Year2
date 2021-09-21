
cache("science_grades",{
  science_grades <- get_table(.table_name = "StudentHistoricalGrades", .database_name = "PROD1", .schema = "Schools")%>%
    filter(CreditType == "SC", AcademicYear == '2019-2020' | AcademicYear == '2020-2021') %>%
    collect()
})


