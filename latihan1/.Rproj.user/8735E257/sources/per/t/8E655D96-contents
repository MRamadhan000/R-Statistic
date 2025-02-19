# Muat library
library(readr)
library(tm)
library(e1071)
library(caret)

# Baca data CSV
dev <- read_csv("dev.csv")

# Membuat data frame untuk model
df <- data.frame(
  message = dev$text,
  label = dev$label_sexist
)


# =============== preprocessing data =============

#Membuat corpus (kumppulan dokumen) dari data teks
corpus <- Corpus(VectorSource(df$message))

#mengubah menjadi lowercase
corpus <- tm_map(corpus, content_transformer(tolower))

#menghaous tanda baca dan angka
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)

# Menampilkan 1 hingga 5 dokumen pertama
# inspect(corpus[1:5])

corpus <- tm_map(corpus, removeWords, stopwords("en"))

# inspect(corpus[1:5])

# Menghapus whitespace ekstra
corpus <- tm_map(corpus, stripWhitespace)

#Mengubah teks mejadi dtm
dtm <- DocumentTermMatrix(corpus)
# inspect(dtm[1:5,])

# Mengonversi DTM ke data frame
dtm_matrix <- as.data.frame(as.matrix(dtm))

# Menambahkan label ke data frame
dtm_matrix$label <- as.factor(df$label)

View(dtm_matrix)



