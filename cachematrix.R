## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

library(MASS)
makecacheMatrix <- function(x = matrix()) {
  inv<-NULL
  set<-function(y){
    x<<-y
    inv<<-NULL
  }
  get<-function()x
  setinv<-function(inverse)inv<<-inverse
  getinv<-function(){
    inver<-ginv(x)
    inver%*%x
  }
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}



cacheSolve <- function(x, ...)
{
  inv<-x$getinv()
  if(!is.null(inv)) {
    message("getting Cached data!")
    return(inv)
  }
  data<-x$get()
  inv<-solve(data,...)
  x$setinv
  inv
}
