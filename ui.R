#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
# #
# install.packages('ggplot2')
# install.packages('shinydashboard')
library(shiny)
library(shinydashboard)
library(ggplot2)
# Define UI for application that draws a histogram
ui <- dashboardPage(
  dashboardHeader(title = "R Project"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("NEWS CHANNELS", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Top headlines in States", tabName = "state", icon = icon("crosshairs")),
      menuItem("Catagories", tabName = "cat", icon = icon("copyright")),
      menuItem("Search(Top headlines)", tabName = "widgets", icon = icon("search")),
      menuItem("Articles(Search)", tabName = "art", icon = icon("book"))
      
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              textOutput("newschannels"),
              fluidPage(
                fluidRow(
                  column(12,
                         dataTableOutput('table')
                  )
                )
              )
      ),
      
      # Second tab content
      tabItem(tabName = "widgets",
              h2("Top headlines about:"),
              textInput("headsearch", "Search:","trump")
              
              ,fluidRow(
                h2("Top headlines:"),
                box(
                  title = "Total NEWS", status = "danger", solidHeader = TRUE,
                  collapsible = TRUE,textOutput("totalnewssearch")
                )
                
              ),
              fluidRow(
                h2("SUMMARY:"),
                box(
                  title = "GenericSummary()", status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,textOutput("resultsearch")
                ),
                box(
                  title = "LexRanker()", status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,textOutput("lexranksearch")
                )
                
              ),
              h2("NEWS SOURCES:"),
              fluidPage(
                fluidRow(
                  column(12,
                         dataTableOutput('tablesearch')
                  )
                )
              )
      ),
      # 3rd tab content
      tabItem(tabName = "state",
              h2("Top headlines Summary"),
              selectInput("topheadlines", "Choose a state:",
                          c("India" = "in",
                            "Argentina" = "ar",
                            "Australia" = "au",
                            "Austria" = "at",
                            "Belgium" = "be",
                            "Brazil" = "br",
                            "Bulgaria" = "bg",
                            "Canada" = "cn",
                            "Colombia" = "co",
                            "Cuba" = "cu",
                            "Czech" = "cz",
                            "Egypt" = "eg",
                            "France" = "fr",
                            "Germany" = "de",
                            "Greece" = "gr",
                            "Hong Kong" = "hk",
                            "Hungary" = "hu",
                            "Indonesia" = "id",
                            "Ireland" = "ie",
                            "Israel" = "il",
                            "Italy" = "it",
                            "Japan " = "jp",
                            "Latvia" = "lv",
                            "Lithuania" = "lt"
                          )
              ),
              box(
                title = "Total NEWS", status = "danger", solidHeader = TRUE,
                collapsible = TRUE,textOutput("totalnews")
              ),
              
              fluidRow(
                box(
                  title = "GenericSummary()", status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,textOutput("result")
                ),
                box(
                  title = "LexRanker()", status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,textOutput("lexrank")
                )
              ),
              h2("NEWS SOURCES:"),
              fluidPage(
                fluidRow(
                  column(12,
                         dataTableOutput('tablestate')
                  )
                )
              )
      ),
      #4th tab
      tabItem(tabName = "cat",
              h2("Top headlines Summary"),
              selectInput("choosestate", "Choose a state:",
                          c("India" = "in",
                            "Argentina" = "ar",
                            "Australia" = "au",
                            "Austria" = "at",
                            "Belgium" = "be",
                            "Brazil" = "br",
                            "Bulgaria" = "bg",
                            "Canada" = "cn",
                            "Colombia" = "co",
                            "Cuba" = "cu",
                            "Czech" = "cz",
                            "Egypt" = "eg",
                            "France" = "fr",
                            "Germany" = "de",
                            "Greece" = "gr",
                            "Hong Kong" = "hk",
                            "Hungary" = "hu",
                            "Indonesia" = "id",
                            "Ireland" = "ie",
                            "Israel" = "il",
                            "Italy" = "it",
                            "Japan " = "jp",
                            "Latvia" = "lv",
                            "Lithuania" = "lt"
                          )
              ),selectInput("choosecat", "Choose a Category:",
                            c("sports" = "sports",
                              "business" = "business",
                              "entertainment" = "entertainment",
                              "general" = "general",
                              "health" = "health",
                              "science" = "science",
                              "technology" = "technology")
              )
              ,
              box(
                title = "Total NEWS", status = "danger", solidHeader = TRUE,
                collapsible = TRUE,textOutput("cattotalnews")
              ),
              fluidRow(
                box(
                  title = "GenericSummary()", status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,textOutput("catresult")
                ),
                box(
                  title = "LexRanker()", status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,textOutput("catlexrank")
                )
              ),h2("NEWS SOURCES:"),
              fluidPage(
                fluidRow(
                  column(12,
                         dataTableOutput('tablecat')
                  )
                )
              )
      ),
      # 5th tab content
      tabItem(tabName = "art",
              h2("Top Articles about:"),
              textInput("artcaption", "Search:", "trump"),
              fluidRow(
                box(
                  title = "GenericSummary()", status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,textOutput("resultart")
                ),
                box(
                  title = "LexRanker()", status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,textOutput("lexrankart")
                ),
                box(
                  title = "Total NEWS", status = "danger", solidHeader = TRUE,
                  collapsible = TRUE,textOutput("totalnewsart")
                )
              ) 
              
      )
    )
  )
)

