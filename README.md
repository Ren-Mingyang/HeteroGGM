# HeteroGGM

## Note
The HeteroGGM package has been released to version 1.0.1 on CRAN (2023.10), addressing several bugs in the previous version 0.1.0.
The updated 1.1.1 version was released on GitHub in July 2025, which mainly addresses the issue of the noninvertible precision matrix of high-dimensional data in the initialization step.


## Introduction
Gaussian graphical model-based heterogeneity analysis:
Recently, several Gaussian graphical model (GGM)-based heterogeneity analysis techniques have been developed. A common methodological limitation is that the number of subgroups is assumed to be known a priori, which is not realistic. 

In a recent study (Ren et al., 2022), a novel approach based on the penalized fusion technique is developed to fully data-dependently determine the number and structure of subgroups in GGM-based heterogeneity analysis. It opens the door for utilizing 
the GGM technique in more practical settings. The goal of this package is to user-friendly realizing this approach. Beyond Ren et al. (2022), more estimations and functions are added, so that the package is self-contained and more comprehensive and can provide ''more direct'' insights to practitioners (with the visualization function).

Welcome any suggestions and comments on my first R package!


## Publication
Mingyang Ren, Sanguo Zhang, Qingzhao Zhang, Shuangge Ma. (2022). Gaussian Graphical Model-based Heterogeneity Analysis via Penalized Fusion. Biometrics, [https://doi.org/10.1111/biom.13426](https://doi.org/10.1111/biom.13426).

## Maintainer
Mingyang Ren <renmingyang17@mails.ucas.ac.cn>  

## Installation

Method 1: Run the following codes directly in R.
```{r eval=FALSE}
library("devtools")
devtools::install_github("Ren-Mingyang/HeteroGGM")
```
Method 2: Download the HeteroGGM_1.1.1.tar.gz, and install from Package Archive File using RStudio.


## Usage
To make the package more user-friendly, there are detailed help documents and 
vignettes in the package, which can be referred to after the installation.


## Toy example
Call the built-in simulation data set (K0 = 3), and set the upper bound of K0 and the sequences of the tuning parameters.
```{r eval=FALSE}
data(example.data)
K <- 6
lambda <- genelambda.obo(nlambda1=5,lambda1_max=0.5,lambda1_min=0.1,
                         nlambda2=15,lambda2_max=1.5,lambda2_min=0.1,
                         nlambda3=10,lambda3_max=3.5,lambda3_min=0.5)
```

Apply GGMPF to the data.
```{r eval=FALSE}
res <- GGMPF(lambda, example.data$data, K, penalty = "MCP")
Theta_hat.list <- res$Theta_hat.list
Mu_hat.list <- res$Mu_hat.list
opt_num <- res$Opt_num
opt_Mu_hat <- Mu_hat.list[[opt_num]]
opt_Theta_hat <- Theta_hat.list[[opt_num]]
K_hat <- dim(opt_Theta_hat)[3]
K_hat  # Output the estimated K0.
```

Summarize the characteristics of the resulting network structures, and implement visualization of network structures.
```{r eval=FALSE}
summ <- summary_network(opt_Mu_hat, opt_Theta_hat, example.data$data)
summ$Theta_summary$overlap
va_names <- c("6")
linked_node_names(summ, va_names, num_subgroup=1)
plot_network(summ, num_subgroup = c(1:K_hat), plot.mfrow=c(1,K_hat))
```
The algorithm is efficient, and it takes less than five minutes for the toy example.

