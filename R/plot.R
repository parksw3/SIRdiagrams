##' plot simulations
##' 
##' @export
plot_sim <- function(out,
                     vars=c("S", "I", "R"),
                     ylim,
                     deltat=1,
                     tunit="(week)") {
  if (missing(ylim)) ylim <- c(0, 1)
  
  out_gather <- out %>%
    gather(key, value, -time) %>%
    filter(
      key %in% vars
    ) %>%
    mutate(
      key=factor(key, levels=vars)
    )
  
  ggplot(out_gather) +
    geom_line(aes(time/deltat, value, col=key), lwd=1) +
    scale_x_continuous(paste0("Time ", tunit), expand=c(0, 0)) +
    scale_y_continuous("Proportion", limits=ylim, expand=c(0, 0)) +
    theme_bw() +
    theme(
      panel.grid = element_blank(),
      panel.border = element_blank(),
      axis.line = element_line(),
      legend.title = element_blank(),
      legend.position = "top"
    )  
}
