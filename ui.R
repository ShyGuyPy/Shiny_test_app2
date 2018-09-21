dashboardPage(
  dashboardHeader(title = "take2",
                  tags$li(textOutput("date_text"),
                  class = "dropdown")),
  dashboardSidebar(#tags$li("this is the sidebar"),
                   dateInput("date", "enter a date")),
  dashboardBody(    tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "CSS/main.css")
  )#,

    #tags$li("this is a test document...like the many before it ...and the many to come...")#,
  
    #sliderInput(inputId = "my_slider",label = "test", min = 1,max = 10, value = 5)
  ,
  div(class="topbox",
      div(class="square",
          div(class="content",
              div(class="table",
                  div(class="table-cell",
                      p("precipitation deficit")
                  )))),
      div(class="square",
          div(class="content",
              div(class="table",
                  div(class="table-cell",
                      p("ground water wells")
                  )))),
      div(class="square",
          div(class="content",
              div(class="table",
                  div(class="table-cell",
                      p("reservoir flow")
                  )))),
      div(class="square",
          div(class="content",
              div(class="table",
                  div(class="table-cell",
                      p("streamflow")
                  )))),
      div(class="square",
          div(class="content",
              div(class="table",
                  div(class="table-cell",
                      p("precipitation deficit")
                  )))),
      div(class="square",
          div(class="content",
              div(class="table",
                  div(class="table-cell",
                      p("ground water wells")
                  )))),
      div(class="square",
          div(class="content",
              div(class="table",
                  div(class="table-cell",
                      p("reservoir flow")
                  )))),
      div(class="square",
          div(class="content",
              div(class="table",
                  div(class="table-cell",
                      p("streamflow")
                  ))))
  ) #end of topbox 
  )
  
)
