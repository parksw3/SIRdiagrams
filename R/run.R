##' run models
##' 
##' @export
run_model <- function(model=SIRmodel,
                parms=c(mu=0, beta=2, gamma=1),
                yini=c(S=0.999, I=0.001, R=0),
                tvec=seq(0, 20, by=0.1)) {
  
  out <- as.data.frame(ode(y=yini, time=tvec, func=model, parms=parms))
  
  out
}
