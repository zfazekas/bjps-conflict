## ---------------------------bjps-replication.R-------------------------------
## Title:     Who is afraid of conflict?
##            Replication script using data supplied by Schuck et al (2014)
## Authors:   Zoltan Fazekas & Erik Gahner Larsen
## Email:     zfa@sam.sdu.dk; egl@sam.sdu.dk
## Paper:     Media content and political behavior in observational research: ##            A critical assessment
## Submitted: May 14, 2014, British Journal of Political Science
## Published: pending
## Doi:       pending
## Data:      Replication materials hosted on BJPS website, supplied by SVdV
## R version: 3.1.0 
## Note:      Script to reproduce results in Sections 2, 3, and SI.A, SI.B
##
## ---------------------------0. Preparation steps-----------------------------
## Loading helper functions
source("bjps-functions.R")
## Packages used
usedPackages <- c("foreign", "lme4", "stargazer", "ggplot2", 
                  "dplyr", "plyr", "arm", "reshape2", "scales", 
                  "grid", "gtable", "xtable", "polycor")
## Function checks whether packages are installed, if not: install
## Otherwise: library(package)
## Require packages separately, if this might interfere with any of
## your curent or other work
iPak(usedPackages)
## Loading data
## Using original file supplied by SVdV, hosted on BJPS website
## For direct download from journal webpage, institutional login/VPN is needed
## (Last) downloaded: 10 May 2014
## Labels not used, country labels cross-referenced from original file
fName <- "../data/"
BJPSORIG <- read.spss(paste0(fName, "S0007123413000525sup001.sav"), 
                      use.value.labels = F, to.data.frame = T) 
## In the original data file, there are 75 rows that are completely missing
## We drop them here, though all results are identical without this step
## Subtracting one from the column number, as new variable is created
BJPSORIG$allMissing <- apply(BJPSORIG, 1, function(x) sum(is.na(x)))
BJPSORIG <- dplyr::filter(BJPSORIG, allMissing != (dim(BJPSORIG)[2] - 1))
BJPSORIG$allMissing <- NULL
## Adding country labels
BJPSORIG$countryStr <- "UK"
BJPSORIG$countryStr[BJPSORIG$country == 3] <- "FR"
BJPSORIG$countryStr[BJPSORIG$country == 4] <- "IT"
BJPSORIG$countryStr[BJPSORIG$country == 5] <- "DE"
BJPSORIG$countryStr[BJPSORIG$country == 6] <- "SPA"
BJPSORIG$countryStr[BJPSORIG$country == 7] <- "SWE"
BJPSORIG$countryStr[BJPSORIG$country == 8] <- "DK"
BJPSORIG$countryStr[BJPSORIG$country == 10] <- "GRE"
BJPSORIG$countryStr[BJPSORIG$country == 11] <- "HU"
BJPSORIG$countryStr[BJPSORIG$country == 12] <- "CZ"
BJPSORIG$countryStr[BJPSORIG$country == 13] <- "PL"
BJPSORIG$countryStr[BJPSORIG$country == 18] <- "IRE"
BJPSORIG$countryStr[BJPSORIG$country == 22] <- "AT"
BJPSORIG$countryStr[BJPSORIG$country == 31] <- "PT"
BJPSORIG$countryStr[BJPSORIG$country == 37] <- "BE"
BJPSORIG$countryStr[BJPSORIG$country == 38] <- "NL"
BJPSORIG$countryStr[BJPSORIG$country == 41] <- "FI"
BJPSORIG$countryStr[BJPSORIG$country == 45] <- "LIT"
BJPSORIG$countryStr[BJPSORIG$country == 46] <- "LAT"
BJPSORIG$countryStr[BJPSORIG$country == 47] <- "SVK"
BJPSORIG$countryStr[BJPSORIG$country == 95] <- "BG"
## Example print-out of Bulgaria issue
head(dplyr::filter(BJPSORIG, countryStr == "BG"))
## Merging issue appears for:
##          - qage
##          - directcontact
##          - indirectcontact
## 2 entries for each individual, first row contains most data
## For problematic variables, second row contains the values
## Creating a corrected dataset
BJPSNEW <- dplyr::filter(BJPSORIG, countryStr != "BG") ## new data without BG
BULG <- dplyr::filter(BJPSORIG, countryStr == "BG") ## BG only
probVars <- c("qage", "directcontact", "indirectcontact")
## Select 1, 3, 5, etc rows from full BG data
## Select 2, 4, 6, etc rows from BG, problematic variables only
BULG <- cbind(BULG[c(T, F), ], 
              BULG[c(F, T), probVars])
