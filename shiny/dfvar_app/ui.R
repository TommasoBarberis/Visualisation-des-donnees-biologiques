shinyUI(fluidPage(
  
  # Titre de l'application
  titlePanel("Exploration du jeu de données dfvaris"),
  
  # Paragraphe d'intro
  headerPanel("Introduction"),
  mainPanel(
    div(HTML("<p>Introduction sur le jeu de données <em>dvaris</em>.</p>"))
  ),

  tabsetPanel(
    tabPanel("Espèce", 
             checkboxGroupInput("species","Choisir les espèces à afficher:",
                                        choiceNames = list("V. rubra", "V. variegata"),
                                        choiceValues = list("V. rubra", "V. variegata")),
    plotOutput("abondancePlot")
    ),
    tabPanel("Sexe", 
             checkboxGroupInput("sexe","Choisir le sexe à afficher:",
                                        choiceNames = list("père", "mère"),
                                        choiceValues = list("père", "mère")))
  ),
  
  
  
  # Menu déroulant pour choisir une espèce
  # La liste des espèces est définie par les colonnes de doubs$fish
  # selectInput("espece", "Sélectionnez une espèce:",
              # choices = colnames(doubs$fish)),
  
  # Graphique représentant l'abondance de l'espèce sélectionné à chaque position géographique (doubs$xy)
  
))
