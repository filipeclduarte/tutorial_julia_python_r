# Tutorial de Julia

# 1. Criar variáveis

x = 10
# x

y = -10.5
# y

# 2. Função println
println(x)

println("o valor de x é ", x)

# 2.1 Interpolação de string
println("o valor de x é $(x)")
println("o valor de y é $(y)")

# 3. Coleção de valores
## 3.1 Array
### 3.1.1 Unidimensional Array{Any, 1}
x = [1, 2, 3]
x

### 3.1.2 Bidimensional Array{Any, 2}
X = [1 2 3;
     4 5 6;
     7 8 9]

## 3.2 Fatiamento
### 3.2.1 Unidimensional

x[1] # primeiro valor
x[2] # segundo valor
x[end] # último valor
x[1:2] # do primeiro ao segundo valor
x[2:end] # do segundo ao último valor

### 3.2.2 Bidimensional

X[1,1] # primeira linha, primeira coluna
X[2,1] # segunda linha, primeira coluna
X[:,1] # todas as linhas, primeira coluna
X[1,:] # primeira linha, todas as colunas
X[1:2, 1:2] # primeira e segunda linha e coluna 
X[2:end, 1] # da segunda a última linha, primeira coluna
X[2, 2:end] # segunda linha, da segunda a terceira coluna

## 3.3 Operações entre Arrays

#### Criando as arrays unidimensionais
a = [1, 2, 3];
b = [-1, 10, 8];

### Operação com escalares
c = 2

a .+ c
a .- c
a .* c
a ./ c
ggplot(df, aes(x=seq_along(Today), y=Today)) + 
geom_line()s unidimensionais

a - b

### 3.3.3 Multiplicação elemento por elemento

a .* b

### 3.3.4 Divisão elemento por elemento

a ./ b

### 3.3.5 Produto interno de dois vetores

### usar o "'" para transpor o vetor
a' * b

### 3.3.6 Produto externo de dois vetores
a * b'

# 4. Importação/Exportação de dados 
using CSV

# 5. Manipulação de dados 
using DataFrames

# 6. Visualizações
using Gadfly
using VegaLite

### Importar a base de dados
df = CSV.read("data/Smarket.csv", DataFrame)

#### Visualizar as primeiras linhas
first(df, 6)

#### salvar base de dados em .csv
# CSV.write("data/Smarket.csv", df)

### Gráfico de linha
# linha
plot(df, y=:Today, Geom.line)

### Gráfico de dispersão
# Gadfly
plot(df, x=:Year, y=:Today, Geom.point)

### Gráfico de dispersão com grupos
plot(df, color=:Direction, x=:Year, y=:Today, Geom.point)
df |> @vlplot(:point, x={"Year:t", axis={format="%Y"}}, y=:Today, color=:Direction)

### Com Grid
plot(df, color=:Direction, xgroup=:Direction, x=:Year, y=:Today,
     Geom.subplot_grid(Geom.point))

## Com x sendo contínuo
x = 1:nrow(df)
plot(df, color=:Direction, x=x, y=:Today, Geom.point)



### Testando aqui umas paradas

@select(df, :Today)
@where(df, :Year .> 2004)

x_thread = @linq df |>
    transform(y = 100 * :Today) |>
    where(:Year .> 2003) |>
    by(:Direction, meanLag1 = mean(:Lag1), meanLag2 = mean(:Lag2), meanToday = mean(:y)) |>
    orderby(:meanLag1) |>
    select(:meanLag1, :meanLag2, :meanToday, var =:Direction)
