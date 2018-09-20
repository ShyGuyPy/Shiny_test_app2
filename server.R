shinyServer(function(input, output, session){
eventReactive(input$date,
  output$date_text <- renderText(as.character(input$date)))
})

