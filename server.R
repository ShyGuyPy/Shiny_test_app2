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
                
                # limit <- length(my_data[[1]])
                # random <- sample(1:limit,1)
                
                #takes slider input and outputs percent value for that index
                data_percent <- eventReactive(input$data_index, {
                #current_index <- input$data_index,
                my_data$p_percent_normal[input$data_index]
                #data_date <- my_data$date[input$data_index]
                })
                
                #data_percent <- reactive({my_data$p_percent_normal[input$data_index]})
                #data_date <- reactive({my_data$date[input$data_index]})
                
                precip_value <- eventReactive(data_index,{
                case_when(
                  data_percent() <= .0 ~ "background-color:purple", #"#000000",
                  data_percent() > .0 && data_percent() <= .20 ~ navy,#"background-color:red", #"#cc3300",
                  data_percent() > .20 && data_percent() <= .40 ~ orange,#"background-color:orange",  #"#ff9966",
                  data_percent() > .40 && data_percent() <= .60 ~ yellow,#"background-color:yellow",  #"#ffcc00",
                  data_percent() > .60 && data_percent() <= .80 ~ green,#"background-color:green", #"#99cc33",
                  data_percent() > .80 && data_percent() < 1 ~  navy #"background-color:navy" #"#339900"
                )
                })
          
              
                output$boxes  <- renderUI({
                  div(class="topbox_main",
                      div(class="topbox1",
                          div(class="square", style=precip_value(),#"background-color:yellow"
                              div(class="content",
                                  div(class="table",
                                      div(class="table-cell",
                                          p("precipitation deficit")
                                      )))), 
                          div(class="square", style="background-color:red",
                              div(class="content",
                                  div(class="table",
                                      div(class="table-cell",
                                          p("ground water wells")
                                      )))),
                          div(class="square", style="background-color:green",
                              div(class="content",
                                  div(class="table",
                                      div(class="table-cell",
                                          p("reservoir flow")
                                      )))),
                          div(class="square", style="background-color:orange",
                              div(class="content",
                                  div(class="table",
                                      div(class="table-cell",
                                          p("streamflow")
                                      ))))
                      ), #end of topbox1
                      div(class="topbox2", 
                          div(class="square", style="background-color:yellow",
                              div(class="content",
                                  div(class="table",
                                      div(class="table-cell",
                                          p("precipitation deficit")
                                      )))),
                          div(class="square", style="background-color:orange",
                              div(class="content",
                                  div(class="table",
                                      div(class="table-cell",
                                          p("ground water wells")
                                      )))),
                          div(class="square", style="background-color:red",
                              div(class="content",
                                  div(class="table",
                                      div(class="table-cell",
                                          p("reservoir flow")
                                      )))),
                          div(class="square", style="background-color:green",
                              div(class="content",
                                  div(class="table",
                                      div(class="table-cell",
                                          p("streamflow")
                                      ))))
                      ) #end of topbox2
                  ) #end of topbox-main
                })
})
