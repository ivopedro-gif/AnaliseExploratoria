

# 0) Instalar / carregar pacotes necessários
if (!require("readxl")) install.packages("readxl", repos="https://cloud.r-project.org"); library(readxl)
if (!require("dplyr")) install.packages("dplyr", repos="https://cloud.r-project.org"); library(dplyr)
if (!require("ggplot2")) install.packages("ggplot2", repos="https://cloud.r-project.org"); library(ggplot2)

# 1) Importar a base
df <- readxl::read_excel("Base_trabalho.xlsx")

# 2) Transformar variáveis qualitativas em fatores (com rótulos)
# De acordo com o dicionário:
# sexo: 1 = Masculino, 0 = Feminino
# filhos: 1 = Sim, 0 = Não
# escolaridade: 1 = Fundamental, 2 = Médio, 3 = Superior (assumido pelo dicionário)
# casado: 1 = Sim, 0 = Não
# reincidente: 1 = Sim, 0 = Não




df <- df %>%
  mutate(
    sexo = factor(sexo, levels = c(0,1), labels = c("Feminino","Masculino")),
    filhos = factor(filhos, levels = c(0,1), labels = c("Nao","Sim")),
    escolaridade = factor(escolaridade, levels = c(1,2,3), labels = c("Fundamental","Medio","Superior")),
    casado = factor(casado, levels = c(0,1), labels = c("Nao","Sim")),
    reincidente = factor(reincidente, levels = c(0,1), labels = c("Nao","Sim"))
  )

# 3) Análise sobre dados faltantes
# Mostrar contagem de NA por variável
na_contagem <- sapply(df, function(x) sum(is.na(x)))
print("Contagem de valores ausentes por variável:")
print(na_contagem)

# Salvar relatório simples de faltantes
write.csv(data.frame(variavel = names(na_contagem), faltantes = as.integer(na_contagem)),
          file = "relatorio_faltantes.csv", row.names = FALSE)

# Criar pasta para figuras, se não existir
if (!dir.exists("figuras")) dir.create("figuras")

# 4) Histograma da variável idade
p1 <- ggplot(df, aes(x = idade)) +
  geom_histogram(binwidth = 5, fill = NA, color = "black") +
  labs(title = "Histograma da Idade", x = "Idade (anos)", y = "Frequência") +
  theme_minimal()
ggsave("figuras/histograma_idade.png", p1, width = 7, height = 5)

# 5) Boxplot da variável tempo_preso
p2 <- ggplot(df, aes(y = tempo_preso)) +
  geom_boxplot(outlier.shape = 16) +
  labs(title = "Boxplot do Tempo Preso", y = "Tempo preso (meses)") +
  theme_minimal()
ggsave("figuras/boxplot_tempo_preso.png", p2, width = 5, height = 5)

# 6) Boxplot do score_periculosidade por escolaridade
p3 <- ggplot(df, aes(x = escolaridade, y = score_periculosidade)) +
  geom_boxplot() +
  labs(title = "Score de Periculosidade por Escolaridade", x = "Escolaridade", y = "Score de Periculosidade") +
  theme_minimal()
ggsave("figuras/boxplot_score_por_escolaridade.png", p3, width = 7, height = 5)

# 7) Gráfico de barras para reincidente
p4 <- ggplot(df, aes(x = reincidente)) +
  geom_bar() +
  labs(title = "Frequência de Reincidência", x = "Reincidente", y = "Contagem") +
  theme_minimal()
ggsave("figuras/barplot_reincidente.png", p4, width = 5, height = 5)

# Mensagem final
cat("Análises gráficas concluídas. Figuras salvas na pasta 'figuras'. Relatório de faltantes: relatorio_faltantes.csv\n")
