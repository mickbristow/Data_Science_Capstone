## Coursera: Data Science
## Capstone: Final Project
## Author: Michael Bristow
## Date: 01/01/2018

library(shiny)

source("./helpfunctions.R")

#normalise data request
cleanRequest <- function(request){
  request <- removePunctuation(request)
  request <- tolower(request)
  request <- removeNumbers(request)
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  vals <- reactiveValues()
  observe({
  
    req <- input$inputText
    
    cleanreq <- cleanRequest(req)
    
    output$txt_in <- renderText({cleanreq})
    
    nextWord <- predictWord(cleanreq)
    if (!length(nextWord[[1]])){
      nextWord <- "Error - No predicator found"
    }
    
    output$txt_pred <- renderText({nextWord})
  })
  
  
})
