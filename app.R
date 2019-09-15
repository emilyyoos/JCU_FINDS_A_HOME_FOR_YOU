#packages to install
#install.packages("shiny")
#install.packages("shinydashboard")



library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Northeast Ohio SPCA",
                  dropdownMenu(type = "notifications",
                               messageItem(
                                 from = "Wellness Clinic",
                                 message = "Captain: neutered",
                                 time = "12:00"
                               ),
                               messageItem(
                                 from = "Wellness Clinic",
                                 message = "Pi: check up",
                                 time = "13:45"
                               ),
                               messageItem(
                                 from = "Wellness Clinic",
                                 message = "Tripp: Booster Shot",
                                 time = "2:00"
                               ),
                               messageItem(
                                 from = "Transfer Incoming",
                                 message = "Transfer from North Carolina",
                                 icon = icon("truck"),
                                 time = "3:00"
                               )
                  ),
                  dropdownMenu(type = "messages",
                               messageItem(
                                 from = "Amy",
                                 message = "Be careful with Capitain",
                                 time = "1:00"
                               ),
                               messageItem(
                                 from = "Vince",
                                 message = "Pi = No dogs!",
                                 time = "13:45"
                               ),
                               messageItem(
                                 from = "Kevin",
                                 message = "Tripp on short walks today! Just had surgery!",
                                 time = "2:00"
                               )
                  ),
                  dropdownMenu(type = "tasks", badgeStatus = "success",
                               taskItem(value = 90, color = "green",
                                        "Dog Capacity"
                               ),
                               taskItem(value = 17, color = "aqua",
                                        "Cat Capacity"
                               ),
                               taskItem(value = 75, color = "yellow",
                                        "Shelter Capacity"
                               )
                  )),
  dashboardSidebar(
    sidebarMenu(
      sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                        label = "Search..."),
      menuItem("Overview", tabName = "overview", icon = icon("dashboard")),
      menuItem("New Arrivals", tabName = "new", icon = icon("paw")),
      menuItem("Adoptions", tabName = "adoptions", icon = icon("heart")),
      menuItem("Current Animals", tabName = "current", icon = icon("th")),
      menuItem("Staff", tabName = "staff", icon = icon("user"))
    )
  ),
  dashboardBody(
    fluidRow(
      infoBox("Arrivals", 52, icon = icon("share-alt"), fill = TRUE, color = "red"),
      infoBox("Adoptions", 30, icon = icon("heart"), fill = TRUE),
      infoBox("Animals", 100, icon = icon("paw"), fill = TRUE, color = "teal")
    )
  )
  
)

server <- function(input, output, session) {
  
 # output$message_menu <- renderMenu({
 #   msgs <- apply(messageData, 1, function(row) {
 #     messageItem(from = row[["from"]], message = row[["message"]])
 #   })
 #   dropdownMenu(type = "messages", .list = msgs)
 # })
  
}

shinyApp(ui, server)