newVars <- paste0(probVars, "Correct") ## renaming
names(BULG)[(dim(BULG)[2]-2):dim(BULG)[2]] <- newVars
BULG[, probVars] <- BULG[, newVars] ## substitute old values with new ones
## Drop last three variables (now original is corrected)
BULG <- dplyr::select(BULG, -(qageCorrect:indirectcontactCorrect))
BJPSNEW <- rbind(BJPSNEW, BULG) ## bind BG to BJPSNEW

## Check number of observations/country
## table(BJPSNEW$countryStr)
## table(BJPSORIG$countryStr)

## Renaming variables in original file for table generation in stargazer()
names(BJPSORIG)[3:19] <- paste0(names(BJPSORIG)[3:19], "_ny")
names(BJPSNEW)[3:19] <- paste0(names(BJPSNEW)[3:19], "_ny")
## Note: not absolutely necessary, inherited from initial script version

## ---------------------------1. Section 1-------------------------------------
## Title: Replication of Schuck, Vliegenthart, and Vreese (2014) (SI 1, mostly)
## Goal:  Reproducing Tables 1 and 2 reported by SVdV
##        In parallel, same models specified on data including Bulgaria 
## Where: Supplementary Information 1, Table SI.A1
## Note:  on Warning, once age is rescaled, the warning is not an
##        issue anymore 
## ----------------------------------------------------------------------------
table2.orig.3 <- glmer(turnout ~ q8_1 + 
                       w2_DUMEDUCATION_ny + gender_female_ny + qage_ny + 
                       directcontact_ny + indirectcontact_ny + 
                       obl_voting_ny + elections_country_ny +
                       news_conflict_new_ny  + v26_r_mean_ny + 
                       news_conflict_new_ny:v26_r_mean_ny  + 
                       (1 | countryStr) + 
                       (-1 + news_conflict_new_ny | countryStr), 
                       data = BJPSORIG, 
                       family = "binomial", 
                       verbose = TRUE)
## Uncomment to check if the warning was an issue related to age coding
# table2.orig.3 <- glmer(turnout ~ q8_1 + 
#                        w2_DUMEDUCATION_ny + gender_female_ny + 
#                        I(qage_ny/100) + 
#                        directcontact_ny + indirectcontact_ny + 
#                        obl_voting_ny + elections_country_ny +
#                        news_conflict_new_ny  + v26_r_mean_ny + 
#                        news_conflict_new_ny:v26_r_mean_ny  + 
#                        (1 | countryStr) + 
#                        (-1 + news_conflict_new_ny | countryStr), 
#                        data = BJPSORIG, 
#                        family = "binomial", 
#                        verbose = TRUE)
# summary(table2.orig.3)


table2.new.3  <- update(table2.orig.3, data = BJPSNEW)
table2.orig.2 <- update(table2.orig.3, ~ . - 
                        news_conflict_new_ny:v26_r_mean_ny)
table2.new.2  <- update(table2.new.3, ~ . - 
                        news_conflict_new_ny:v26_r_mean_ny)
table2.orig.1 <- update(table2.orig.2, ~ . + 
                        news_conflict_new_ny - 
                        (-1 + news_conflict_new_ny | countryStr))
table2.new.1  <- update(table2.new.2, ~ . + 
                        news_conflict_new_ny - 
                        (-1 + news_conflict_new_ny | countryStr))
table1.orig   <- update(table2.orig.1, ~ . + news_exposure_ny)
table1.new    <- update(table2.new.1, ~ . + news_exposure_ny)

## Printing summary for all models
models <- grep("table.", ls())
for (i in 1:length(models)){
    print(ls()[models[i]])
    print(summary(get(ls()[models[i]])))
}

