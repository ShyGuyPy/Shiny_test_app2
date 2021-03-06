dashboardPage(
  dashboardHeader(title = "take2",
                  tags$li(textOutput("date_text"),
                  class = "dropdown")),
  dashboardSidebar(#tags$li("this is the sidebar"),
                   dateInput(inputId = "date", label = "enter a date", value = "1998-10-04")),
  dashboardBody(    tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "CSS/main.css")
  ),


    #tags$li("this is a test document...like the many before it ...and the many to come...")#,
  
    #sliderInput(inputId = "my_slider",label = "test", min = 1,max = 10, value = 5)
  sliderInput(inputId = "data_index", 
                       label = "slide to data index", 
                       value = 2, min = 2, max = 427),
  #htmlOutput(outputId = "boxes"),
  htmlOutput(outputId = "test_output1"),
  fluidRow(
    column(
      width = 6,
      box(
        title=NULL,
        width=NULL,
        height=50,
        htmlOutput(outputId = "ibox")
      ),
      box(
        title=NULL,
        width=NULL,
        height=50,
        htmlOutput(outputId = "ibox2")
      ),
      box(
        title=NULL,
        width=NULL,
        height=50,
        htmlOutput(outputId = "ibox3")
      ),
      box(
        title = NULL,#"MARYLAND",
        width = NULL,
        height = 220,
        htmlOutput(outputId="MD_title"),
        box(
          leafletOutput("mymap", height =140, width = 300)
        ),
        box(
          htmlOutput(outputId = "boxes")
        )
        #tags$p("Western region: Drought Watch; Central region: Drought Warning")

        ),
      box(
        title = NULL,#"VIRGINIA",
        width = NULL,
        height = 220,
        htmlOutput(outputId = "boxes2")
        #"NoVa: Drought Watch; Shenandoah: Drought Emergency")
      )
  

  #tags$script(src = "test.js")
  
  
    ))
  )
  
)

