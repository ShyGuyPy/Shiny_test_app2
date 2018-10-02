shinyServer(function(input, output, session){
#eventReactive(input$date,
              output$date_text  <- renderText({
                paste("Today's date is", as.character(input$date))
              })
#   output$date_text <- renderText(as.character(input$date)))
              
                path_p <- "C:\\Users\\icprbadmin\\Documents\\R\\2018drex\\input\\ts\\state\\i_a1b\\va_shenandoah_p.csv"
                path_q <- "C:\\Users\\icprbadmin\\Documents\\R\\2018drex\\input\\ts\\state\\i_a1b\\va_shenandoah_q.csv"
                path_s <- "C:\\Users\\icprbadmin\\Documents\\R\\2018drex\\input\\ts\\state\\i_a1b\\va_shenandoah_stor.csv"
                path_g <- "C:\\Users\\icprbadmin\\Documents\\R\\2018drex\\input\\ts\\state\\i_a1b\\va_shenandoah_gw.csv"
                
                #for mac use
                if( .Platform$OS.type == "unix" ) {
                  path_p <- "/Users/lukevawter/Desktop/R/2018drex/input/ts/state/i_a1b/va_shenandoah_p.csv"
                  path_q <- "/Users/lukevawter/Desktop/R/2018drex/input/ts/state/i_a1b/va_shenandoah_q.csv"
                  path_s <- "/Users/lukevawter/Desktop/R/2018drex/input/ts/state/i_a1b/va_shenandoah_stor.csv"
                  path_g <- "/Users/lukevawter/Desktop/R/2018drex/input/ts/state/i_a1b/va_shenandoah_gw.csv"
                }
                  
                my_data_p = read.csv(path_p)
                my_data_q = read.csv(path_q)
                my_data_s = read.csv(path_s)
                my_data_g = read.csv(path_g)
                
                #takes slider input and outputs percent value for that index
                p_data_percent <- eventReactive(date_func(as.character(input$date)), {
                  for(i in 2:nrow(my_data_p)){
                    case_when(
                      i ==input$date ~ my_data_p[[2]][i]
                    )
                    #if i == input$date,
                    }
                #my_data_p$p_percent_normal[input$data_index]
                })
              
                
                precip_value <- eventReactive(input$data_index,{
                case_when(
                  p_data_percent() <= .0 ~ "background-color:purple", #"#000000",
                  p_data_percent() > .0 && p_data_percent() <= .20 ~ red,#"background-color:red", #"#cc3300",
                  p_data_percent() > .20 && p_data_percent() <= .40 ~ orange,#"background-color:orange",  #"#ff9966",
                  p_data_percent() > .40 && p_data_percent() <= .60 ~ yellow,#"background-color:yellow",  #"#ffcc00",
                  p_data_percent() > .60 && p_data_percent() <= .80 ~ green,#"background-color:green", #"#99cc33",
                  p_data_percent() > .80 && p_data_percent() < 1 ~  navy, #"background-color:navy" #"#339900"
                  TRUE ~ black
                )
                  
                })
                q_data_percent <- eventReactive(input$data_index, {
                  my_data_q$flow_cfs[input$data_index]
                })
                
                
                q_value <- eventReactive(input$data_index,{
                  case_when(
                    q_data_percent() <= 0 ~ "background-color:purple", #"#000000",
                    q_data_percent() > 0 && q_data_percent() <= 100 ~ red,#"background-color:red", #"#cc3300",
                    q_data_percent() > 100 && q_data_percent() <= 200 ~ orange,#"background-color:orange",  #"#ff9966",
                    q_data_percent() > 200 && q_data_percent() <= 300 ~ yellow,#"background-color:yellow",  #"#ffcc00",
                    q_data_percent() > 300 && q_data_percent() <= 400 ~ green,#"background-color:green", #"#99cc33",
                    #q_data_percent() > 400 && q_data_percent() < 500 ~  navy, #"background-color:navy" #"#339900"
                    q_data_percent() > 400 ~ navy,
                    TRUE ~ black
                  )
                })
                
                s_data_percent <- eventReactive(input$data_index, {
                  my_data_s$storage_days[input$data_index]
                })
                
                
                s_value <- eventReactive(input$data_index,{
                  case_when(
                    s_data_percent() <= .0 ~ "background-color:purple", #"#000000",
                    s_data_percent() > 55 && s_data_percent() <= 70 ~ red,#"background-color:red", #"#cc3300",
                    s_data_percent() > 70 && s_data_percent() <= 85 ~ orange,#"background-color:orange",  #"#ff9966",
                    s_data_percent() > 85 && s_data_percent() <= 100 ~ yellow,#"background-color:yellow",  #"#ffcc00",
                    s_data_percent() > 100 && s_data_percent() <= 115 ~ green,#"background-color:green", #"#99cc33",
                    s_data_percent() > 115 && s_data_percent() <= 130 ~  navy, #"background-color:navy" #"#339900"
                    TRUE ~ black
                  )
                })
                
                g_data_percent <- eventReactive(input$data_index, {
                  my_data_g$flow_cfs[input$data_index]
                })
                
                
                g_value <- eventReactive(input$data_index,{
                  case_when(
                    g_data_percent() <= 0 ~ "background-color:purple", #"#000000",
                    g_data_percent() > 0 && g_data_percent() <= 55 ~ red,#"background-color:red", #"#cc3300",
                    g_data_percent() > 55 && g_data_percent() <= 110 ~ orange,#"background-color:orange",  #"#ff9966",
                    g_data_percent() > 110 && g_data_percent() <= 165 ~ yellow,#"background-color:yellow",  #"#ffcc00",
                    g_data_percent() > 165 && g_data_percent() <= 220 ~ green,#"background-color:green", #"#99cc33",
                    g_data_percent() > 220 && g_data_percent() < 275 ~  navy, #"background-color:navy" #"#339900"
                    TRUE ~ black
                  )
                })
              
                output$boxes  <- renderUI({
                  div(class="topbox_main",
                      div(class="topbox1",
                          div(class="square", style=precip_value(),#"background-color:yellow"
                              div(class="content",
                                  div(class="table",
                                      div(class="table-cell",
                                          p("p")
                                      )))), 
                          div(class="square", style=g_value(),#"background-color:red",
                              div(class="content",
                                  div(class="table",
                                      div(class="table-cell",
                                          p("g")
                                      )))),
                          div(class="square", style=q_value(),#"background-color:green",
                              div(class="content",
                                  div(class="table",
                                      div(class="table-cell",
                                          p("q")
                                      )))),
                          div(class="square", style=s_value(),#"background-color:orange",
                              div(class="content",
                                  div(class="table",
                                      div(class="table-cell",
                                          p("s")
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