## Not run!
## Fitting varying intercept, varying slope model with
## covariance between "random effects" estimated
## Original data
## table2.corr.3 <- glmer(turnout ~ q8_1 + 
##                        w2_DUMEDUCATION_ny + gender_female_ny + qage_ny + 
##                        directcontact_ny + indirectcontact_ny + 
##                        obl_voting_ny + elections_country_ny +
##                        news_conflict_new_ny  + v26_r_mean_ny + 
##                        news_conflict_new_ny:v26_r_mean_ny  + 
##                        (1 + news_conflict_new_ny | countryStr), 
##                        data = BJPSORIG, 
##                        family = "binomial", 
##                        verbose = T)
## End not run!

## -------------------------1. Table SI.A1-------------------------------------
## Note: in text adjustments on format and added quantities of interest
## ----------------------------------------------------------------------------

stargazer(c(table1.orig, table1.new, 
    table2.orig.1, table2.new.1, 
    table2.orig.2, table2.new.2, 
    table2.orig.3, table2.new.3), 
    intercept.bottom = TRUE, 
    align = TRUE,
    column.sep.width = "0pt",
    font.size = "footnotesize",
    float = TRUE,
    float.env = "sidewaystable",
    no.space = TRUE,
    notes.align = "l",
    keep.stat = c("n","ll"),
    table.placement = "ph!",
    covariate.labels = c("Turnout intention (t-1)", 
        "Education", "Female", "Age", 
        "Direct campaign contact", "Mediated campaign contact", 
        "Compulsory voting", "Simultaneous elections",
        "News conflict", "Polity evaluations",
        "News exposure", "News conflict x Polity evaluations"))

## ---------------------------1. Table SI.A2-----------------------------------
## Note: in text adjustments on format and column/row names
## ----------------------------------------------------------------------------
xtable(rbind(anova(table2.orig.1, table2.orig.2), 
             anova(table2.orig.1, table2.orig.3), 
             anova(table2.orig.2, table2.orig.3), 
             anova(table2.new.1,  table2.new.2), 
             anova(table2.new.1,  table2.new.3), 
             anova(table2.new.2,  table2.new.3)))

## ---------------------------1. Figure SI.A1 (A)------------------------------
## Goal:  Reproducing Figure 2 reported by SVdV
## Where: Figure 1, Research note
## ----------------------------------------------------------------------------

## Number of news conflict values for the dataset used for prediction (63)
confVals <- seq(min(BJPSORIG$news_conflict_new_ny, na.rm = T), 
                max(BJPSORIG$news_conflict_new_ny, na.rm = T), 
                by = 0.25)
nUniqueConf <- length(confVals)

## Creating dataset for model-based prediction: 
## News conflict ranging min to max with increments of 0.25, 
## All other values fixed following SVdV Figure 2 description, 
## Country level predictors fixed at real values (0 for these)
PD <- NULL
PD <- data.frame(
    news_conflict_new_ny = rep(confVals, times = 3), 
    q8_1 = 4, 
    w2_DUMEDUCATION_ny = 2, 
    gender_female_ny = 0, 
    qage_ny = 40, 
    directcontact_ny = 0, 
    indirectcontact_ny = 1, 
    obl_voting_ny = 0, 
    elections_country_ny = 0, 
    v26_r_mean_ny = c(rep(-0.26, times = nUniqueConf), 
                      rep(-0.04, times = nUniqueConf), 
                      rep(0.12, times = nUniqueConf)), 
    countryStr = c(rep("AT", times = nUniqueConf), 
                   rep("SVK", times = nUniqueConf), 
                   rep("SPA", times = nUniqueConf)))

## Predicted values, random-effects ignored (as per SVdV Figure 2 description)
PD <- cbind(PD, predict(table2.orig.3, PD, 
                        re.form = NA, 
                        type = "response"))
names(PD)[dim(PD)[2]] <- "predicted"

## 95% CIs for predicted values
cpred1.CI <- easyPredCI(table2.orig.3, PD)
PD <- cbind(PD, cpred1.CI)
names(PD)[(dim(PD)[2] - 1):dim(PD)[2]] <- c("lower", "upper")

