# ==============================================================================
# Aprendendo R - Quadrilátero gradiente
# José Roberto M. Garcia (garcia.cptec@gmail.com)
# Nov, 2016
# ------------------------------------------------------------------------------
# Plotar um retângulo com preenchimento gradiente entre duas ou mais cores.
# ==============================================================================

# ------------------------------------------------------------------------------
# Criando as cores
# ------------------------------------------------------------------------------
# Criar N cores de transição entre duas cores.
# Quanto maior o N, mais suave a transição entre as cores fica.
# No exemplo uso N=1000

# Carrega a biblioteca responsável por definir as cores do gradiente
library(RColorBrewer)   
# Cria uma função que vai retornar N cores entre as duas cores especificadas
pal.red2blue <- colorRampPalette(c('red', 'blue'))
# Gera 1000 cores que ficam entre a 1a. e a 2a. cor (em Hexadecimal)
my.colors <- pal.red2blue(1000)

# ------------------------------------------------------------------------------
# Criar um retângulo e preenchê-lo com as cores criadas
# ------------------------------------------------------------------------------
m <- matrix(my.colors, ncol=1)  # cria uma matriz com as cores criadas acima
img <- as.raster(m)             # cria a imagem baseada na matriz

# ------------------------------------------------------------------------------
# Plota a imagem na tela
# ------------------------------------------------------------------------------
plot(0:10,0:10, type='n')     # inicializa a área de plotagem em branco
# plota a imagem specificando os 4 cantos no formato x1, y1, x2, y2
rasterImage(img, 2, 2, 8, 8)

# outro exemplo - rotação
plot(0:10,0:10, type='n')     # "limpa a tela"
rasterImage(img, 4, 2, 6, 8)
rasterImage(img, 4, 2, 6, 8, angle = 90) # rotaciona 90o. para a esquerda

# outro exemplo - múltiplas cores
pal2 <- colorRampPalette(c('green', 'yellow', 'red', 'white', 'blue'))
col2 <- pal2(1000)
m2 <- matrix(col2, ncol=1)    # cria uma matriz com as cores criadas acima
img2 <- as.raster(m2)         # cria a imagem baseada na matriz
plot(0:10,0:10, type='n')     # inicializa e define a área de plotagem
rasterImage(img2, 4, 2, 6, 8) # plota a imagem

# Inconveniente - Executar o código abaixo com diferentes tamanhos da janela de gráficos do RStudio
pal3 <- colorRampPalette(c('green', 'orange', 'red'))
col3 <- pal3(1000)
m3 <- matrix(col3, ncol=1)    # cria uma matriz com as cores criadas acima
img3 <- as.raster(m3)         # cria a imagem baseada na matriz
plot(0:6,0:6, type='n')       # inicializa e define a área de plotagem
rasterImage(img3, 6, 2, 7, 9, angle = 90) # rotaciona 90o. para a esquerda

# Alternativa - Pacote Plotrix - Teste com diferentes tamanhos de janela também
#install.packages('plotrix')  # executar apenas uma vez a instalação do pacote
library(plotrix)              # Carrega o pacote
plot(0:6,0:6, type='n')       # inicializa e define a área de plotagem
gradient.rect(0,1,6,5, col=smoothColors('green', 100, 'orange', 100, 'red', alpha=200), border=1, gradient="x")


# Aplicações práticas
# Definição de horizontes de previsão de tempo segundo a Organização Mundial de Meteorologia
plot(0:10,0:10, type='n')       # inicializa e define a área de plotagem
gradient.rect(0,1,10,5, col=smoothColors('green', 100, 'orange', 100, 'red', alpha=200), border=1, gradient="x")
polygon(x=c(0, 10, 10, 0, 0), y=c(1, 1, 5, 5, 1), lwd=5)

hs <- c(2, 12, seq(24,360, 24), 480, 600, 720)
ds <- c('', '', 1:15, 20, 25, 30)
x.pos <- seq(.1, (.5*length(ds)), .5)
m1 <- par("usr")[1]
text(m1, 0.7, labels = 'hours', xpd=T, col='blue', pos = 4)
text(x.pos, y = 0.7, labels = hs)
text(m1, 0.2, labels = 'days', xpd=T, col='blue', pos = 4)
text(x.pos, y = 0.2, labels = ds)

lines(x=c(x.pos[1], x.pos[1]), c(1, 5.4), lwd=4, col='blue', lty=2)
lines(x=c(m1, x.pos[1]), c(5.4, 5.4), lwd=4, col='blue', lty=2)
text(m1, 5.7, "Nowcasting", col='blue', pos = 4)

lines(x=c(x.pos[2], x.pos[2]), c(1, 6.4), lwd=4, col='blue', lty=2)
lines(x=c(m1, x.pos[2]), c(6.4, 6.4), lwd=4, col='blue', lty=2)
text(x.pos[2], 6.7, "Very short-range", col='blue', pos = 2)

lines(x=c(x.pos[5], x.pos[5]), c(1, 6.4), lwd=4, col='blue', lty=2)
#lines(x=c(x.pos[2], x.pos[5]), c(6.4, 6.4), lwd=4, col='blue', lty=2)
text(x.pos[5], 6.7, "range", col='blue', pos = 2)












