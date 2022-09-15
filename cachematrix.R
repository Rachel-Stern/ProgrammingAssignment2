## These two functions can be used together to cache the inverse of a matrix and then
## retrieve the inverse from the cache.

##This function will make a special "matrix" which is actullay a list containing the 
##following functions:
##set()
##get()
##setinverse()
##getinverse()
makeCacheMatrix <- function(x = matrix()) {
    cm<-NULL
    set<-function(y){
            x<<-y
            cm<<-NULL
    }
    get<-function() x
    setinverse<-function(inverse)cm<<-inverse
    getinverse<-function()cm
    list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## This function will compute the inverse of the special "matrix" and if the inverse has 
##already been calculated, then it will retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv<-x$getinverse()
    if(!is.null(inv)){
            message("Getting cached data")
            return(inv)
            }
     data<-x$get()
     inv<-solve(data,...)
     x$setinvers(inv)
     inv
}