## Figure SI.1A, Panel A, with distribution of predictor in original dataset
## Code for overlaid histogram in ggplot2 edited from: 
## http://rpubs.com/kohske/dual_axis_in_ggplot2
grid.newpage()
p1 <- ggplot(PD, aes(x = news_conflict_new_ny, 
                     y = predicted, 
                     group = countryStr)) + 
    geom_line() + ylim(0, 0.7) + 
    geom_hline(yintercept = 0.5, alpha = 0.3, linetype = 2) + 
    plotTheme() + 
    ylab("Predicted turnout") + xlab("News conflict") + 
    annotate("text", 15, 0.48, label = "AT (-0.26)", size = 2) + 
    annotate("text", 15, 0.565, label = "~ SK (-0.04)", size = 2) + 
    annotate("text", 15, 0.675, label = "SP (0.12)", size = 2)

conf95 <- quantile(BJPSORIG$news_conflict_new_ny, 0.95, na.rm = T)
confMed <- quantile(BJPSORIG$news_conflict_new_ny, 0.5, na.rm = T)

p2 <- ggplot(BJPSORIG, aes(x = news_conflict_new_ny)) + 
    geom_histogram(alpha = 0.5, colour = "grey70", fill = NA) + 
    geom_vline(xintercept = conf95, colour = "red") + 
    geom_vline(xintercept = confMed, colour = "red", linetype = 2) + 
    annotate("text", confMed + 1.2, 4000, label = "Median = 1", 
             size = 2,   colour = "red") + 
    annotate("text", conf95 + 1.3, 4000, label = "95% = 5.85", 
             size = 2, colour = "red") + 
    plotTheme() %+replace% theme(panel.background = element_rect(fill = NA))

g1 <- ggplot_gtable(ggplot_build(p1))
g2 <- ggplot_gtable(ggplot_build(p2))
pp <- c(subset(g1$layout, name == "panel", se = t:r))
g <- gtable_add_grob(g1, g2$grobs[[which(g2$layout$name == "panel")]], 
                     pp$t, pp$l, pp$b, pp$l)
grid.draw(g)

## ---------------------------1. Figure SI.A1 (B)------------------------------
PDC <- dcast(subset(PD, countryStr != "SVK"), 
             news_conflict_new_ny ~ countryStr, 
             value.var = "predicted")
PDC$atSamp <- NA
PDC$spSamp <- NA
## Calculating percentage of sample under (or equal) specific conflict values
## Original data, Austria and Spain
for (i in 1:dim(PDC)[1]){
    PDC$atSamp[i] <- 1 - sum(BJPSORIG[BJPSORIG$countryStr == "AT", "news_conflict_new_ny"] <= PDC[i, "news_conflict_new_ny"], na.rm = T)/sum(!is.na(BJPSORIG[BJPSORIG$countryStr == "AT", "news_conflict_new_ny"]))
    PDC$spSamp[i] <- 1 - sum(BJPSORIG[BJPSORIG$countryStr == "SPA", "news_conflict_new_ny"] <= PDC[i, "news_conflict_new_ny"], na.rm = T)/sum(!is.na(BJPSORIG[BJPSORIG$countryStr == "SPA", "news_conflict_new_ny"]))
}
## Difference in predicted probabilities, high polity evaluation - low polity evaluations
PDC$diff <- PDC$SPA - PDC$AT
ggplot(PDC, aes(x = atSamp, y = diff)) + 
    geom_line() + 
    geom_line(data = PDC, aes(x = spSamp, y = diff), colour = "red") + scale_x_continuous(labels = percent) + 
    xlab("% of sample") + ylab("Difference in turnout probability (SPA-AT)") + 
    plotTheme() + 
    annotate("text", x = 0.2, y = 0.2, label = "Austria", 
             colour = "black", hjust = 0, size = 3) + 
    annotate("text", x = 0.2, y = 0.19, label = "Spain", 
             colour = "red", hjust = 0, size = 3)

## ---------------------------1. Figure SI.A1 (C)------------------------------
ggplot(PD, aes(x = news_conflict_new_ny, y = predicted)) + 
    geom_line() + 
    geom_smooth(data = PD, aes(ymin = lower, ymax = upper, 
                               y = predicted, x = news_conflict_new_ny), 
                               stat = "identity", colour = "black") + facet_grid(~v26_r_mean_ny) + 
    plotTheme() + 
    xlab("News conflict") + ylab("Predicted turnout")

