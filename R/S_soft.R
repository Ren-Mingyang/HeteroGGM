S_soft <- function(z,lambda){

  ## -----------------------------------------------------------------------------------------------------------------
  ## The name of the function: S_soft
  ## -----------------------------------------------------------------------------------------------------------------
  ## Description:
  ##            Define the soft threshold operator.
  ## -----------------------------------------------------------------------------------------------------------------
  ## Required preceding functions or packages: No
  ## -----------------------------------------------------------------------------------------------------------------
  ## Input:
  ## @ z: a float value or a vector, the independent variable.
  ## @ lambda: a float value, the tuning parameter.
  ## -----------------------------------------------------------------------------------------------------------------
  ## Output:
  ## @ The result of the soft threshold operator.
  ## -----------------------------------------------------------------------------------------------------------------

  return((abs(z) - lambda)*(abs(z) - lambda > 0)*sign(z))
}
