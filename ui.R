dashboardPage(
  dashboardHeader(title = "take2",
                  tags$li("variable forthcoming",
                  class = "dropdown")),
  dashboardSidebar(tags$li("this is the sidebar"),
                   dateInput("date", "enter a date")),
  dashboardBody(    tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "CSS/main.css")
  ),

    tags$li("this is a test document...like the many before it ...and teh many to come...")#,
  
    #sliderInput(inputId = "my_slider",label = "test", min = 1,max = 10, value = 5)
  )
  
)
