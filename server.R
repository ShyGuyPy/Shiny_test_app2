shinyServer(function(input, output, session){
#eventReactive(input$date,
              output$date_text  <- renderText({
                paste("today's date is", as.character(input$date))
              })
#   output$date_text <- renderText(as.character(input$date)))
})

