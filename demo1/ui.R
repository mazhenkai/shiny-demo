library(shiny)
shinyUI(bootstrapPage(
  
  headerPanel("第一个Shiny应用"),
  
  # 左侧布局
  sidebarPanel(
    
    # 下拉框
    selectInput(inputId = "n_breaks",label = "直方图中的分隔数",choices = c(10, 20, 35, 50),selected = 20),
    
    # 单选框
    checkboxInput(inputId = "individual_obs",label = strong("实际观察点"),value = FALSE),
    
    # 单选框
    checkboxInput(inputId = "density",label = strong("密度估计曲线"),value = FALSE)
  ),
  
  # 主布局
  mainPanel(
    plotOutput(outputId = "main_plot", height = "300px"),
    
    conditionalPanel(condition = "input.density == true",
                     sliderInput(inputId = "bw_adjust",label = "带宽调整", min = 0.2, max = 2, value = 1, step = 0.2)
    )
  )
))






