# AnaliseExploratoria
Este repositório contém os scripts e arquivos de dados para a atividade de Prática Estatística I.

##Commit

Um commit é como salvar uma versão do seu trabalho no Git.
Quando um commit é feito, é registroada todas as mudanças feitas nos arquivos (por exemplo: correções, adições ou exclusões) e podemos deixar uma mensagem explicando o que foi alterado.

É uma forma de guardar um ponto na história do projeto, para que depois possamos ver o que foi feito, por quem e até voltar a versões anteriores, se precisar.
 
## Análise Gráfica

Abaixo estão as descrições dos resultados gráficos obtidos a partir do script `analise_graficos.R`.

* **Histograma da Idade:** O histograma mostra que a distribuição das idades não é simétrica, apresentando uma leve inclinação à direita. A maior concentração de indivíduos está na faixa dos 25 a 30 anos, que é a classe com a maior frequência.

* **Boxplot do Tempo Preso:** O boxplot revela que a mediana do tempo preso está em torno de 5 anos. A maior parte dos dados (o "corpo" da caixa) se concentra entre 2,5 e 7,5 anos. Notamos também a presença de diversos *outliers* (pontos atípicos), indicando que alguns indivíduos têm um tempo de prisão muito superior ao da maioria.

* **Boxplot do Score por Escolaridade:** Este gráfico compara o score de periculosidade entre os níveis de escolaridade. Observa-se que a mediana do score parece aumentar com o nível de escolaridade: o "Ensino Fundamental" tem a menor mediana, seguido do "Ensino Médio" e, por fim, "Ensino Superior" com a mediana mais alta.

* **Gráfico de Barras de Reincidência:** O gráfico de barras mostra a contagem de reincidentes. Fica claro que a maioria dos indivíduos na base de dados **não** é reincidente (barra "Não" é a mais alta), embora o número de reincidentes ("Sim") seja considerável.

## Definições das Medidas Estatísticas

Suponha que temos um conjunto de dados com valores  
$x_1, x_2, \dots, x_n$:

---

### **Média ($\bar{x}$)**  
É o valor médio dos dados, calculado pela soma de todos os valores dividida pela quantidade de observações.

$$
\bar{x} = \frac{1}{n} \sum_{i=1}^{n} x_i
$$

---

### **Mediana**  
É o valor central do conjunto de dados quando eles estão em ordem crescente.  
Se o número de observações for par, a mediana é a média dos dois valores centrais.

---

### **1º Quartil (Q1) e 3º Quartil (Q3)**  
São os valores que dividem o conjunto em quatro partes iguais.  
O 1º quartil (Q1) representa 25% dos dados e o 3º quartil (Q3) representa 75%.

---

### **Variância ($s^2$)**  
Mede o quanto os valores se afastam da média.  
É obtida pela soma dos quadrados das diferenças entre cada valor e a média, dividida por $(n - 1)$.

$$
s^2 = \frac{1}{n - 1} \sum_{i=1}^{n} (x_i - \bar{x})^2
$$

---

### **Desvio Padrão ($s$)**  
É a raiz quadrada da variância e indica, em média, quanto os valores se afastam da média.

$$
s = \sqrt{s^2}
$$

---

### **Amplitude (A)**  
É a diferença entre o maior e o menor valor observado no conjunto de dados.

$$
A = \max(x_i) - \min(x_i)
$$
