
cache("survey_20_21_AC",{
survey_20_21_AC <- read_excel("C:/Users/maura.carter/ideapublicschools.org/Evaluation of Camp Rio - Documents/Camp RIO Survey - Video - Academy.xlsx")  %>% 
  mutate(StudentID = as.numeric(`Please enter your student number.`))
})

cache("survey_20_21_CP",{
survey_20_21_CP <- read_excel("C:/Users/maura.carter/ideapublicschools.org/Evaluation of Camp Rio - Documents/Camp RIO Survey - Video - College Prep.xlsx") %>%
  mutate(StudentID = as.numeric(`Please enter your student number.`))
})

cache("survey_19_20_AC",{
survey_19_20_AC <- read_excel("C:/Users/maura.carter/ideapublicschools.org/Evaluation of Camp Rio - Documents/Camp RIO Survey - Academy.xlsx")%>%
  mutate(StudentID = as.numeric(`Please enter your student number.`))
})

cache("survey_19_20_CP",{
survey_19_20_CP <- read_excel("C:/Users/maura.carter/ideapublicschools.org/Evaluation of Camp Rio - Documents/Camp RIO Survey - College Prep.xlsx")%>%
  mutate(StudentID = as.numeric(`Please enter your student number.`))
})
