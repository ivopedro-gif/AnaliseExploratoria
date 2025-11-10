# AnaliseExploratoria
Este repositório contém os scripts e arquivos de dados para a atividade de Prática Estatística I.

##Commit

Um commit é como salvar uma versão do seu trabalho no Git.
Quando um commit é feito, é registroada todas as mudanças feitas nos arquivos (por exemplo: correções, adições ou exclusões) e podemos deixar uma mensagem explicando o que foi alterado.

É uma forma de guardar um ponto na história do projeto, para que depois possamos ver o que foi feito, por quem e até voltar a versões anteriores, se precisar.
 
## Análise Gráfica (Item 8)

Abaixo estão as descrições dos resultados gráficos obtidos a partir do script `analise_graficos.R`.

* **Histograma da Idade:** O histograma mostra que a distribuição das idades não é simétrica, apresentando uma leve inclinação à direita. A maior concentração de indivíduos está na faixa dos 25 a 30 anos, que é a classe com a maior frequência.

* **Boxplot do Tempo Preso:** O boxplot revela que a mediana do tempo preso está em torno de 5 anos. A maior parte dos dados (o "corpo" da caixa) se concentra entre 2,5 e 7,5 anos. Notamos também a presença de diversos *outliers* (pontos atípicos), indicando que alguns indivíduos têm um tempo de prisão muito superior ao da maioria.

* **Boxplot do Score por Escolaridade:** Este gráfico compara o score de periculosidade entre os níveis de escolaridade. Observa-se que a mediana do score parece aumentar com o nível de escolaridade: o "Ensino Fundamental" tem a menor mediana, seguido do "Ensino Médio" e, por fim, "Ensino Superior" com a mediana mais alta.

* **Gráfico de Barras de Reincidência:** O gráfico de barras mostra a contagem de reincidentes. Fica claro que a maioria dos indivíduos na base de dados **não** é reincidente (barra "Não" é a mais alta), embora o número de reincidentes ("Sim") seja considerável.