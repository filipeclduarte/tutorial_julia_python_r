# Tutorial de Python

# 1. Criar variáveis

x = 10
x 

y = -10.5
y

# 2. Função print
print(x)

print('o valor de x é ', x)

# 2.2 Interpolação de string
print('o valor de x é {}'.format(x))
print(f'o valor de x é {x}')

print(f'o valor de y é {y}')

# 3. Coleção de valores
## 3.1 Lista
### 3.1.1 Unidimensional
x = [1, 2, 3]
x

### 3.1.2 Bidimensional 
#### Usar numpy array
import numpy as np

X = np.array([[1, 2, 3],[4, 5, 6], [7, 8, 9]])
X

## 3.2 Fatiamento
### 3.2.1 Unidimensional

#### Python inicia a contagem em '0'
x[0] # primeiro valor
x[1] # segundo valor
x[-1] # último valor
x[:2] # do primeiro ao segundo valor (não inclui o último valor do intervalo)
x[1:] # do segundo ao último valor

### 3.2.2. Bidimensional

X[0,0] # primeira linha, primeira coluna
X[1,0] # segunda linha, primeira coluna
X[:,0] # todas as linhas, primeira coluna
X[0,:] # primeira linha, todas as colunas
X[:2,:2] # primeira e segunda linha e coluna 
X[1:,0] # da segunda a última linha, primeira coluna
X[1,1:] # segunda linha, da segunda a terceira coluna

## 3.3 Operações entre Numpy Arrays

#### Criando as arrays unidimensionais
a = np.array([1, 2, 3])
b = np.array([-1, 10, 8])

### Operações com escalares
c = 2
 
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

### usar o .T para transpor o vetor
np.dot(a.T, b)
# alternativa
a.T.dot(b)

### 3.3.6 Produto externo de dois vetores
np.outer(a, b.T)

# 4. Importação/Exportação de dados
import pandas as pd

## 4.1 Importar dados no formato .csv
df = pd.read_csv('data/Smarket.csv')

### Visualizar as 5 primeiras linhas
df.head()

# df.to_csv('data/Smarket.csv')
# 5. Manipulação de dados

# 6. Visualizações

import matplotlib.pyplot as plt
import seaborn as sns

##### Matplotlib
plt.plot(df['Today'])
plt.show()

### Gráfico de dispersão
plt.scatter(df['Year'],df['Today'])
plt.show()

#### Seaborn
## linha
sns.lineplot(x='Year',y='Today', data=df)
plt.show()

## dispersão
sns.scatterplot(x='Year',y='Today', data=df)
plt.show()

## Gráfico de dispersão com grupos
sns.catplot(x='Year',y='Today', hue='Direction',data=df)
plt.show()

## com facetGrid
g = sns.FacetGrid(df, col='Direction')
g.map(sns.scatterplot, 'Year', 'Today', alpha=.7)
plt.show()

## Com x sendo contínuo
x = np.arange(len(df))
sns.scatterplot(x=x, y='Today', hue='Direction',data=df)
plt.show()