 library(shiny)
 library(shinyWidgets)
 library(shinyDarkmode)

 ui <- fluidPage(

   titlePanel("Sample App"),

   # Setup
   use_darkmode(),

   # Inputs
   fluidRow(
     tags$div(style = "margin-top: -25px; float: right; margin-right: -150px;",
              prettySwitch("togglemode", "Dark Mode", value = FALSE, fill = TRUE, status = "info")
     )
   ), DT::dataTableOutput("mydt")

 )


 # Server
 server <- function(input, output, session) {

   darkmode_toggle(session, inputid = 'togglemode')

   output$mydt <- DT::renderDataTable(mtcars,
                                      options = list(pageLength = 10, autoWidth = TRUE),
                                      rownames= FALSE)

 }

 # Run App
 shinyApp(ui = ui, server = server)
