# Storage repo for plot scripts removed from the appendices


# A25 Codes ---------------------------------------------------------------

corrplot(cor.e, diag = FALSE, order="hclust", method="square", tl.col="black",
         addrect = 6, tl.cex = 0.45, title = "Log escapement", mar=c(0,0,3,0))
corrplot(cor.s, diag = FALSE, order="hclust", method="square", tl.col="black",
         addrect = 6, tl.cex = 0.45, title = "Standardized escapement", mar=c(0,0,3,0))
corrplot(cor.m, diag = FALSE, order="hclust", method="square", tl.col="black",
         addrect = 6, tl.cex = 0.45, title = "Moving average", mar=c(0,0,3,0))
corrplot(cor.rps, diag = FALSE, order="hclust", method="square", tl.col="black",
         addrect = 6, tl.cex = 0.45, title = "RPS", mar=c(0,0,3,0))

clust.dist.cor.e[["labels"]] <- str_to_sentence(word(clust.dist.cor.e[["labels"]]))
dende <- as.dendrogram(clust.dist.cor.e)
dende %>%
  set("labels_colors", elabs) %>%
  plot(main = "Log escapement", horiz = TRUE)

clust.dist.cor.s[["labels"]] <- str_to_sentence(word(clust.dist.cor.s[["labels"]]))
dends <- as.dendrogram(clust.dist.cor.s)
dends %>%
  set("labels_colors", slabs) %>%
  plot(main = "Standardized escapement", horiz = TRUE)

clust.dist.cor.m[["labels"]] <- str_to_sentence(word(clust.dist.cor.m[["labels"]]))
dendm <- as.dendrogram(clust.dist.cor.m)
dendm %>%
  set("labels_colors", mlabs) %>%
  plot(main = "Moving average", horiz = TRUE)

clust.dist.cor.rps[["labels"]] <- str_to_sentence(word(clust.dist.cor.rps[["labels"]]))
dendrps <- as.dendrogram(clust.dist.cor.rps)
dendrps %>%
  set("labels_colors", rpslabs) %>%
  plot(main = "RPS", horiz = TRUE)

tangle1 <- dendlist(dendz, dende)
tanglegram(tangle1, lab.cex = .8, margin_inner = 3, main_left = "Z-score",
           main_right = "Log escapement", cex_main = 1, highlight_distinct_edges = FALSE,
           lwd = 2, edge.lwd = 1)
tangle3 <- dendlist(dendz, dendm)
tanglegram(tangle3, lab.cex = .8, margin_inner = 3, main_left = "Z-score",
           main_right = "Moving average", cex_main = 1, highlight_distinct_edges = FALSE,
           lwd = 2, edge.lwd = 1)

# A08 Codes ---------------------------------------------------------------

corrplot(cor.e, diag = FALSE, order="hclust", method="square", tl.col="black",
         addrect = 6, tl.cex = 0.45, title = "Log escapement", mar=c(0,0,3,0))
corrplot(cor.s, diag = FALSE, order="hclust", method="square", tl.col="black",
         addrect = 6, tl.cex = 0.45, title = "Standardized escapement", mar=c(0,0,3,0))
corrplot(cor.m, diag = FALSE, order="hclust", method="square", tl.col="black",
         addrect = 6, tl.cex = 0.45, title = "Moving average", mar=c(0,0,3,0))
corrplot(cor.rps, diag = FALSE, order="hclust", method="square", tl.col="black",
         addrect = 6, tl.cex = 0.45, title = "RPS", mar=c(0,0,3,0))

clust.dist.cor.e[["labels"]] <- str_to_sentence(word(clust.dist.cor.e[["labels"]]))
dende <- as.dendrogram(clust.dist.cor.e)
dende %>%
  set("labels_colors", elabs) %>%
  plot(main = "Log escapement", horiz = TRUE)

clust.dist.cor.s[["labels"]] <- str_to_sentence(word(clust.dist.cor.s[["labels"]]))
dends <- as.dendrogram(clust.dist.cor.s)
dends %>%
  set("labels_colors", slabs) %>%
  plot(main = "Standardized escapement", horiz = TRUE)

