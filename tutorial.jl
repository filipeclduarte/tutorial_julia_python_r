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

### 3.3.1 Adição de duas Arrays unidimensionais

a + b

### 3.3.2 Subtração de duas Arrays unidimensionais

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

### RDatasets

# 5. Manipulação de dados 
using DataFrames
using Queryverse

# 6. Visualizações
# using Plots
using Gadfly

#### Importar base de dados 
df = datasets("ISLR", "Smarket")
#### Visualizar as primeiras linhas
head(df)

#### salvar base de dados em .csv
CSV.write("Smarket.csv", df)


### Gráfico de linha
plot(df, y=:Today, Geom.line)

### Gráfico de dispersão
plot(df, x=:Year, y=:Today, Geom.point)

### Gráfico de dispersão com grupos
plot(df, xgroup="Direction", x="Year", y="Today",
     Geom.subplot_grid(Geom.point))

# importar outra base
iris = dataset("datasets", "iris")

# # selecionando tema
# theme1 = Theme(key_position=:none)

# fig1a = plot(iris, x=:SepalLength, y=:SepalWidth, color=:Species, theme1,
#           alpha=[0.6], size=:PetalLength, Scale.size_area(maxvalue=7))

# fig1b = plot(iris, x=:SepalLength, color=:Species, Geom.density,
#           Guide.ylabel("density"), Coord.cartesian(xmin=4, xmax=8), theme1)

# vstack(fig1a,fig1b)