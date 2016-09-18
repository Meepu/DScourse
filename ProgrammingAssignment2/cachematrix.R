## Usage:
## m <- makeCacheMatrix(invertible_matrix)
## solveCache(m)

## Create tools for saving and inversing a matrix
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  # Use solve() to inverse
  setinverse <- function(solve) i <<- solve
  getinverse <- function() i
  list(set = set, get = get, setinverse = setinverse, 
       getinverse = getinverse)
}


## Use cached inverse, if available
## If not availabe, inverse and cache result
cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    return (i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)

  ## Return a matrix that is the inverse of 'x'
  i
}
