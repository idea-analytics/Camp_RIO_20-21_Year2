
cache("act",{
act <- get_table(.table_name = "ACT", .database_name = "Dashboard", .schema = "dbo") %>%
  collect()
})

