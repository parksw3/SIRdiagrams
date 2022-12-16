##' SIR model
##' 
##' @export
SIRmodel <- function(t, y, parms) {
  with(as.list(c(parms, y)), {
    dS <- mu - beta * S * I - mu * S
    dI <- beta * S * I - gamma * I - mu * I
    dR <- gamma * I - mu * R
    list(c(dS, dI, dR))
  })
}

##' seasonal SIR model
##' 
##' @export
seasonalSIRmodel <- function(t, y, parms) {
  with(as.list(c(parms, y)), {
    beta <- beta0 * (1 + theta * cos(2 * pi * t/52))
    
    dS <- mu - beta * S * I - mu * S
    dI <- beta * S * I - gamma * I - mu * I
    dR <- gamma * I - mu * R
    list(c(dS, dI, dR))
  })
}
