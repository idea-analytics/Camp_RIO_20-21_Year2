
#install.packages("bigrquery")
library(bigrquery)

cache("students",{
students <- get_table(.table_name = "Students", .database_name = "PROD1", .schema = "Schools") %>%
  filter(AcademicYear == '2020-2021' | AcademicYear == '2019-2020' ) %>%
  select(StudentNumber,
          AcademicYear,
          SchoolTermID,
          StudentStateID,
          FirstName,
          LastName,
          SchoolNumber,
          GradeLevelID,
          Gender,
          Birthdate,
          SPED,
          AtRiskFlag,
          EconomicDisadvantageCode,
          ELLCode,    
          MigrantFlag,
          FederalHispanicFlag,
          FederaRaceI,
          FederaRaceA,
          FederaRaceB,
          FederaRaceP,
          FederaRaceW) %>%
  distinct() %>%
  collect()
})


cache("students_1920",{
  students_1920 <- get_table(.table_name = "Students", .database_name = "PROD1", .schema = "Schools") %>%
    filter(AcademicYear == '2019-2020' ) %>%
    select(StudentNumber,
           AcademicYear,
           SchoolTermID,
           StudentStateID,
           FirstName,
           LastName,
           SchoolNumber,
           GradeLevelID,
           Gender,
           Birthdate,
           SPED,
           AtRiskFlag,
           EconomicDisadvantageCode,
           ELLCode,    
           MigrantFlag,
           FederalHispanicFlag,
           FederaRaceI,
           FederaRaceA,
           FederaRaceB,
           FederaRaceP,
           FederaRaceW) %>%
    distinct() %>%
    collect()
})




cache("students_18_19",{
  students_18_19 <- get_table(.table_name = "Students", .database_name = "PROD1", .schema = "Schools") %>%
    filter(AcademicYear == '2019-2020' | AcademicYear == '2018-2019' ) %>%
    select(StudentNumber,
           AcademicYear,
           SchoolTermID,
           StudentStateID,
           FirstName,
           LastName,
           SchoolNumber,
           GradeLevelID,
           Gender,
           Birthdate,
           SPED,
           AtRiskFlag,
           EconomicDisadvantageCode,
           ELLCode,    
           MigrantFlag,
           FederalHispanicFlag,
           FederaRaceI,
           FederaRaceA,
           FederaRaceB,
           FederaRaceP,
           FederaRaceW) %>%
    distinct() %>%
    collect()
})

