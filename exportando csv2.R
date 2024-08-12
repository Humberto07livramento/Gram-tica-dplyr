library(readr)
MPOX_CSV2_EXEMPLO <- read_delim("D:/opas R/MPOX_CSV2_EXEMPLO.csv", 
                                delim = ";", escape_double = FALSE, col_types = cols(NU_NOTIFIC = col_character(), 
                                                                                     DT_NOTIFIC = col_date(format = "%d/%m/%Y"), 
                                                                                     NU_IDADE_N = col_date(format = "%d/%m/%Y")), 
                                trim_ws = TRUE)
View(MPOX_CSV2_EXEMPLO)
