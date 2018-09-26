dashboardPage(
  dashboardHeader(title = "take2",
                  tags$li(textOutput("date_text"),
                  class = "dropdown")),
  dashboardSidebar(#tags$li("this is the sidebar"),
                   dateInput("date", "enter a date")),
  dashboardBody(    tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "CSS/main.css")
  ),

    #tags$li("this is a test document...like the many before it ...and the many to come...")#,
  
    #sliderInput(inputId = "my_slider",label = "test", min = 1,max = 10, value = 5)
  sliderInput(inputId = "data_index", 
                       label = "test_slider", 
                       value = 1, min = 1, max = 427),
  htmlOutput(outputId = "boxes")
  
  
    
  )
  
)
