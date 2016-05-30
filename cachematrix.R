## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse.It returns a list of functions

makeCacheMatrix <- function(x = matrix()) {
  ## Initialize the inverse matrix
  inverseMatrix<-NULL
  
  ## Method to set the matrix
  set<-function(y){
    x<<-y
    inverseMatrix<<-NULL
  }
  ## Method the get the matrix
  get <- function() {
    ## Return the matrix
    x
  }
  ## Method to set the inverse of the matrix
  setInverse <- function(inverse) {
    inverseMatrix <<- inverse
  }
  ## Method to get the inverse of the matrix
  getInverse <- function() {
    ## Return the inverse property
    inverseMatrix
  }
  ## Return a list of the methods
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
}


## This function computes the inverse of the special "matrix" returned by
## makeCacheMatrix above. If the inverse has already been calculated (and the
## matrix has not changed), then the cache solve should retrieve the inverse from
## the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  invertedMatrix <- x$getInverse()
  ## Return the inverse if its already set
  if( !is.null(invertedMatrix) ) {
    message("getting cached inverted matrix")
    return(invertedMatrix)
  }
  ## Get the matrix from our object
  matrix <- x$get()
  ## Calculate the inverse using solve() function
  invertedMatrix <- solve(matrix) 
  ## Set the inverse to the object
  x$setInverse(invertedMatrix)
  ## Return the matrix
  invertedMatrix         
  ## Return a matrix that is the inverse of 'x'
}