## ---------------------------2. Section 2-------------------------------------
## Title: How specic is exposure to specic type of news?
## Goal:  Re-evaluating results with standardized predictors
##        Evaluating the correlation between the news exposure predictors
## Where: Table 1, Figure 1-2, and Table SI.A3, SI.B1
## ----------------------------------------------------------------------------
## Isolating cases where exposure is 0, but news conflict != 0
BJPSNEW$badCode <- NA
BJPSNEW$badCode[BJPSNEW$news_conflict_new_ny != 0 & 
                BJPSNEW$news_exposure_ny == 0] <- 1
BJPSNEW$badCode[BJPSNEW$news_exposure_ny !=0 & 
                !is.na(BJPSNEW$news_exposure_ny)] <- 0

## ---------------------------A. Table SI.A3----------------------------------
## Note: captions and column names manually edited in document
## --------------------------------------------------------------------------- 

bC <- data.frame(table(BJPSNEW$countryStr, BJPSNEW$badCode)[, 2])
bC$total <- table(BJPSNEW$countryStr, BJPSNEW$badCode)[, 2] + 
            table(BJPSNEW$countryStr, BJPSNEW$badCode)[, 1]
bC$totalZero <- table(BJPSNEW[BJPSNEW$news_exposure_ny == 0, "countryStr"])

names(bC) <- c("Miscoded", "P1", "P2")
bC$P1 <- round(100*bC$Miscoded/bC$P1, 2)
bC$P2 <- round(100*bC$Miscoded/bC$P2, 2)
xtable(bC)

## New data set for transformations. 
## Keeoing original to check eventual differences
BJPS <- BJPSNEW
## All news conflict values where news exposure is 0 are set to 0
BJPS$news_conflict_new_ny[BJPS$news_exposure_ny == 0] <- 0
## Country specific correlations (with standard errors) 
## Note: ideally, would use dplyr, but gives error for 2 attr function
CORS <- ddply(BJPS, .(countryStr), summarise, 
  confTurn   = hetcor(news_conflict_new_ny, 
                      as.factor(turnout))$correlations[1, 2],
  confTurnSe = hetcor(news_conflict_new_ny, 
                      as.factor(turnout))$std.errors[1, 2],
  expTurn    = hetcor(news_exposure_ny, 
                      as.factor(turnout))$correlations[1, 2],
  expTurnSe  = hetcor(news_exposure_ny, 
                      as.factor(turnout))$std.errors[1, 2],
  expConf    = hetcor(news_exposure_ny, 
                      news_conflict_new_ny)$correlations[1, 2],
  expConfSe  = hetcor(news_exposure_ny, 
                      news_conflict_new_ny)$std.errors[1, 2])
CORS
## ---------------------------2. Figure 1 (A)---------------------------------
ggplot(CORS, aes(expConf)) + 
    geom_histogram(fill = NA, colour = "grey70") + 
    annotate("text", 0.83, 1.2, label = "Lithuania", size = 3) + 
    plotTheme() + 
    xlab(expression(rho["news conflict x news exposure"])) + ylab("Count")

## ---------------------------2. Figure 1 (B)---------------------------------
CORSM <- melt(CORS[, 1:5], id = c("countryStr", "confTurnSe", "expTurnSe"))
CORSM$lwr <- NA
CORSM$upr <- NA
CORSM$lwr[CORSM$variable == "confTurn"] <- CORSM[CORSM$variable == "confTurn", "value"] - 1.96*CORSM[CORSM$variable == "confTurn","confTurnSe"]
CORSM$upr[CORSM$variable == "confTurn"] <- CORSM[CORSM$variable == "confTurn", "value"] + 1.96*CORSM[CORSM$variable == "confTurn","confTurnSe"]
CORSM$lwr[CORSM$variable == "expTurn"]  <- CORSM[CORSM$variable == "expTurn", "value"] - 1.96*CORSM[CORSM$variable == "expTurn","expTurnSe"]
CORSM$upr[CORSM$variable == "expTurn"]  <- CORSM[CORSM$variable == "expTurn", "value"] + 1.96*CORSM[CORSM$variable == "expTurn","expTurnSe"]

