library(readxl)
df_SCFA <- read_excel("SCFA_stool.xlsx")
df_SCFA <- as.data.frame(df_SCFA)

names(df_SCFA) <- c("Sample", "acetate", "propionate", "isobutyrate", "butyrate")

df_SCFA_HD <- df_SCFA[  c(1:12), ]
df_SCFA_CB <- df_SCFA[ - c(1:12), ]

##
  
df_out <- df_SCFA_CB[ , c(1,2)]

a <- boxplot(df_out$acetate)

a$out

df_SCFA_CB$acetate[which(df_SCFA_CB$acetate %in% a$out)] <- NA

##

df_out <- df_SCFA_CB[ , c(1,3)]

a <- boxplot(df_out$propionate)

a$out

df_SCFA_CB$propionate[which(df_SCFA_CB$propionate %in% a$out)] <- NA

##

df_out <- df_SCFA_CB[ , c(1,4)]

a <- boxplot(df_out$isobutyrate)

a$out

df_SCFA_CB$isobutyrate[which(df_SCFA_CB$isobutyrate %in% a$out)] <- NA

##

df_out <- df_SCFA_CB[ , c(1,5)]

a <- boxplot(df_out$butyrate)

a$out

df_SCFA_CB$butyrate[which(df_SCFA_CB$butyrate %in% a$out)] <- NA


### all

df_SCFA_clean <- rbind(df_SCFA_HD, df_SCFA_CB)

saveRDS(df_SCFA_clean, "df_SCFA_clean.rds")






