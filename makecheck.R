
library("devtools")
library(roxygen2)
setwd("~/code")

setwd("pcapred.largedata")
document()
check()

## Make distributable packages
setwd("~/code")
system("rm -f pcapred.largedata.tar.gz")
system("tar --exclude=.git -czvf pcapred.largedata.tar.gz pcapred.largedata")
install.packages("pcapred.largedata.tar.gz",repos = NULL, type="source")