ggplot(CORSM, aes(x = countryStr, y = value, 
                  ymin = lwr, ymax = upr, 
                  group = variable, colour = variable)) + 
    geom_pointrange(position = position_dodge(width = 0.55)) + 
    plotTheme() + coord_flip() + 
    scale_colour_manual("", values = c("expTurn"  = "grey60", 
                                       "confTurn" = "black"), 
                            labels = c("News conflict", 
                                       "News exposure")) + 
    ylab(expression(rho["turnout x exposure variables"])) + xlab("") + 
    theme(legend.position = c(0.85, 0.9))

## Group-mean centering and standardizing
BJPS <- BJPS %.%
          dplyr::group_by(countryStr) %.%
          dplyr::mutate(confCent = (news_conflict_new_ny - 
                                    mean(news_conflict_new_ny, na.rm = T))/
                                    sd(news_conflict_new_ny, na.rm = T),
                        expCent  = (news_exposure_ny - 
                                    mean(news_exposure_ny, na.rm = T))/
                                    sd(news_exposure_ny, na.rm = T)
                        )
## Sequence of models re-evaluating model from Table I (original article)
## Both news predictors
table1.centered <- glmer(turnout ~ q8_1 + 
                         w2_DUMEDUCATION_ny + gender_female_ny + qage_ny + 
                         directcontact_ny + indirectcontact_ny + 
                         expCent + confCent + 
                         v26_r_mean_ny + obl_voting_ny + elections_country_ny +
                         (1 | countryStr), 
                         data = BJPS, 
                         family = "binomial", 
                         verbose = T)
## Conflict only
table1.noexp   <- update(table1.centered, ~ . - expCent)
## table1.noexp.noturnout <- suppressWarnings(update(table1.noexp, ~ . - q8_1))
## summary(table1.noexp.noturnout)

## Exposure only
table1.noconf  <- update(table1.centered, ~ . - confCent)
## No news predictors
table1.nomedia <- update(table1.noexp, ~ . - confCent)

## ---------------------------2. Table SI.B1-----------------------------------
## Note: captions and column/row names manually edited in document
## --------------------------------------------------------------------------- 
xtable(rbind(anova(table1.nomedia, table1.noexp), 
             anova(table1.nomedia, table1.noconf), 
             anova(table1.noconf,  table1.centered), 
             anova(table1.noexp,   table1.centered)))

## Cross-level interaction models 
## News exposure x polity evaluation (standardized)
table3.exposure <- update(table1.noconf, ~ . + 
                          expCent:v26_r_mean_ny + 
                          (-1 + expCent | countryStr))
## News conflict x polity evaluation (standardized)
table3.conflict <- update(table1.noexp, ~ . + 
                          confCent:v26_r_mean_ny + 
                          (-1 + confCent | countryStr))

## ---------------------------2. Table 1--------------------------------------
## Note: captions and column/row names manually edited in document
##       creates full version of the table, shortened version reported in paper
## --------------------------------------------------------------------------- 

stargazer(c(table1.noconf, table1.noexp, 
            table3.exposure, table3.conflict), 
    intercept.bottom = TRUE, 
    align = TRUE)

## ---------------------------2. Figure 2-------------------------------------
confVals <- seq(min(BJPS$confCent, na.rm = T), 
                max(BJPS$confCent, na.rm = T), 
                by = 0.25)
expVals <- seq(min(BJPS$expCent, na.rm = T), 
               max(BJPS$expCent, na.rm = T), 
               by = 0.25)
nUniqueConf <- length(confVals)
nUniqueExp <- length(expVals)

PDCONF <- NULL
PDCONF <- data.frame(
    confCent = rep(confVals, times = 3), 
    q8_1 = 4, 
    w2_DUMEDUCATION_ny = 2, 
    gender_female_ny = 0, 
    qage_ny = 40, 
    directcontact_ny = 0, 
    indirectcontact_ny = 1, 
    obl_voting_ny = 0, 
    elections_country_ny = 0, 
    v26_r_mean_ny = c(rep(-0.26, times = nUniqueConf), 
                      rep(-0.04, times = nUniqueConf), 
                      rep(0.12, times = nUniqueConf)), 
    countryStr = c(rep("AT", times = nUniqueConf), 
                   rep("SVK", times = nUniqueConf), 
                   rep("SPA", times = nUniqueConf)))

