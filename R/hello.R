#' Hello Function
#'
#' @param name - Name to insert, character type.
#'
#' @return - Print message based on the input.
#' @export
#'
#' @examples hello('Filipe')
hello <- function(name) {
    if(is.character(name)){
        print(paste('Hello',name,'!'))
    }else{
        warning('The input is not a character, try again')

    }

}
