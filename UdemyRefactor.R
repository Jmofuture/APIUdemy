#install.packages(c("httr", "jsonlite"))

library(httr)
library(jsonlite)
library(readr)
library(tidyverse)

url_base <- "https://www.udemy.com"

# Headers del Json

headers = c(
  'Accept' = 'application/json, text/plain, */*',
  'Content-Type' = 'application/json;charset=utf-8',
  'Authorization' = "Tu código de Autorización en base64"
)

date <- Sys.Date()

# URLs Tecnologias

# Asigno Titulos

url_title <- c("Excel","Power Bi","Tableau","SQL","R","Python","Data Science/Analyst")

# Valor de los Titulos

url_list <- c(
  "https://www.udemy.com/api-2.0/courses/?page=1&page_size=100&search=Excel&price=price-free&is_affiliate_agreed=True&language=es&ordering=relevance",
  "https://www.udemy.com/api-2.0/courses/?page=1&page_size=100&search=power%20bi&price=price-free&is_affiliate_agreed=True&language=es&ordering=relevance",
  "https://www.udemy.com/api-2.0/courses/?page=1&page_size=100&search=tableau&price=price-free&is_affiliate_agreed=True&language=es&ordering=relevance",
  "https://www.udemy.com/api-2.0/courses/?page=1&page_size=100&search=sql&price=price-free&is_affiliate_agreed=True&language=es&ordering=relevance",
  "https://www.udemy.com/api-2.0/courses/?page=1&page_size=100&search=Rstudio&price=price-free&is_affiliate_agreed=True&language=es&ordering=relevance",
  "https://www.udemy.com/api-2.0/courses/?page=1&page_size=100&search=Python&price=price-free&is_affiliate_agreed=True&language=es&ordering=relevance",
  "https://www.udemy.com/api-2.0/courses/?page=1&page_size=100&search=Data%20Analyst&price=price-free&is_affiliate_agreed=True&language=es&ordering=relevance"
)

# Generamos Esto solo asigna una etiqueta a los valores

url_table <- `names<-`(url_list,url_title)

url.table <- c(url_title, url_list)

#Variables acumuladoras

response <- c()
parce <- c()
titles <- c()
courses <- c()

# Lo que quiero generar es un ciclo que obtenga la respuesta JSON

json.response <- for (url in url_table) {
  res <- VERB("GET", url, add_headers(headers))  # Respuestas de Json
  response <- append(response, res)
  
  txt <- fromJSON(content(res, 'text')) # Parcear a Texto
  parce <- append(parce, txt)
  
  title <- txt[["results"]][["title"]]  # Obtenemos titulos
  titles <- append(titles,title)
  
  course <- txt[["results"]][["url"]]
  courses <- append(courses,paste(url_base,course)) # Obtenemos URL y agregamos la Base
}


df <- data.frame(date,titles,courses) %>% 
  write_excel_csv(file = "C:RUTA//Cursos.csv") # Transformamos en Tabla



