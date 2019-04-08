#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
# install.packages("jsonlite")
# install.packages("LSAfun")
# install.packages("lexRankr")
# install.packages("curl")
# Define server logic required to draw a histogram

server <- function(input, output) {
  output$result <- renderText({
    library(jsonlite)
    library(LSAfun)
    library(lexRankr)
    library(curl)
    d<-paste("https://newsapi.org/v2/top-headlines?country=",input$topheadlines,"&apiKey=dcf4e5b9b5544100af25314a49a20e3f")
    d<-gsub(" ", "",d, fixed = TRUE)
    hadley_orgs <- fromJSON(d)
    text <- c(hadley_orgs$articles$description)
    text<-text[text != ""]
    d<-genericSummary(text,k=5)
    paste(d)
  })
  output$tablestate <- renderDataTable({
    library(jsonlite)
    library(LSAfun)
    library(lexRankr)
    library(curl)
    d<-paste("https://newsapi.org/v2/top-headlines?country=",input$topheadlines,"&apiKey=dcf4e5b9b5544100af25314a49a20e3f")
    d<-gsub(" ", "",d, fixed = TRUE)
    hadley_orgs <- fromJSON(d)
    hadley_orgs$articles$source<-NULL
    de<-hadley_orgs$articles
  
  })
  
  output$lexrank <- renderText({
    library(jsonlite)
    library(LSAfun)
    library(lexRankr)
    library(curl)
    d2<-paste("https://newsapi.org/v2/top-headlines?country=",input$topheadlines,"&apiKey=dcf4e5b9b5544100af25314a49a20e3f")
    d2<-gsub(" ", "",d2, fixed = TRUE)
    hadley_orgs <- fromJSON(d2)
    text <- c(hadley_orgs$articles$description)
    text<-text[text != ""]
    d<-lexRank(c(text))
    paste(d[3])
  })
  output$totalnews <- renderText({
    library(jsonlite)
    library(LSAfun)
    library(lexRankr)
    library(curl)
    d3<-paste("https://newsapi.org/v2/top-headlines?country=",input$topheadlines,"&apiKey=dcf4e5b9b5544100af25314a49a20e3f")
    d3<-gsub(" ", "",d3, fixed = TRUE)
    hadley_orgs <- fromJSON(d3)
    text <- c(hadley_orgs$articles$description)
    text<-text[text != ""]
    paste(text)
  })
  ###################################################################
  output$newschannels <- renderText({
    library(jsonlite)
    library(LSAfun)
    library(lexRankr)
    library(curl)
    hadley_orgs <- fromJSON("https://newsapi.org/v2/sources?language=en&apiKey=dcf4e5b9b5544100af25314a49a20e3f")
    text <- c(hadley_orgs$sources)
    text<-text[text != ""]
    paste("ALL NEWS CHANNEL:")
    output$table <- renderDataTable(hadley_orgs$sources)
  })
  ######################## SEARCH TOPHEADLINES #######################################
  output$resultsearch <- renderText({
    library(jsonlite)
    library(LSAfun)
    library(lexRankr)
    library(curl)
    d4<-paste("https://newsapi.org/v2/top-headlines?q=",input$headsearch,"&apiKey=dcf4e5b9b5544100af25314a49a20e3f")
    d4<-gsub(" ", "",d4, fixed = TRUE)
    hadley_orgs <- fromJSON(d4)
    text <- c(hadley_orgs$articles$description)
    text<-text[text != ""]
    d<-genericSummary(text,k=5)
    paste(d)
  })
  output$lexranksearch <- renderText({
    library(jsonlite)
    library(LSAfun)
    library(lexRankr)
    library(curl)
    d5<-paste("https://newsapi.org/v2/top-headlines?q=",input$headsearch,"&apiKey=dcf4e5b9b5544100af25314a49a20e3f")
    d5<-gsub(" ", "",d5, fixed = TRUE)
    hadley_orgs <- fromJSON(d5)
    text <- c(hadley_orgs$articles$description)
    text<-text[text != ""]
    d<-lexRank(c(text))
    paste(d[3])
  })
  output$totalnewssearch <- renderText({
    library(jsonlite)
    library(LSAfun)
    library(lexRankr)
    library(curl)
    d6<-paste("https://newsapi.org/v2/top-headlines?q=",input$headsearch,"&apiKey=dcf4e5b9b5544100af25314a49a20e3f")
    d6<-gsub(" ", "",d6, fixed = TRUE)
    hadley_orgs <- fromJSON(d6)
    text <- c(hadley_orgs$articles$description)
    text<-text[text != ""]
    paste(text)
  })
  output$tablesearch <- renderDataTable({
    library(jsonlite)
    library(LSAfun)
    library(lexRankr)
    library(curl)
    d6<-paste("https://newsapi.org/v2/top-headlines?q=",input$headsearch,"&apiKey=dcf4e5b9b5544100af25314a49a20e3f")
    d6<-gsub(" ", "",d6, fixed = TRUE)
    hadley_orgs <- fromJSON(d6)
    hadley_orgs$articles$source
  })
  ################################ CAT ################
  output$tablecat <- renderDataTable({
    library(jsonlite)
    library(LSAfun)
    library(lexRankr)
    library(curl)
    d7<-paste("https://newsapi.org/v2/top-headlines?country=",input$choosestate,"&category=",input$choosecat,"&apiKey=dcf4e5b9b5544100af25314a49a20e3f")
    d7<-gsub(" ", "",d7, fixed = TRUE)
    hadley_orgs <- fromJSON(d7)
    hadley_orgs$articles$source<-NULL
    de<-hadley_orgs$articles
    
  })
  output$catresult <- renderText({
    library(jsonlite)
    library(LSAfun)
    library(lexRankr)
    library(curl)
    d7<-paste("https://newsapi.org/v2/top-headlines?country=",input$choosestate,"&category=",input$choosecat,"&apiKey=dcf4e5b9b5544100af25314a49a20e3f")
    d7<-gsub(" ", "",d7, fixed = TRUE)
    hadley_orgs <- fromJSON(d7)
    text <- c(hadley_orgs$articles$description)
    text<-text[text != ""]
    d<-genericSummary(text,k=5)
    paste(d)
  })
  output$catlexrank <- renderText({
    library(jsonlite)
    library(LSAfun)
    library(lexRankr)
    library(curl)
    d8<-paste("https://newsapi.org/v2/top-headlines?country=",input$choosestate,"&category=",input$choosecat,"&apiKey=dcf4e5b9b5544100af25314a49a20e3f")
    d8<-gsub(" ", "",d8, fixed = TRUE)
    hadley_orgs <- fromJSON(d8)
    text <- c(hadley_orgs$articles$description)
    text<-text[text != ""]
    d<-lexRank(c(text))
    paste(d[3])
  })
  output$cattotalnews <- renderText({
    library(jsonlite)
    library(LSAfun)
    library(lexRankr)
    library(curl)
    d9<-paste("https://newsapi.org/v2/top-headlines?country=",input$choosestate,"&category=",input$choosecat,"&apiKey=dcf4e5b9b5544100af25314a49a20e3f")
    d9<-gsub(" ", "",d9, fixed = TRUE)
    hadley_orgs <- fromJSON(d9)
    
    text <- c(hadley_orgs$articles$description)
    text<-text[text != ""]
    paste(text)
  })
  ##################### ART ###############################
  output$resultart <- renderText({
    library(jsonlite)
    library(LSAfun)
    library(lexRankr)
    library(curl)
    
    d10<-paste("https://newsapi.org/v2/everything?q=",input$artcaption,"&apiKey=dcf4e5b9b5544100af25314a49a20e3f")
    d10<-gsub(" ", "",d10, fixed = TRUE)
    hadley_orgs <- fromJSON(d10)
    text <- c(hadley_orgs$articles$description)
    text<-text[text != ""]
    d<-genericSummary(text,k=5)
    paste(d)
  })
  output$lexrankart <- renderText({
    library(jsonlite)
    library(LSAfun)
    library(lexRankr)
    library(curl)
    d11<-paste("https://newsapi.org/v2/everything?q=",input$artcaption,"&apiKey=dcf4e5b9b5544100af25314a49a20e3f")
    d11<-gsub(" ", "",d11, fixed = TRUE)
    hadley_orgs <- fromJSON(d11)
    text <- c(hadley_orgs$articles$description)
    text<-text[text != ""]
    d<-lexRank(c(text))
    paste(d[3])
  })
  output$totalnewsart <- renderText({
    library(jsonlite)
    library(LSAfun)
    library(lexRankr)
    library(curl)
    d12<-paste("https://newsapi.org/v2/everything?q=",input$artcaption,"&apiKey=dcf4e5b9b5544100af25314a49a20e3f")
    d12<-gsub(" ", "",d12, fixed = TRUE)
    hadley_orgs <- fromJSON(d12)
    
    text <- c(hadley_orgs$articles$description)
    text<-text[text != ""]
    paste(text)
  })
  ###############################################################3
}

