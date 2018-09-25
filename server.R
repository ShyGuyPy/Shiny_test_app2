shinyServer(function(input, output, session){
#eventReactive(input$date,
              output$date_text  <- renderText({
                paste("Today's date is", as.character(input$date))
              })
#   output$date_text <- renderText(as.character(input$date)))
              
                path <- "C:\\Users\\icprbadmin\\Documents\\R\\2018drex\\input\\ts\\state\\i_a1b\\va_shenandoah_p.csv"
                
                if( .Platform$OS.type == "unix" )
                  path <- "/Users/lukevawter/Desktop/R/2018drex/input/ts/state/i_a1b/va_shenandoah_p.csv"
                
                my_data = read.csv(path)
                
                limit <- length(my_data[[1]])
                random <- sample(1:limit,1)
                
                # current_index <- reactive({
                #   input$data_index
                
                
                data_percent <- reactive({my_data$p_percent_normal[current_index]})
                data_date <- reactive({my_data$date[current_index]})
                
                #data_percent <- reactive({my_data$p_percent_normal[input$data_index]})
                #data_date <- reactive({my_data$date[input$data_index]})
                
                
                precip_value <- reactive({case_when(
                  data_percent <= .0 ~ "purple", #"#000000",
                  data_percent > .0 && data_percent <= .20 ~ "background-color:red", #"#cc3300",
                  data_percent > .20 && data_percent <= .40 ~ "background-color:orange",  #"#ff9966",
                  data_percent > .40 && data_percent <= .60 ~ "background-color:yellow",  #"#ffcc00",
                  data_percent > .60 && data_percent <= .80 ~ "background-color:green", #"#99cc33",
                  data_percent > .80 && data_percent < 1 ~  "background-color:navy" #"#339900"
                )
          
              })
})
