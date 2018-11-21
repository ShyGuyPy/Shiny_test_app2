shinyServer(function(input, output, session){
#eventReactive(input$date,
              output$date_text  <- renderText({
                #str_pad(str_c("Today's date is ", as.character(test_date$test_date_value)), width = 50, side = "right", pad=" ")
                str_c(str_pad(str_c("Today's date is", as.character(test_date$test_date_value), sep= " "), width = 30, side = "right", pad= " "),
                " ")
              })
#   output$date_text <- renderText(as.character(input$date)))
            
                #takes date input and outputs percent value for that date
                p_data_percent <- eventReactive(test_date$test_date_value, {
                  date_func(my_data_p$date, my_data_p$p_percent_normal, test_date$test_date_value)
                  
                  #for(i in my_data_p$date){
                    # case_when(
                    # as.character(i) == as.character(test_date$test_date_value)~ my_data_p$p_percent_normal[which(my_data_p$date == i)])

                  #}
                  
                #my_data_p$p_percent_normal[input$data_index]
                })
              
                
                precip_value <- eventReactive(test_date$test_date_value,{#a_index,{
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
                
                q_data_percent <- eventReactive(test_date$test_date_value, {
                  date_func(my_data_q$date, my_data_q$flow_cfs, test_date$test_date_value)
                })
                # q_data_percent <- eventReactive(input$data_index, {
                #   my_data_q$flow_cfs[input$data_index]
                # })
                
                
                q_value <- eventReactive(test_date$test_date_value,{
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
                
                s_data_percent <- eventReactive(test_date$test_date_value, {
                  date_func(my_data_s$date, my_data_s$storage_days, test_date$test_date_value)
                })
                
                #slider...
                # s_data_percent <- eventReactive(input$data_index, {
                #   my_data_s$storage_days[input$data_index]
                # })
                
                
                s_value <- eventReactive(test_date$test_date_value,{
                  case_when(
                    s_data_percent() <= 0 ~ "background-color:purple", #"#000000",
                    s_data_percent() > 0 && s_data_percent() <= 60 ~ red,#"background-color:red", #"#cc3300",
                    s_data_percent() > 60 && s_data_percent() <= 90 ~ orange,#"background-color:orange",  #"#ff9966",
                    s_data_percent() > 90 && s_data_percent() <= 120 ~ yellow,#"background-color:yellow",  #"#ffcc00",
                    s_data_percent() > 120 && s_data_percent() <= 500 ~ green,#"background-color:green", #"#99cc33",
                    s_data_percent() > 500 && s_data_percent() <= 1130 ~  navy, #"background-color:navy" #"#339900"
                    TRUE ~ black
                  )
                })
                
                g_data_percent <- eventReactive(test_date$test_date_value, {
                  date_func(my_data_g$date, my_data_g$flow_cfs, test_date$test_date_value)
                })
                
                # g_data_percent <- eventReactive(input$data_index, {
                #   my_data_g$flow_cfs[input$data_index]
                # })
                
                
                g_value <- eventReactive(test_date$test_date_value,{
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
                
                
                output$ibox <- renderUI({
                #   div(class="longbox",
                #       div(class="squarei", style = red,
                #           div(class="my_content",
                #               div(class="table",
                #                   div(class="table-cell2",
                #                       p(style= "font-color:white;", "Normal")
                #                       )))),
                #       div(class="ibox", style = "background-color:white",
                #           div(class="my_content",
                #               div(class="table",
                #                   div(class="table-cell2",
                #                       p(class = "p1","Some more text to show how it will look")
                #                   ))))
                #   )
                # 
                # })
                    div(class="longbox",
                        div(class="ibox", style = "background-color:silver",
                            div(class="my_content",
                                div(class="table",
                                    div(class="table-cell2",
                                        p(class = "p1",paste0("CO-OP operations status "))#,text_stage2))
                                    )))),
                        div(class="squarei", style = yellow,#color_stage,
                            div(class="my_content",
                                div(class="table",
                                    div(class="table-cell2",
                                        p(class="p2","coop placeholder output")#text_stage)
                                    ))))
                        
                    ) # end div(class="longbox" 
                  }) # end renderUI
                
                output$ibox2 <- renderUI({
                  div(class="longbox",
                      div(class="ibox", style = "background-color:silver",
                          div(class="my_content",
                              div(class="table",
                                  div(class="table-cell2",
                                      p(class = "p1",paste0("LFAA stage"))#"Little Falls adj. flow, MGD "))#,text_stage2))
                                  )))),
                      div(class="squarei", style = red,#color_stage,
                          div(class="my_content",
                              div(class="table",
                                  div(class="table-cell2",
                                      p(class="p2","lfaa placeholder output")#text_stage)
                                  ))))
                      
                  ) # end div(class="longbox"
                }) # end renderUI
                
                output$ibox3 <- renderUI({
                  div(class="longbox",
                      div(class="ibox", style = "background-color:silver",
                          div(class="my_content",
                              div(class="table",
                                  div(class="table-cell2",
                                      p(class = "p1",paste0("MWCOG stage"))#"Little Falls adj. flow, MGD "))#,text_stage2))
                                  )))),
                      div(class="squarei", style = green,#color_stage,
                          div(class="my_content",
                              div(class="table",
                                  div(class="table-cell2",
                                      p(class="p2","mwcog placeholder output")#text_stage)
                                  ))))
                      
                  ) # end div(class="longbox"
                }) # end renderUI
                
                output$MD_title <- renderUI({
                  div(p(class= "title","MARYLAND DROUGHT STATUS"))
                })
                
                #MD region 
                output$boxes  <- renderUI({
                # div(class="topbox_main",
                #     div(class="mapbox", #p(class= "title","MARYLAND DROUGHT STATUS"),
                #         div(class="tallsquare", style="background-color:white",
                #                 div(class="my_content",
                #                     div(class="table",
                #                         div(class="table-cell"
                #                         ))))
                #         ),
                #     
                #     div(class="topboxmiddle",
                #         div(class="tallsquare", style="background-color:grey",
                #             div(class="my_content",
                #                 div(class="table",
                #                     div(class="table-cell"
                #                     ))))
                #     ),
                      #the image link below is a placeholder for an interactive leaflet map forthcoming
                      
                      #img( src="https://md.water.usgs.gov/drought/MDE-Drought2017-02-28.png", height="160px", width="360px"),
                      
                      
                      #this is html in a format taht shiny will accept.  This along with main.css structures the 
                      #properties of the Maryland Drought Status section
                      div(class="sidebox",
                          div(class="squareside1", style = "background-color:white",
                              div(class="my_content",
                                  div(class="table",
                                      div(class="table-cell",
                                          p(class="p3","Flow benefit, MGD")
                                      )))),
                          div(class="squareside2", style="background-color:silver",
                              div(class="my_content",
                                  div(class="table",
                                      div(class="table-cell3", #style="text-align:right;",
                                          p(style="font-size:15px;", "11.5")
                                      ))))
                      ) #end of sidebox
                  #) #end of topboxmain
                
                  
                })
                
                
                output$mymap <- renderLeaflet({
                  c_color= map_green
                  w_color= map_yellow
                  leaflet(options= leafletOptions(minZoom = 6.7, maxZoom=6.7, zoomControl=FALSE))%>%
                    addPolygons(data = clipcentral_t, color="black", fillColor = c_color, opacity = 1, weight = 1,
                                fillOpacity = 1) %>%
                    addPolygons(data = western_region_t, color="black", fillColor = w_color, opacity = 1, weight= 1,
                                fillOpacity = 1) %>%
                    addLabelOnlyMarkers(lng = -78.5, lat = 39.2, label = "Western",
                                        labelOptions = labelOptions(noHide = T, direction = "bottom",
                                                                    style = list(
                                                                      "color" = "black",
                                                                      "font-family" = "helvetica",
                                                                      #"font-style" = "italic",
                                                                      #"box-shadow" = "3px 3px rgba(0,0,0,0.25)",
                                                                      "font-size" = "15px",
                                                                      "border-color" = "rgba(0,0,0,0.5)",
                                                                      "font-weight" = "bold"
                                                                    ))) %>%
                  # addLabelOnlyMarkers(
                  addLabelOnlyMarkers(lng = -76.5, lat = 39.2,
                               label = "Central",
                               labelOptions = labelOptions(noHide = T, direction = "bottom",
                                                           style = list(
                                                             "color" = "black",
                                                             "font-family" = "helvetica",
                                                             #"font-style" = "italic",
                                                             #"box-shadow" = "3px 3px rgba(0,0,0,0.25)",
                                                             "font-size" = "15px",
                                                             "border-color" = "rgba(0,0,0,0.5)",
                                                             "font-weight" = "bold"
                                                           )))
                    # addLabelOnlyMarkers(
                    #   lng = -76.6412, lat = 39.0457,
                    #   label = "say something")
                  
                  
                  
                  
                })
                
                
                output$boxes2  <- renderUI({
                  div(class="topbox_main", p(class= "title", "VIRGINIA DROUGHT STATUS"),
                      div(class="topbox1", 
                          div(class="square", style=orange,#"background-color:yellow"
                              div(class="my_content",
                                  div(class="table",
                                      div(class="table-cell",
                                          p(class="p4","P")
                                      )))), 
                          div(class="square", style=red,#"background-color:red",
                              div(class="my_content",
                                  div(class="table",
                                      div(class="table-cell",
                                          p(class="p4","GW")
                                      )))),
                          div(class="square", style=green,#"background-color:orange",
                              div(class="my_content",
                                  div(class="table",
                                      div(class="table-cell",
                                          p(class="p4","SW")
                                      )))),
                          div(class="square", style=yellow,#"background-color:green",
                              div(class="my_content",
                                  div(class="table",
                                      div(class="table-cell",
                                          p(class="p4","R")
                                      )))),
                          div(class="ibox", style = "background-color:white",
                              div(class="my_content",
                                  div(class="table",
                                      div(class="table-cell",
                                          p(class = "p5",paste0("Shenandoah "))#,text_stage2))
                                      ))))
                          ), #end of topbox1
                      
                      div(class="topboxmiddle",
                          div(class="tallsquare", style="background-color:white",
                              div(class="my_content",
                                  div(class="table",
                                      div(class="table-cell"
                                      ))))
                      ),
                          div(class="topbox2", 
                              div(class="square", style=red,
                                  div(class="my_content",
                                      div(class="table",
                                          div(class="table-cell",
                                              p(class="p4","P")
                                          )))),
                              div(class="square", style=green,
                                  div(class="my_content",
                                      div(class="table",
                                          div(class="table-cell",
                                              p(class="p4","GW")
                                          )))),
                              div(class="square", style=yellow,
                                  div(class="my_content",
                                      div(class="table",
                                          div(class="table-cell",
                                              p(class="p4","SW")
                                          )))),
                              div(class="square", style=orange,
                                  div(class="my_content",
                                      div(class="table",
                                          div(class="table-cell",
                                              p(class="p4","R")
                                          )))),
                              div(class="ibox", style = "background-color:white",
                                  div(class="my_content",
                                      div(class="table",
                                          div(class="table-cell",
                                              p(class = "p5",paste0("NoVa "))#,text_stage2))
                                          ))))
                              
                          ), #end of topbox2
                      div(class="topboxmiddle",
                          div(class="tallsquare", style="background-color:white",
                              div(class="my_content",
                                  div(class="table",
                                      div(class="table-cell"
                                      ))))
                      ),
                          div(class="sidebox",
                              div(class="squareside1", style = "background-color:white",
                                  div(class="my_content",
                                      div(class="table",
                                          div(class="table-cell",
                                              p(class="p3","Flow benefit, MGD")
                                          )))),
                              div(class="squareside2", style="background-color:silver",
                                  div(class="my_content",
                                      div(class="table",
                                          div(class="table-cell3", #style= "text-align:right",
                                              p(style="font-size:15px;","12.3")
                                          ))))
                          ) #end of sidebox
                      )#end of topbox_main
                })
                
                # output$test_output1  <- renderUI({
                #   div(style="color:black", paste0("prepic is ", as.character(p_data_percent())),
                #   div(style="color:black", paste0("q is ", as.character(q_data_percent())),
                #   div(style="color:black", paste0("storage is ", as.character(s_data_percent())),
                #   div(style="color:black", paste0("ground water is ", as.character(g_data_percent()))
                #   ))))
                # })
                
                
                observeEvent(input$date, {
                  test_date$test_date_value <- input$date
                })
                
                test_date <- reactiveValues(test_date_value = "1930-05-01")

               

})
