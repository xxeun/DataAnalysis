library(wordcloud)
library(pdftools)
library(stringr)
#pdf저장
bill_text<-pdf_text("Bill_Skarsgard.pdf")
bill_text<-tolower(bill_text)
bill_text_sent<-strsplit(unlist(bill_text),split="\\. ")
bill_text_word<-strsplit(unlist(bill_text_sent), split = " ")
bill_text_word<-strsplit(unlist(bill_text_word), split="the")
bill_text_word<-strsplit(unlist(bill_text_word), split="and")
bill_text_word<-strsplit(unlist(bill_text_word), split="in")
bill_text_word<-unlist(bill_text_word)

bill_text_word_content<-bill_text_word[nchar(bill_text_word)>0]
which(str_detect(bill_text_word_content, "references"))

bill_text_word_content<-bill_text_word_content[1:687]

bill_text_word_freq<-sort(table(bill_text_word_content), decreasing = TRUE)
bill_text_word_freq[1:50]

#wordcloud
wordcloud(words = names(bill_text_word_freq),
          freq = bill_text_word_freq,
          random.order = FALSE,
          min.freq = 5,
          scale = c(4,0,3))


