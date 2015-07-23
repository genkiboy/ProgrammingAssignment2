## Below are two functions that are used to create a special object
## that stores a numeric matrix and caches its inverse.

## Write a short comment describing this function
## The first function, `makeCacheMatrix` creates a special "matrix",
## which is really a list containing a function to
## 
##   1.  set the value of the matrix
##   2.  get the value of the matrix
##   3.  set the value of the matrix inverse
##   4.  get the value of the matrix inverse

makeCacheMatrix <- function(x = matrix()) {
        # check whether matrix is square; error msg if not
        if (nrow(x) != ncol(x)) stop('This is not a square matrix! \n\n')
        
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setInv <- function(Inv) m <<- Inv
        getInv <- function() m
        list(set = set, get = get,
             setInv = setInv,
             getInv = getInv)
}


## The following function calculates the inverse of the special "matrix"
## created with the above function. However, it first checks to see if the
## inverse has already been calculated. If so, it `get`s the inverse from
## the cache and skips the computation. Otherwise, it calculates the
## inverse of the matrix and sets the value of the inverse in the cache
# via the `setInverse` function.

cacheSolve <- function(x, ...) {
        m <- x$getInv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        ident <- diag(ncol(data))
        m <- solve(data, ident, ...)
        x$setInv(m)
        m
}