## Predicted values, random-effects ignored, conflict
PDCONF <- cbind(PDCONF, predict(table3.conflict, 
                                PDCONF, re.form = NA, 
                                type = "response"))
names(PDCONF)[dim(PDCONF)[2]] <- "predicted"
PDCONF$news <- "News conflict"
names(PDCONF)[1] <- "exposure"

PDEXP <- NULL
PDEXP <- data.frame(
    expCent = rep(expVals, times = 3), 
    q8_1 = 4, 
    w2_DUMEDUCATION_ny = 2, 
    gender_female_ny = 0, 
    qage_ny = 40, 
    directcontact_ny = 0, 
    indirectcontact_ny = 1, 
    obl_voting_ny = 0, 
    elections_country_ny = 0, 
    v26_r_mean_ny = c(rep(-0.26, times = nUniqueExp), 
                      rep(-0.04, times = nUniqueExp), 
                      rep(0.12, times = nUniqueExp)), 
    countryStr = c(rep("AT", times = nUniqueExp), 
                   rep("SVK", times = nUniqueExp), 
                   rep("SPA", times = nUniqueExp)))

## Predicted values, random-effects ignored, exposure
PDEXP <- cbind(PDEXP, predict(table3.exposure, 
                              PDEXP, re.form = NA, 
                              type = "response"))
names(PDEXP)[dim(PDEXP)[2]] <- "predicted"
PDEXP$news <- "News exposure"
names(PDEXP)[1] <- "exposure"
PDBOTH <- rbind(PDCONF, PDEXP)

ggplot(PDBOTH, aes(x = exposure, y = predicted, 
                   linetype = news, colour = countryStr)) + 
    geom_line() + ylim(0, 0.7) + 
    geom_hline(yintercept = 0.5, alpha = 0.3, linetype = 2) + 
    plotTheme() + ylab("Predicted turnout") + 
    xlab("Standardized exposure (group-mean centered)") + 
    scale_colour_manual(values = c("AT"  = "black", 
                                   "SVK" = "black", 
                                   "SPA" = "black"), 
                                   guide = F) + 
    scale_linetype_manual("", values = c("News conflict" = 1, 
                                         "News exposure" = 3)) + 
    theme(legend.position = c(0.2, 0.2)) + 
    annotate("text", 6.8, 0.45, label = "AT (-0.26)", size = 2) + 
    annotate("text", 6.8, 0.555, label = "~SK (-0.04)", size = 2) + 
    annotate("text", 6.8, 0.65, label = "SP (0.12)", size = 2)

## ---------------------------F. Additional checks----------------------------
## Check whether this simple centering leads to the same results on SVdV data
## No corrections, just standardized new predictors
BJPSORIG <- BJPSORIG %.%
            dplyr::group_by(countryStr) %.%
            dplyr::mutate(confCent = (news_conflict_new_ny - 
                                    mean(news_conflict_new_ny, na.rm = T))/
                                    sd(news_conflict_new_ny, na.rm = T),
                          expCent  = (news_exposure_ny - 
                                    mean(news_exposure_ny, na.rm = T))/
                                    sd(news_exposure_ny, na.rm = T)
                        )
## Identical models, different data
table1.origdata.nomedia  <- update(table1.nomedia,  data = BJPSORIG)
table1.origdata.noconf   <- update(table1.noconf,   data = BJPSORIG)
table1.origdata.noexp    <- update(table1.noexp,    data = BJPSORIG)
table1.origdata.centered <- update(table1.centered, data = BJPSORIG)

## Model fit comparison
anova(table1.origdata.nomedia, table1.origdata.noexp)
anova(table1.origdata.nomedia, table1.origdata.noconf)
anova(table1.origdata.noconf, table1.origdata.centered)
anova(table1.origdata.noexp, table1.origdata.centered)
anova(table1.origdata.nomedia, table1.origdata.centered)
