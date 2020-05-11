#' @title UK Biobank reference data for 100 PCs
#' @description
#' The extdata directory contains three files with the file root \code{ukb_pca_100} that are read together with the \code{\link[pcapred]{readreference}} command. This function gets their location on your system.
#'
#' @return A character string to be passed to \code{\link[pcapred]{readreference}} as the file name.
#'
#' @keywords datasets
#'
#' @export
ukb_pcs_100=function(){
    tfile=gsub(".load.gz","",system.file("extdata","ukb_pcs_100.load.gz",package="pcapred.largedata"))
    tfile
}

#' @title UK Biobank reference data for 200 PCs
#' @description
#' The extdata directory contains three files with the file root \code{ukb_pca_100} that are read together with the \code{\link[pcapred]{readreference}} command. This function gets their location on your system.
#'
#' NOTE: the data are actually split across two files for distribution and are pasted together for first use.
#'
#' @return A character string to be passed to \code{\link[pcapred]{readreference}} as the file name.
#'
#' @keywords datasets
#'
#' @export
ukb_pcs_200=function(){
    tfile=gsub(".load.gz","",system.file("extdata","ukb_pcs_200.load.gz",package="pcapred.largedata"))
    if(tfile==""){
        cat("NOTE: Constructing input file for 200 PCs on first use.\n")
        f1=system.file("extdata","ukb_pcs_100.load.gz",package="pcapred.largedata")
        f2=system.file("extdata","ukb_pcs_101-200.load.gz",package="pcapred.largedata")
        cat("Reading first 100 PCs\n")
        snpweightsraw=data.table::fread(f1,
                                        header=F,skip=0,showProgress=TRUE)
        cat("Reading PCs 101-200\n")
        snpweightsraw2=data.table::fread(f2,
                                         header=F,skip=0,showProgress=TRUE)
        snpweightsrawout=cbind(snpweightsraw,snpweightsraw2)
        tfile=gsub("100.load.gz","200.load.gz",f1)
        cat(paste("Making 200 PCs file:",tfile,"\n"))
        gz1 = gzfile(tfile,"w");
        write.table(snpweightsrawout,file=gz1,quote=FALSE,col.names=FALSE,row.names=FALSE,sep="\t")
        close(gz1)
        cat("Tidying up\n")
        rm(snpweightsraw,snpweightsraw2,snpweightsrawout)
        gc(FALSE)
        tfile=gsub(".load.gz","",system.file("extdata","ukb_pcs_200.load.gz",package="pcapred.largedata"))
    }
    tfile
}
