## Notes on matrices and their inverses

## assume that only square matrices have inverses

xm <- matrix(1:9, 3, 3)
xm
#       [,1] [,2] [,3]
# [1,]    1    4    7
# [2,]    2    5    8
# [3,]    3    6    9


## lets check for squareness, hmmm?
test <- nrow(xm) == ncol(xm)
test
# [1] TRUE


## now lets make an Identity matrix!
xmI <- diag(nrow(xm))
xmI
#       [,1] [,2] [,3]
# [1,]    1    0    0
# [2,]    0    1    0
# [3,]    0    0    1

## and the equqtion below will calculate the inverse of xm...
xmInv <- solve(xm, xmI)
# Error in solve.default(xm, xmI) : 
#         Lapack routine dgesv: system is exactly singular: U[3,3] = 0
## or not--oops! silly me, making a singular matrix and expecting it
##  to have an inverse...


xm <- matrix(c(1,2,7,4,9,3,8,3,4),3,3)
xm
#       [,1] [,2] [,3]
# [1,]    1    4    8
# [2,]    2    9    3
# [3,]    7    3    4


xmInv <- solve(xm, xmI)
xmInv
#       [,1]        [,2]        [,3]
# [1,] -0.07161804 -0.02122016  0.15915119
# [2,] -0.03448276  0.13793103 -0.03448276
# [3,]  0.15119363 -0.06631300 -0.00265252

## squee!