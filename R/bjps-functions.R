## Update plotting theme for ggplot2
plotTheme <- function(base_size = 10, base_family = "serif"){
  theme_bw(base_size = base_size, base_family = base_family) %+replace%
  theme(panel.grid.minor = element_blank(), 
    panel.grid.major = element_blank(), 
    panel.border = element_blank(), 
    panel.background = element_blank(), 
    axis.line = element_line(colour = "grey30"), 
    axis.ticks = element_line(colour = "grey30"), 
    axis.ticks.length = unit(0.5,"cm"), 
    axis.title.x = element_text(vjust = -1.5), 
    axis.title.y = element_text(vjust = 0.4, 
      hjust = 0.5, angle = 90), 
    title = element_text(vjust = 2), plot.margin = unit(c(1,1,1,0.7), "cm")     )
}

## Standard errors on predicted values from lme4, random-effects ignored
## Function source: Ben Bolker, http://rpubs.com/bbolker/glmmchapter
easyPredCI <- function(model, newdata, alpha=0.05) {
  pred0 <- predict(model, re.form = NA, newdata = newdata)
  X <- model.matrix(formula(model, fixed.only = TRUE)[-2], newdata)
  beta <- fixef(model)
  V <- vcov(model)
  pred.se <- sqrt(diag(X %*% V %*% t(X)))
  linkinv <- model@resp$family$linkinv
  crit <- -qnorm(alpha/2)
  linkinv(cbind(lwr = pred0 - crit*pred.se, upr = pred0 + crit*pred.se))
}

## Install multiple packages
## Code edited from: https://gist.github.com/stevenworthington/3178163
# ipak function: install and load multiple R packages.
# check to see if packages are installed. Install them if they are not, then load them into the R session.
options(repos=structure(c(CRAN="http://cran.stat.auckland.ac.nz/"))) 
iPak <- function(pkg){
    new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
    if (length(new.pkg)) 
        install.packages(new.pkg, dependencies = TRUE)
    sapply(pkg, library, character.only = TRUE)
}