clust.dist.cor.m[["labels"]] <- str_to_sentence(word(clust.dist.cor.m[["labels"]]))
dendm <- as.dendrogram(clust.dist.cor.m)
dendm %>%
  set("labels_colors", mlabs) %>%
  plot(main = "Moving average", horiz = TRUE)

clust.dist.cor.rps[["labels"]] <- str_to_sentence(word(clust.dist.cor.rps[["labels"]]))
dendrps <- as.dendrogram(clust.dist.cor.rps)
dendrps %>%
  set("labels_colors", rpslabs) %>%
  plot(main = "RPS", horiz = TRUE)

tangle1 <- dendlist(dendz, dende)

tanglegram(tangle1, lab.cex = .8, margin_inner = 3, main_left = "Z-score",
           main_right = "Log escapement", cex_main = 1, highlight_distinct_edges = FALSE,
           lwd = 2, edge.lwd = 1)
tangle3 <- dendlist(dendz, dendm)

tanglegram(tangle3, lab.cex = .8, margin_inner = 3, main_left = "Z-score",
           main_right = "Moving average", cex_main = 1, highlight_distinct_edges = FALSE,
           lwd = 2, edge.lwd = 1)


# A06 Codes ---------------------------------------------------------------

corrplot(cor.e, diag = FALSE, order="hclust", method="square", tl.col="black",
         addrect = 6, tl.cex = 0.45, title = "Log escapement", mar=c(0,0,3,0))
corrplot(cor.s, diag = FALSE, order="hclust", method="square", tl.col="black",
         addrect = 6, tl.cex = 0.45, title = "Standardized escapement", mar=c(0,0,3,0))
corrplot(cor.m, diag = FALSE, order="hclust", method="square", tl.col="black",
         addrect = 6, tl.cex = 0.45,title = "Moving average", mar=c(0,0,3,0))
corrplot(cor.rps, diag = FALSE, order="hclust", method="square", tl.col="black",
         addrect = 6, tl.cex = 0.45, title = "RPS", mar=c(0,0,3,0))

clust.dist.cor.e[["labels"]] <- str_to_sentence(word(clust.dist.cor.e[["labels"]]))
dende <- as.dendrogram(clust.dist.cor.e)
dende %>%
  set("labels_colors", elabs) %>%
  plot(main = "Log escapement", horiz = TRUE)

clust.dist.cor.s[["labels"]] <- str_to_sentence(word(clust.dist.cor.s[["labels"]]))
dends <- as.dendrogram(clust.dist.cor.s)
dends %>%
  set("labels_colors", slabs) %>%
  plot(main = "Standardized escapement", horiz = TRUE)

clust.dist.cor.m[["labels"]] <- str_to_sentence(word(clust.dist.cor.m[["labels"]]))
dendm <- as.dendrogram(clust.dist.cor.m)
dendm %>%
  set("labels_colors", mlabs) %>%
  plot(main = "Moving average", horiz = TRUE)

clust.dist.cor.rps[["labels"]] <- str_to_sentence(word(clust.dist.cor.rps[["labels"]]))
dendrps <- as.dendrogram(clust.dist.cor.rps)
dendrps %>%
  set("labels_colors", rpslabs) %>%
  plot(main = "RPS", horiz = TRUE)

tangle1 <- dendlist(dendz, dende)

tanglegram(tangle1, lab.cex = .8, margin_inner = 3, main_left = "Z-score",
           main_right = "Log escapement", cex_main = 1, highlight_distinct_edges = FALSE,
           lwd = 2, edge.lwd = 1)
tangle3 <- dendlist(dendz, dendm)

tanglegram(tangle3, lab.cex = .8, margin_inner = 3, main_left = "Z-score",
           main_right = "Moving average", cex_main = 1, highlight_distinct_edges = FALSE,
           lwd = 2, edge.lwd = 1)
