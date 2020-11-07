# Tutorial de R

# 1. Criar variáveis
x = 10
# x
x <- 10
# x
y = -10.5
# y
y <- -10.5
y

# 2. Função print
print(x)

print('o valor de x é ', x)

# 2.1 Interpolação de string
sprintf("o valor de x é %i", x)
sprintf("o valor de y é %f", y)

# 3. Coleção de valores
## 3.1 Array
### 3.1.1 Unidimensional (vector)
x <- c(1, 2, 3)
x
### 3.1.2 Bidimensional (matrix)
X <- matrix(c(1, 2, 3, 4, 5, 6), ncol=3, byrow=TRUE)
X

## 3.2 Fatiamento 
### 3.2.1. Unidimensional

x[1] # primeiro valor
x[2] # segundo valor
x[length(x)] # último valor
tail(x, 1) # último valor

### 3.2.2. Bidimensional

X[1,1] # primeira linha, primeira coluna
X[2,1] # segunda linha, primeira coluna
X[,1] # todas as linhas, primeira coluna
X[1,] # primeira linha, todas as colunas
X[1:2, 1:2] # primeira e segunda linha e coluna 
X[2:length(X), 1] # da segunda a última linha, primeira coluna
X[2, 2:length(X)] # segunda linha, da segunda a terceira coluna

## 3.3 Operações entre Vetores

#### Criando vetores
a <- c(1, 2, 3)
b <- c(-1, 10, 8)

#### Operações com escalares
c <- 2

a + c
a - c
a * c
a / c

### 3.3.1 Adição de duas Arrays unidimensionais

a + b

### 3.3.2 Subtração de duas Arrays unidimensionais

a - b

### 3.3.3 Multiplicação elemento por elemento

a * b

### 3.3.4 Divisão elemento por elemento

a / b

### 3.3.5 Produto interno de dois vetores

### usar a função t() para transpor o vetor (não é obrigatório)
a %*% b

### 3.3.6 Produto externo de dois vetores
outer(a, b)

# 4. Importação/Exportação de dados
library("ISLR")
df <- Smarket

## visualizar as 6 primeiras linhas
head(df)

# 4. Manipulação de dados
library("tidyverse")

#### Visualizações
library("ggplot2")

ggplot(df, aes(x=seq_along(Today), y=Today)) + 
geom_line()

ggplot(df, aes(x=Year, y=Today)) +
geom_point()



