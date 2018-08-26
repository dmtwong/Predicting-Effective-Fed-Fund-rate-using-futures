search_function <- function(spec_date){
  y_tmp <- substr(spec_date, 1, 4)
  m_tmp <- substr(spec_date, 6, 7)
  d_tmp <- substr(spec_date, 9, 10)
  return(as.integer(c(y_tmp, m_tmp, d_tmp)))
}

# tmp3 <- search_function('2018-07-28')
# tmp3
