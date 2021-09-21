
cache("staar",{
staar <- get_table(.table_name = "STAAR", .database_name = "Dashboard", .schema = "dbo") %>%
  filter(SchoolYear == "2020-2021") %>%
  collect()
})
