library(corrplot)

data <- read.csv("/Users/vishwali/Documents/GitHub/India-lockdown-impact/results/causal_impact/effects_all.csv")
#data[is.nan(data)] <- 0

M = cor(data,method = 'spearman')
testRes = cor.mtest(data, method='spearman', conf.level = 0.95)
pdf("/Users/vishwali/Documents/GitHub/India-lockdown-impact/results/causal_impact/correlation_plot.pdf")
correlation_plot <- corrplot(M, p.mat = testRes$p, method = 'color', diag = FALSE, type = 'upper',
         sig.level = c(0.001, 0.01, 0.05), pch.cex = 1, 
         insig = 'label_sig', pch.col = 'red', tl.col="black",tl.cex = 0.9)
dev.off() 
