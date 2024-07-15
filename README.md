This repository contains a set of Octave functions and a script to demonstrate their functionality as part of a physics assignments The functions are designed to calculate the condition number of a matrix, solve a system of linear equations using Gaussian elimination, and plot the error norm versus condition number.
Contents
- `condm.m`: Calculates the condition number of a matrix using a specified norm.
- `elim_gausspt.m`: Solves a system of linear equations using Gaussian elimination with partial pivoting.
- `efb23.m`: Demonstrates the functionality of the previous functions by generating matrices and solving linear systems, then plotting the results.
Function Details
1. `condm.m`
This function calculates the condition number of a given matrix `A` using the norm `||.||_p`, where `p` can be `1` or `inf` (represented in Octave by the value `inf`). If `p` is not one of these values, the function returns an empty matrix `c = []`.
Usage
```octave
c = condm(A, p)
```
2. `elim_gausspt.m`
This function solves a system of linear equations `Ax = b` using Gaussian elimination with partial pivoting and a specified tolerance `tol`. If matrix `A` is considered singular, the function prints a message "Matrix A is singular!" and returns `x = []`.
Usage
```octave
x = elim_gausspt(A, b, tol)
```
3. `efb23.m`
This script demonstrates the functionality of the `condm` and `elim_gausspt` functions. It creates a 15x15 matrix `A` and a 15x1 vector `b` with elements uniformly distributed in the interval [-1, 1]. The script then progressively approximates matrix `A` to a singular matrix, solves the system `Ax = b`, and plots the error norm versus condition number.
Usage
Run the script directly in Octave:
```octave
efb23
```
