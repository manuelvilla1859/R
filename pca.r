# Requirements
install.packages('factoextra')
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/factoextra")

library(factoextra)
library(ggpubr)
library(ggfortify)

# Example taken from:
browseURL('https://web.archive.org/web/20150501011712/http://people.maths.ox.ac.uk:80/richardsonm/SignalProcPCA.pdf')

# Interesting visualization based on that example:
browseURL('http://setosa.io/ev/principal-component-analysis/')



eg <- c(375, 57, 245, 1472, 105, 54, 193, 147, 1102, 720, 253, 685, 488, 198, 360, 1374, 156)
ni <- c(135, 47, 267, 1494, 66, 41, 209, 93, 674, 1033, 143, 586, 355, 187, 334, 1506, 139)
st <- c(458, 53, 242, 1462, 103, 62, 184, 122, 957, 566, 171, 750, 418, 220, 337, 1572, 147)
wl <- c(475, 73, 227, 1582, 103, 64, 235, 160, 1137, 874, 265, 803, 570, 203, 365, 1256, 175)

gb <- data.frame(eg, ni, st, wl)
gb <- t(gb)
gb

pca_gb <- prcomp(gb)

# library(ggfortify)
autoplot(pca_gb)

pca_gb$sdev
pca_gb$rotation
pca_gb$center
pca_gb$scale
pca_gb$x

fviz_eig(pca_gb)

fviz_pca_ind(pca_gb,
             col.ind = "cos2", # Color by the quality of representation
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)

fviz_pca_var(pca_gb,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)

fviz_pca_biplot(pca_gb, repel = TRUE,
                col.var = "#2E9FDF", # Variables color
                col.ind = "#696969"  # Individuals color
)

# Eigenvalues
eig.val <- get_eigenvalue(pca_gb)
eig.val

# Results for Variables
res.var <- get_pca_var(pca_gb)
res.var$coord          # Coordinates
res.var$contrib        # Contributions to the PCs
res.var$cos2           # Quality of representation 
# Results for individuals
res.ind <- get_pca_ind(pca_gb)
res.ind$coord          # Coordinates
res.ind$contrib        # Contributions to the PCs
res.ind$cos2           # Quality of representation 


rm(eg, ni, st, wl, gb, pca_gb)
