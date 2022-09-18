#install.packages(c("httr", "jsonlite","readr","tidyverse"))

library(httr)
library(jsonlite)
library(readr)
library(tidyverse)

url_base <- "https://www.udemy.com"
date <- Sys.Date()

# URLs Tecnologias

url_excel <- "https://www.udemy.com/api-2.0/courses/?page=1&page_size=100&search=Excel&price=price-free&is_affiliate_agreed=True&language=es&ordering=relevance"
url_powerbi <- "https://www.udemy.com/api-2.0/courses/?page=1&page_size=100&search=power%20bi&price=price-free&is_affiliate_agreed=True&language=es&ordering=relevance"
url_tableau <- "https://www.udemy.com/api-2.0/courses/?page=1&page_size=100&search=tableau&price=price-free&is_affiliate_agreed=True&language=es&ordering=relevance"
url_sql <- "https://www.udemy.com/api-2.0/courses/?page=1&page_size=100&search=sql&price=price-free&is_affiliate_agreed=True&language=es&ordering=relevance"
url_r <- "https://www.udemy.com/api-2.0/courses/?page=1&page_size=100&search=Rstudio&price=price-free&is_affiliate_agreed=True&language=es&ordering=relevance"
url_python <- "https://www.udemy.com/api-2.0/courses/?page=1&page_size=100&search=Python&price=price-free&is_affiliate_agreed=True&language=es&ordering=relevance"
url_an <- "https://www.udemy.com/api-2.0/courses/?page=1&page_size=100&search=Data%20Analyst&price=price-free&is_affiliate_agreed=True&language=es&ordering=relevance"
url_web <- "/api-2.0/courses/?page=1&page_size=100&search=Desarrollo%20web&price=price-free&language=es&ordering=relevance"
# Headers del Json

headers = c(
  'Accept' = 'application/json, text/plain, */*',
  'Content-Type' = 'application/json;charset=utf-8',
  'Authorization' = "Tu código de Autorización en base64"
)

# Respuestas de Json

res_excel <- VERB("GET", url_excel, add_headers(headers))
res_powerbi <- VERB("GET", url_powerbi, add_headers(headers))
res_tableau <- VERB("GET", url_tableau, add_headers(headers))
res_sql <- VERB("GET", url_sql, add_headers(headers))
res_r <- VERB("GET", url_r, add_headers(headers))
res_python <- VERB("GET", url_python, add_headers(headers))
res_an <- VERB("GET", url_an, add_headers(headers))
res_an <- VERB("GET", url_web, add_headers(headers))

# Parcear a Texto

data_excel <- fromJSON(content(res_excel, 'text'))
data_powerbi <- fromJSON(content(res_powerbi, 'text'))
data_tableau <- fromJSON(content(res_tableau, 'text'))
data_sql <- fromJSON(content(res_sql, 'text'))
data_r <- fromJSON(content(res_r, 'text'))
data_python <- fromJSON(content(res_python, 'text'))
data_an <- fromJSON(content(res_an, 'text'))
data_web <- fromJSON(content(res_an, 'text'))

# Obtenemos titulos y URL

title_excel <- data_excel[["results"]][["title"]]
course_url_excel <- data_excel[["results"]][["url"]]

title_powerbi <- data_powerbi[["results"]][["title"]]
course_url_powerbi <- data_powerbi[["results"]][["url"]]

title_tableau <- data_tableau[["results"]][["title"]]
course_url_tableau <- data_tableau[["results"]][["url"]]

title_sql <- data_sql[["results"]][["title"]]
course_url_sql <- data_sql[["results"]][["url"]]

title_r <- data_r[["results"]][["title"]]
course_url_r <- data_r[["results"]][["url"]]

title_python <- data_python[["results"]][["title"]]
course_url_python <- data_python[["results"]][["url"]]

title_an <- data_an[["results"]][["title"]]
course_url_an <- data_an[["results"]][["url"]]

title_web <- data_web[["results"]][["title"]]
course_url_web <- data_web[["results"]][["url"]]

# Unimos la URL Base y la Url del curso

url_cursos_excel <- paste(url_base,course_url_excel, sep = "")
url_cursos_powerbi <- paste(url_base,course_url_powerbi, sep = "")
url_cursos_tableau <- paste(url_base,course_url_tableau, sep = "")
url_cursos_sql <- paste(url_base,course_url_sql, sep = "")
url_cursos_r <- paste(url_base,course_url_r, sep = "")
url_cursos_python <- paste(url_base,course_url_python, sep = "")
url_cursos_an <- paste(url_base,course_url_an, sep = "") 
url_cursos_web <- paste(url_base,course_url_web, sep = "")

# Transformamos en Tabla

df_excel <- data.frame(date,title_excel,url_cursos_excel) %>% 
  write_excel_csv(file = "C:\\RUTA.csv")

df_powerbi <- data.frame(date,title_powerbi,url_cursos_powerbi) %>% 
  write_excel_csv(file = "C:\\RUTA.csv")

df_tableau <- data.frame(date,title_tableau,url_cursos_tableau) %>% 
  write_excel_csv(file = "C:\\RUTA.csv")

df_sql <- data.frame(date,title_sql,url_cursos_sql) %>% 
  write_excel_csv(file = "C:\\RUTA.csv")

df_r <- data.frame(date,title_r,url_cursos_r) %>% 
  write_excel_csv(file = "C:\\RUTA.csv")

df_python <- data.frame(date,title_python,url_cursos_python) %>% 
  write_excel_csv(file = "C:\\RUTA.csv")

df_an <- data.frame(date,title_an,url_cursos_an) %>% 
  write_excel_csv(file = "C:\\RUTA.csv")

df_web <- data.frame(date,title_web,url_cursos_web) %>% 
  write_excel_csv(file = "C:\\RUTA.csv")
