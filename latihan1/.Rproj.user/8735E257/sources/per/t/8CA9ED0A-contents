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


# Preprocessing teks
# Membuat corpus (kumoulab dokumen) dari data teks
corpus <- Corpus(VectorSource(df$message))

# Mengubah teks menjadi huruf kecil
corpus <- tm_map(corpus, content_transformer(tolower))

# Menghapus tanda baca dan angka
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)

# Menghapus stopwords (kata-kata yang tidak memiliki makna penting)
corpus <- tm_map(corpus, removeWords, stopwords("en"))

# Menghapus whitespace ekstra
corpus <- tm_map(corpus, stripWhitespace)

# Mengubah teks menjadi matriks dokumen-term (DTM)
dtm <- DocumentTermMatrix(corpus)



# Mengonversi DTM ke data frame

dtm_matrix <- as.data.frame(as.matrix(dtm))

# Menambahkan label ke data frame
dtm_matrix$label <- as.factor(df$label)



# Membagi data menjadi 80% data latih dan 20% data uji

set.seed(123)  # Untuk memastikan hasil yang konsisten
trainIndex <- createDataPartition(dtm_matrix$label, p = 0.8, list = FALSE)

train_data <- dtm_matrix[trainIndex, ]
test_data <- dtm_matrix[-trainIndex, ]


# Membangun model SVM

svm_model <- svm(label ~ ., data = train_data, kernel = "linear")

# Melihat ringkasan model
summary(svm_model)


# Prediksi menggunakan data uji

predictions <- predict(svm_model, test_data)

# Menghitung akurasi
confusionMatrix(predictions, test_data$label)


# Preprocessing untuk newMessage
newMessage <- "hello nice to meet you"

# Preprocessing teks
corpus_new <- Corpus(VectorSource(newMessage))
corpus_new <- tm_map(corpus_new, content_transformer(tolower))
corpus_new <- tm_map(corpus_new, removePunctuation)
corpus_new <- tm_map(corpus_new, removeNumbers)
corpus_new <- tm_map(corpus_new, removeWords, stopwords("en"))
corpus_new <- tm_map(corpus_new, stripWhitespace)

# Mengubah menjadi matriks dokumen-term
dtm_new <- DocumentTermMatrix(corpus_new, control = list(dictionary = Terms(dtm)))

# Mengonversi DTM menjadi matriks dan prediksi
dtm_new_matrix <- as.data.frame(as.matrix(dtm_new))
prediction_new <- predict(svm_model, dtm_new_matrix)

# Menampilkan hasil prediksi
print(prediction_new)



