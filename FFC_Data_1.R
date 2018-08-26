install.packages('Quandl')
library(Quandl)

get_symbols <- function(symbol='FF', start=201512, end = 201702){
  months<- unlist(strsplit('FGHJKMNQUVXZ', split = ""))
  start_m <- start%%100
  end_m <- end%%100
  # use loop to avoid sorting
  tmp = ""
  for (y in (start%/%100):(end%/%100)){
    tmp <- c(tmp, paste0(symbol,months,y))
  }
  tmp[(start_m + 1) : (length(tmp)-(12-end_m))]
}
FF_list <- get_symbols()

#data_FF <- Quandl("CME/FFZ2018", type = "zoo")

#sapply(1:length(FF_list), function(x){ paste0('CME/', FF_list[x]) }) 
tmp <- sapply(1:length(FF_list), function(x){ 
  Quandl( paste0('CME/', FF_list[x]), type = "xts") 
  } )
names(tmp) <- FF_list

list2env(tmp, environment()) #;ls()
ls()
# str(FFF2016); tail(FFF2016,3); plot(FFF2016$Volume)

code_list <- c('DFF','DFEDTARU','DFEDTARL')
series_list <- function(dataset, series){
  paste0(dataset, '/', series)
}
tmp2 <- series_list('FRED', code_list)
tmp2 <- lapply(1:length(tmp2), function(x){ Quandl(tmp2[x], type = "zoo", 
                                                   start_date="2015-01-31") } )
names(tmp2) <- code_list
str(tmp2)

list2env(tmp2, environment()) #;ls()
#head(DFF); spec_date_1 <- '2018-07-28'

