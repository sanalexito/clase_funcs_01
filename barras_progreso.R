n_iter <- 50 # Número de iteraciones del bucle
# Inicializa la barra de progreso
pb <- txtProgressBar(min = 0,      # Valor mínimo de la barra de progreso
                     max = n_iter, # Valor máximo de la barra de progreso
                     style = 3,    # Estilo de la barra (también style = 1 y style = 2)
                     width = 50,   # Ancho de la barra. Por defecto: getOption("width")
                     char = "=")   # Carácter usado para crear la barra

for(i in 1:n_iter) {

  #-------------------
  # Aquí va tu código:
  #-------------------

  Sys.sleep(0.1) # Borra esta línea y añade tu código

  #-------------------

  # Actualiza la barra de progreso al estado actual
  setTxtProgressBar(pb, i)
}

close(pb) # Cerramos la conexión

#-------------------------------------------------------------------------------
# install.packages("lubridate")
library(lubridate)

n_iter <- 20

pb <- txtProgressBar(min = 0,
                     max = n_iter,
                     style = 3,
                     width = n_iter, # Necesario para evitar múltiples prints
                     char = "=")

inicio <- numeric(n_iter)
fin <- numeric(n_iter)


for(i in 1:n_iter){

  inicio[i] <- Sys.time()

  #-------------------
  # Aquí va tu código:
  #-------------------

  Sys.sleep(0.1) # Borra esta línea y añade tu código

  #-------------------

  fin[i] <- Sys.time()

  setTxtProgressBar(pb, i)
  tiempo <- round(seconds_to_period(sum(fin - inicio)), 0)

  # Tiempo restante estimado basado en el tiempo
  # medio que tardaron en ejecutarse las iteraciones previas
  est <- n_iter * (mean(fin[fin != 0] - inicio[inicio != 0])) - tiempo
  restante <- round(seconds_to_period(est), 0)

  cat(paste(" // Tiempo ejecución:", tiempo,
            " // Tiempo restante estimado:", restante), "")

}

close(pb)

#-------------------------------------------------------------------------------


# install.packages("progress")
library(progress)

n_iter <- 100

pb <- progress_bar$new(format = "(:spin) [:bar] :percent [Tiempo transcurrido: :elapsedfull || Tiempo restante estimado: :eta]",
                       total = n_iter,
                       complete = "=",   # Caracteres de las iteraciones finalizadas
                       incomplete = "-", # Caracteres de las iteraciones no finalizadas
                       current = ">",    # Carácter actual
                       clear = FALSE,    # Si TRUE, borra la barra cuando termine
                       width = 100)      # Ancho de la barra de progreso

for(i in 1:n_iter) {

  # Actualiza el estado actual
  pb$tick()

  #-------------------
  # Aquí va tu código:
  #-------------------

  Sys.sleep(0.1) # Borra esta línea y añade tu código

  #-------------------

}



#-------------------------------------------------------------------------------
n_iter <- 50 # Número de iteraciones

pb <- winProgressBar(title = "Barra de progreso de Windows", # Título de la ventana
                     label = "Porcentaje completado",        # Texto de la ventana
                     min = 0,      # Valor mínimo de la barra
                     max = n_iter, # Valor máximo de la barra
                     initial = 0,  # Valor inicial de la barra
                     width = 300L) # Ancho de la ventana

for(i in 1:n_iter) {

  #-------------------
  # Aquí va tu código:
  #-------------------

  Sys.sleep(0.1) # Borra esta línea y añade tu código

  #-------------------

  pctg <- paste(round(i/n_iter *100, 0), "% completado")
  setWinProgressBar(pb, i, label = pctg) # Al pasar pctg al argumento label se sobreescribirá
  # el texto del argumento label de la función winProgressBar
}

close(pb) # Cerramos la conexión



#-------------------------------------------------------------------------------
# install.packages("tcltk")
library(tcltk)

n_iter <- 50 # Número de iteraciones

pb <- tkProgressBar(title = "Barra de progreso Tk",  # Título de la ventana
                    label = "Porcentaje completado", # Texto de la ventana
                    min = 0,      # Valor mínimo de la barra
                    max = n_iter, # Valor máximo de la barra
                    initial = 0,  # Valor inicial de la barra
                    width = 300)  # Ancho de la ventana

for(i in 1:n_iter) {

  #-------------------
  # Aquí va tu código:
  #-------------------

  Sys.sleep(0.1) # Borra esta línea y añade tu código

  #-------------------

  pctg <- paste(round(i/n_iter *100, 0), "% completado")
  setTkProgressBar(pb, i, label = pctg)
}

close(pb) # Cerramos la conexión
