

# Instalar / carregar pacotes necessários
if (!require("readxl")) install.packages("readxl", repos="https://cloud.r-project.org")
if (!require("dplyr")) install.packages("dplyr", repos="https://cloud.r-project.org")
if (!require("ggplot2")) install.packages("ggplot2", repos="https://cloud.r-project.org")

library(readxl)
library(dplyr)
library(ggplot2)

# 1) Importar a base de dados
df <- read_excel("Base_trabalho.xlsx")

# 2) Transformar variáveis qualitativas em fatores
df <- df %>%
  mutate(
    sexo = factor(sexo, levels = c(0,1), labels = c("Feminino","Masculino")),
    filhos = factor(filhos, levels = c(0,1), labels = c("Nao","Sim")),
    escolaridade = factor(escolaridade, levels = c(1,2,3), labels = c("Fundamental","Medio","Superior")),
    casado = factor(casado, levels = c(0,1), labels = c("Nao","Sim")),
    reincidente = factor(reincidente, levels = c(0,1), labels = c("Nao","Sim"))
  )

# 3) Estatísticas: média, Q1, mediana e Q3
variaveis <- c("score_periculosidade", "idade", "tempo_preso")

estatisticas <- data.frame(
  variavel = variaveis,
  media = sapply(df[variaveis], function(x) mean(x, na.rm = TRUE)),
  q1 = sapply(df[variaveis], function(x) quantile(x, probs = 0.25, na.rm = TRUE)),
  mediana = sapply(df[variaveis], function(x) median(x, na.rm = TRUE)),
  q3 = sapply(df[variaveis], function(x) quantile(x, probs = 0.75, na.rm = TRUE))
)

print("Resumo das estatísticas:")
print(estatisticas)
write.csv(estatisticas, "estatisticas_resumo.csv", row.names = FALSE)

# 4) Gráfico de dispersão entre tempo_preso e score_periculosidade
if (!dir.exists("figuras")) dir.create("figuras")

grafico_disp <- ggplot(df, aes(x = tempo_preso, y = score_periculosidade)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE) +
  labs(title = "Dispersão: Tempo Preso x Score de Periculosidade",
       x = "Tempo Preso (meses)", y = "Score de Periculosidade") +
  theme_minimal()

ggsave("figuras/dispersao_tempo_score.png", grafico_disp, width = 7, height = 5)

# 5) Correlação
correlacao <- cor(df$tempo_preso, df$score_periculosidade, use = "complete.obs")
cat("Correlação entre tempo_preso e score_periculosidade:", correlacao, "\n")

# 6) Variância, desvio padrão e amplitude
dispersao <- data.frame(
  variavel = variaveis,
  variancia = sapply(df[variaveis], function(x) var(x, na.rm = TRUE)),
  desvio_padrao = sapply(df[variaveis], function(x) sd(x, na.rm = TRUE)),
  amplitude = sapply(df[variaveis], function(x) diff(range(x, na.rm = TRUE)))
)

print("Medidas de dispersão:")
print(dispersao)
write.csv(dispersao, "medidas_dispersao.csv", row.names = FALSE)

cat("Análise exploratória concluída.\n")
