## ---------------------------bjps-extension.R---------------------------------
## Title:     Who is afraid of conflict?
##            Extension script for operationalization by Schuck et al (2014)
## Authors:   Zoltan Fazekas & Erik Gahner Larsen
## Email:     zfa@sam.sdu.dk; egl@sam.sdu.dk
## Paper:     Media content and political behavior in observational research: ##            A critical assessment
## Submitted: May 14, 2014, British Journal of Political Science
## Published: pending
## Doi:       pending
## Data:      PIREDEU Media (2010) and Voter Study (2013)
##            Downloaded from the GESIS archive, (free) registration required
## R version: 3.1.0 
## Note:      Script to reproduce results included in Section 4 and SI C
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

## ---------------------------1. Media Study-----------------------------------
## Goal:  Re-creating conflict, non-conflict, polity evaluation scores
##        Preparing media data to be merged with Voter Study
## Where: Data preparation for analyses in Section 4 and SI C
## ----------------------------------------------------------------------------
## Loading PIREDEU Media Study
## Codebook: ZA5056_cod.PDF
## Update file location (folder) as necessary
fName <- "../data/"
MED <- read.dta(paste0(fName, "ZA5056_v1-0-0.dta"), 
                convert.factors = FALSE)

## Cleaning outlet and country identifier
## If data loaded as such, first character 0s are dropped
## In order to achieve correct merging, the 6 digit media outlet codes
## need to be ammended with a 0 at the start
table(MED$V4)
MED$outlet <- as.character(MED$V4)
MED$outlet[nchar(MED$outlet) == 6] <- paste0("0", 
                                             MED[nchar(MED$outlet) == 6, "V4"])
## Uncomment to check
## table(MED$outlet, MED$V4)
MED$countryCode <- substr(as.character(MED$outlet), 1, 3)

## Create helper dataframe with country code and abbreviation lined up
countryStrF <- c("AT", "BE", "BG", "CYP", "CZ", "DK", 
                  "EE", "FI", "FR", "DE", "GRE", "HU", 
                  "IRE", "IT", "LAT", "LIT", "LUX", "MT", 
                  "NL", "PL", "PT", "RO", "SVK", "SLO", 
                  "SPA", "SWE", "UK")
CNTR <- data.frame(countryCode = names(table(MED$countryCode)), 
                   countryStrF = countryStrF)
## Add country abbreviation to original media data
## Several other ways to do it
MED <- merge(MED, CNTR, by = "countryCode")

## Creating separate country IDs for Belgian systems
## Using the Belgian outlet codes for recoding:
## - Checked with original codebook and online search for outlets
MED$countryStr <- as.character(MED$countryStrF)
MED$countryStr[MED$outlet == "0561001" | MED$outlet == "0561002" | 
               MED$outlet == "0561003" | MED$outlet == "0562001" | 
               MED$outlet == "0562002"] <- "BE-F"
MED$countryStr[MED$outlet == "0561004" | MED$outlet == "0561005" | 
               MED$outlet == "0561006" | MED$outlet == "0562003" | 
               MED$outlet == "0562004"] <- "BE-W"

## Is the news item about the EU?
## - Checked with original codebook
table(MED$V13, useNA = "always")
MED$isEU <- NULL
MED$isEU <- ifelse(MED$V13 == 1, 0, 1)
## table(MED$isEU, useNA = "always")

## Date of news item
MED$dateD <- as.Date(paste(MED$V3a, MED$V3b, "2009", sep = "-"), 
                     format = "%d-%m-%Y")

## Variables used in the analyses

## Conflict frame variables: recoding
origVars <- c("V33", "V34a", "V35", "V36a")
confVars <- paste0("conf", 1:4)
MED[, confVars] <- apply(MED[, origVars], 2, function (x) x - 1)
## summary(MED[, confVars])
table(MED$isEU, useNA = "always")
## Conflict frame: using all 4 variables
## Simultaneous calculating non-conflict as well
## In all cases, only those scores are calculated where all indicators have
## a valid entry
## In total, there are 29946 cases where all four variables are NA
## and 6 cases where not all four indicators were coded
## From the 29946 cases with no coding, 29907 are the ones marked as
## "not EU" (hence not coded) or missing value on whether it is about the EU
## There is no specific indication about the remaining 39 cases why no
## conflict coding is available
MED$confOrig    <- apply(MED[, confVars], 1, 
                        function(x) sum(x)/4)
MED$nonConfOrig <- apply(MED[, confVars], 1, 
                        function (x) sum(x == 0)/4)

## Not run!
## Cross-check on the missingness:
## MED$confOrigNA    <- apply(MED[, confVars], 1, 
##                         function(x) sum(x, na.rm = T)/4)
## MED$nonConfOrigNA <- apply(MED[, confVars], 1, 
##                         function (x) sum(x == 0, na.rm = T)/4)
## table(MED$confOrig, MED$confOrigNA, useNA = "always")
## End not run!

## Conflict frame: using only 3 variables
## First varibale as per original codebook is not necessarily conflict
MED$confNew    <- apply(MED[, confVars[2:4]], 1, 
                     function(x) sum(x)/3)
MED$nonConfNew <- apply(MED[, confVars[2:4]], 1, 
                        function (x) sum(x == 0)/3)

## Polity evaluations (possible source of unclarity)
## Partially clarified by Georgios Xezonakis, 28/04/14 (email exchange)
## A more conservative isEU measure would be based on this variable
## table(MED$V26, MED$V13, useNA = "always") 
## The issue is story mentioning the EU, but not about the EU (8058)
MED$peval <- NA
MED$peval[MED$V26 == 3] <- -2
MED$peval[MED$V26 == 4] <- -1
MED$peval[MED$V26 == 5 | MED$V26 == 2] <- 0
MED$peval[MED$V26 == 6] <- 1
MED$peval[MED$V26 == 7] <- 2

## NOTE 1: Collapsing the 2 = mentioned but not evaluated category with
##         the 5 = balanced/mixed category is the only way we can get close
##         to the country polity evaluation scores reported by SVdV
##         This is not documented in the original piece
## NOTE 2: Average values extremely sensitive to aggregation strategy
## NOTE 3: Below, we cross-reference our polity evaluation scores with 
##         those reported by SVdV
##         Correlation between polity measure from data and reported by SVdV ##         0.989; Means: -0.0436 (data), -0.0429 (SVdV)

## Not run!
## POL <- MED %>%
##         dplyr::group_by(outlet) %>%
##         dplyr::summarise(polity     = mean(peval, na.rm = T),
##                          countryStr = unique(countryStrF)) %>%    
##         dplyr::group_by(countryStr) %>%
##         dplyr::summarise(polity = mean(polity, na.rm = T))
## BJPSORIG <- read.spss(paste0(fName, "S0007123413000525sup001.sav"), 
##                       use.value.labels = F, to.data.frame = T) 
## BJPSORIG$countryStr <- "UK"
## BJPSORIG$countryStr[BJPSORIG$country == 3] <- "FR"
## BJPSORIG$countryStr[BJPSORIG$country == 4] <- "IT"
## BJPSORIG$countryStr[BJPSORIG$country == 5] <- "DE"
## BJPSORIG$countryStr[BJPSORIG$country == 6] <- "SPA"
## BJPSORIG$countryStr[BJPSORIG$country == 7] <- "SWE"
## BJPSORIG$countryStr[BJPSORIG$country == 8] <- "DK"
## BJPSORIG$countryStr[BJPSORIG$country == 10] <- "GRE"
## BJPSORIG$countryStr[BJPSORIG$country == 11] <- "HU"
## BJPSORIG$countryStr[BJPSORIG$country == 12] <- "CZ"
## BJPSORIG$countryStr[BJPSORIG$country == 13] <- "PL"
## BJPSORIG$countryStr[BJPSORIG$country == 18] <- "IRE"
## BJPSORIG$countryStr[BJPSORIG$country == 22] <- "AT"
## BJPSORIG$countryStr[BJPSORIG$country == 31] <- "PT"
## BJPSORIG$countryStr[BJPSORIG$country == 37] <- "BE"
## BJPSORIG$countryStr[BJPSORIG$country == 38] <- "NL"
## BJPSORIG$countryStr[BJPSORIG$country == 41] <- "FI"
## BJPSORIG$countryStr[BJPSORIG$country == 45] <- "LIT"
## BJPSORIG$countryStr[BJPSORIG$country == 46] <- "LAT"
## BJPSORIG$countryStr[BJPSORIG$country == 47] <- "SVK"
## BJPSORIG$countryStr[BJPSORIG$country == 95] <- "BG"
## SVDV <- dplyr::select(BJPSORIG, countryStr, v26_r_mean) %>%
##             dplyr::group_by(countryStr) %>%
##             dplyr::summarise(politySVdV = mean(v26_r_mean, na.rm = T))
## POL <- merge(POL, SVDV, by = "countryStr")
## cor(POL[, 2:3])
## colMeans(POL[, 2:3])
## End not run!

## Outlet level dataset, with all predictors of interest
NC <- MED %>%
        dplyr::group_by(outlet) %>%
        dplyr::summarise(c1 = sum(conf1, na.rm = T),
                  c2 = sum(conf2, na.rm = T),
                  c3 = sum(conf3, na.rm = T),
                  c4 = sum(conf4, na.rm = T),
                  nConflict = sum(conf1 == 1 | conf2 == 1 | 
                                  conf3 == 1 | conf4 == 1, na.rm = T),
                  nConflictThree = sum(conf2 == 1 | conf3 == 1 | 
                                       conf4 == 1, na.rm = T),
                  confSVdV = mean(confOrig, na.rm = T),
                  nonConfSVdV = mean(nonConfOrig, na.rm = T),
                  confThree = mean(confNew, na.rm = T),
                  totalEU = sum(isEU, na.rm = T),
                  totalEU2 = sum(V26 != 1 & is.na(V26) == F, na.rm = T),
                  discEU = sum(V26 == 1 & isEU == 1, na.rm = T),
                  totalNeg = sum(V26 < 5 & V26 > 2, na.rm = T),
                  totalPos = sum(V26 > 5, na.rm = T),
                  totalBal = sum(V26 == 5, na.rm = T),
                  totalNon = sum(V26 == 2, na.rm = T),
                  polity = mean(peval, na.rm = T),
                  totalStories = n(),
                  countryStr = unique(countryStr))
head(NC)
## write.csv(NC, "media-outlets-2009.csv", row.names = F)
## Creating merge ID in outlet level data for future merge
NC$mergeID <- paste0(NC$countryStr, "-", 
                    substr(NC$outlet, 4, 4), 
                    substr(NC$outlet, 7, 7))
## Country level dataset, with all predictors of interest
MC <- NC %>%
        dplyr::group_by(countryStr) %>%
        dplyr::summarise(c1 = sum(c1, na.rm = T),
                  c2 = sum(c2, na.rm = T),
                  c3 = sum(c3, na.rm = T),
                  c4 = sum(c4, na.rm = T),
                  nConflict = sum(nConflict, na.rm = T),
                  nConflictThree = sum(nConflictThree, na.rm = T),
                  confSVdV = mean(confSVdV, na.rm = T),
                  confThree = mean(confThree, na.rm = T),
                  nonConfSVdV = mean(nonConfSVdV, na.rm = T),
                  totalEU = sum(totalEU, na.rm = T),
                  totalEU2 = sum(totalEU2, na.rm = T),
                  discEU = sum(discEU, na.rm = T),
                  totalNeg = sum(totalNeg, na.rm = T),
                  totalPos = sum(totalPos, na.rm = T),
                  totalBal = sum(totalBal, na.rm = T),
                  totalNon = sum(totalNon, na.rm = T),
                  polity = mean(polity, na.rm = T),
                  totalStories = sum(totalStories, na.rm = T))
## cor(MC$confSVdV, MC$nonConfSVdV)
## NOTE 4: perfect negative correlation between conflict framing and 
##         non-conflict framing, country level
## write.csv(MC, "media-countries-2009.csv", row.names = F)

## ---------------------------2. Voter Study-----------------------------------
## Goal:  Re-creating the individual level predictors
##        Merging with Media Study
##        Creating news individual x outlet variables
##        Evaluating operationalization
##        Using SVdV method on full Voter Study
## Note:  No turnout intention                
## Where: Section 4
## ----------------------------------------------------------------------------
## Loading PIREDEU Media Study
## Sample UK Questionnaire: ZA5055_q_gb-quest.PDF
## Update file location (folder) as necessary

EES <- read.dta(paste0(fName, "ZA5055_v1-1-0.dta"), 
                convert.factors = F)
countryStrF <- c("BE-W", "BE-F", "CZ", "DK", "DE", 
                 "EE", "GRE", "SPA", "FR", "IRE", 
                 "IT", "CYP", "LAT", "LIT", "LUX", 
                 "HU", "MT", "NL", "AT", "PL", "PT", 
                 "SLO", "SVK", "FI", "SWE", "UK", "BG", "RO")
CNTR <- data.frame(t103 = names(table(EES$t103)), 
                   countryStr = countryStrF)
EES <- merge(EES, CNTR, by = "t103")
## Unique respondent ID
EES$uID <- EES$t100
## Turnout in EP elections 2009
EES$turnout <- NA
EES$turnout[EES$q24 == 1] <- 1
EES$turnout[EES$q24 == 2] <- 0
## Sex
EES$female <- NA
EES$female[EES$q102 == 2] <- 1
EES$female[EES$q102 == 1] <- 0

## Age
EES$age <- 2009 - EES$q103
EES$age[EES$q103 == 7777] <- NA

## 3-Category Education, 
## Different operationalization, 
## Attempted to get similar percentages as SVdV
## Original scale in ISCED education levels
EES$edu <- NA
EES$edu[EES$v200 < 3.3] <- 0 
EES$edu[EES$v200 > 3.2 & EES$v200 < 5.1] <- 1
EES$edu[EES$v200 > 5 & EES$v200 < 7] <- 2 

## Campaign contact variables
EES$directCont <- NA
EES$indirectCont <- NA
contactVars <- c(paste0("indCont", 1:5), "dirCont1", "dirCont2")
origVars <- c("q21_a", "q21_b", "q21_c", "q21_d", "q21_e","q21_f", "q21_g")
EES[, contactVars] <- apply(EES[, origVars], 2, 
                            function(x) car::recode(x, 
                                                "1 = 1; 2 = 0; else = NA"))
## Even if not all are valid entries, values are calculated. 
## Approximates SVdV distributions better, but not indicated anywhere how to
## handle these cases
EES$directCont <- rowSums(EES[, contactVars[6:7]], na.rm = T)
## NOTE 6: Article appendix has Mail/flyer together 
##         Here we have separate variables for these two
EES$indirectCont <- rowSums(EES[, contactVars[1:5]], na.rm = T)
## Media variables
## 3 newspapers
paperVars <- paste0("paper", 1:3)
EES[, paperVars] <- EES[, c("q12_a", "q12_b", "q12_c")]
EES[, paperVars] <- apply(EES[, paperVars], 2, 
                          function (x) car::recode(x, "c(77, 88) = NA"))

## 4 TV variables, however in most countries only 2 were asked
## 99 is code for not asked kept for first operationalization
## Made NA for second operationalization
tvVars <- paste0("tv", 1:4)
EES[, tvVars] <- EES[, c("q8_a", "q8_b", "q8_c", "q8_d")]
EES[, tvVars] <- apply(EES[, tvVars], 2, 
                       function (x) car::recode(x, "c(77, 88) = NA")) 
tvVars1 <- paste0("tvMiss", 1:4)
EES[, tvVars1] <- apply(EES[, tvVars], 2, 
                       function (x) car::recode(x, "99 = NA"))
## Summed exposure scores
EES$paperSum <- rowSums(EES[, paperVars], na.rm = T)
EES$tvSum <- rowSums(EES[, tvVars1], na.rm = T)
EES$exposure <- EES$paperSum + EES$tvSum

## Voter data in long format, for each media question
keptVars <- c("countryStr", "uID", "turnout", "indirectCont", 
              "directCont", "age", "female", "edu", "exposure", 
              paperVars, tvVars)
EESM <- melt(EES[, keptVars], 
             id = keptVars[-c((length(keptVars) - 6):length(keptVars))])

## Preparing merge ID
## Country abbreviation + outlet type (1 paper, 2 tv) + outlet number
EESM$tvID <- 2 
EESM[grep("paper", as.character(EESM$variable)), "tvID"] <- 1
EESM$mergeID <- paste0(EESM$countryStr, "-", EESM$tvID, 
                       substr(as.character(EESM$variable), 
                              nchar(as.character(EESM$variable)), 
                              nchar(as.character(EESM$variable)))) 
## head(EESM$mergeID) ## Example
## Given Belgium is split, manual fixes are carried out
## Walloon papers: 4, 5, 6
## Walloon tvs: 3, 4
EESM$mergeID[EESM$countryStr == "BE-W" & 
             EESM$variable == "paper1"] <- "BE-W-14"
EESM$mergeID[EESM$countryStr == "BE-W" & 
             EESM$variable == "paper2"] <- "BE-W-15"
EESM$mergeID[EESM$countryStr == "BE-W" & 
             EESM$variable == "paper3"] <- "BE-W-16"
EESM$mergeID[EESM$countryStr == "BE-W" & 
             EESM$variable == "tv1"] <- "BE-W-23"
EESM$mergeID[EESM$countryStr == "BE-W" & 
             EESM$variable == "tv2"] <- "BE-W-24"
EESM$mergeID[EESM$countryStr == "BE-W" & 
             EESM$variable == "tv3"] <- NA
EESM$mergeID[EESM$countryStr == "BE-W" & 
             EESM$variable == "tv4"] <- NA

## Merging Voter and Media data
## Cleaning duplicate variables
## Not asked: recoded to missing
EESM <- merge(EESM, NC, by = "mergeID")
EESM$countryStr.y <- NULL
names(EESM)[2] <- "countryStr"
EESM$value[EESM$value == 99] <- NA

## Creating outlet x individual variables, a la SVdV
EESM$iConfSVdV <- EESM$value * EESM$confSVdV ## SVdV Conflict
EESM$iConfThree <- EESM$value * EESM$confThree ## 3 Conflict
EESM$inonConfSVdV <- EESM$value * EESM$nonConfSVdV ## SVdV no-conflict
EESM$iEU <- EESM$value * (EESM$totalEU/EESM$totalStories) ## EU stories
EESM$iPolity <- EESM$value * EESM$polity ## individual level polity eval.

## Checks for alternative coding
## "Weighting" by the rescaled individual level exposure (0, 1)
## Done on the total stories a particular category
## Example: 25 stories with conflict multiplied by 0.14 (1 day a week)
##          Gives "exposure" to conflict
## Same quantities of interest as above
EESM$value01 <- EESM$value/7
EESM$expConf <- EESM$value01 * EESM$nConflict
EESM$expConfThree <- EESM$value01 * EESM$nConflictThree
EESM$expnonConf <- EESM$value01 * (EESM$totalEU - EESM$nConflict)
EESM$expnonConfThree <- EESM$value01 * (EESM$totalEU - EESM$nConflictThree)
EESM$expEU <- EESM$value01 * EESM$totalEU

## Adding summed variables, within each individual
EESM  <- EESM %>%
            dplyr::group_by(uID) %>%
            dplyr::mutate(iaConfSVdV = sum(iConfSVdV, na.rm = T),
                      iaConfThree = sum(iConfThree, na.rm = T),
                      ianonConfSVdV = sum(inonConfSVdV, na.rm = T),
                      iaEU = sum(iEU, na.rm = T),
                      iaPolity = sum(iPolity, na.rm = T),
                      iexpConflict = sum(expConf, na.rm = T),
                      iexpConflictThree = sum(expConfThree, na.rm = T),
                      iexpnonConflict = sum(expnonConf, na.rm = T),
                      iexpnonConflictThree = sum(expnonConfThree, na.rm = T),
                      iexpEU = sum(expEU, na.rm = T))
keptVars <- c("countryStr", "uID", "turnout", "indirectCont", 
              "directCont", "age", "female", "edu", 
              "exposure", "variable", "value", "iaConfSVdV","iaConfThree", 
              "ianonConfSVdV", "iaEU", "iaPolity", "iexpConflict", 
              "iexpConflictThree", "iexpnonConflict", 
              "iexpnonConflictThree", "iexpEU")

## Re-formatting data: from long (outlet x individual) to wide format
EES <- dcast(EESM[, keptVars], countryStr + uID + turnout + 
                                    indirectCont + directCont + age + 
                                    female + edu + exposure + iaConfSVdV +
                                    iaConfThree +
                                    ianonConfSVdV + iaEU + iaPolity + 
                                    iexpConflict + iexpConflictThree + 
                                    iexpnonConflict + iexpnonConflictThree + 
                                    iexpEU ~ variable,
                                    value.var = "value")
## Calculating correlations between:
##      - Individual news conflict and news non-conflict
##      - Individual news conflict and news exposure
##      - Individual news exposure and news non-conflict
CORS <- EES %>%
         dplyr::group_by(countryStr) %>%
         dplyr::summarise(confNonConf = cor(iaConfSVdV, 
                                     ianonConfSVdV, 
                                     use = "complete"),
                   confExp     = cor(iaConfSVdV, 
                                     exposure, 
                                     use = "complete"),
                   nonConfExp  =  cor(exposure, 
                                      ianonConfSVdV, 
                                      use = "complete"))


## Loading in macro data on: compulsory voting, simultaneous elections
MACRO <- read.csv(paste0(fName, "country-vars.csv"), header = T)
MACRO <- merge(MACRO, dplyr::select(MC, countryStr, polity), by = "countryStr")
EES <- merge(EES, MACRO, by = "countryStr")

## ------------------------------Table SI.C2-----------------------------------
## Note: in text adjustments on format and added quantities of interest
## ----------------------------------------------------------------------------
stargazer(EES[, c("turnout", "age", "female", "edu", "directCont", 
                  "indirectCont", "iaConfSVdV", 
                  "ianonConfSVdV", "exposure")], 
          summary = TRUE)


## Group-mean centering and standardizing news related predictors
EES <- EES %>%
        dplyr::group_by(countryStr) %>%
        dplyr::mutate(confCent   = (iaConfSVdV - mean(iaConfSVdV, na.rm = T))/
                             sd(iaConfSVdV, na.rm = T),
               noConfCent = (ianonConfSVdV - mean(ianonConfSVdV, na.rm = T))/
                             sd(ianonConfSVdV, na.rm = T),
               expCent    = (exposure - mean(exposure, na.rm = T))/
                             sd(exposure, na.rm = T))

## Exposure models on EES 2009, 28 political systems
## No cross-level interaction
## Exposure
ees.exp <- glmer(turnout ~ age + female + edu + 
                 directCont + indirectCont + 
                 polity + compVote + simElec + 
                 expCent + 
                 (1 | countryStr),
                 family = binomial,
                 data = EES)
## Conflict
ees.conf <- update(ees.exp, . ~ . + confCent - expCent)
## Non-conflict
ees.noconf <- update(ees.exp, . ~ . + noConfCent - expCent)

## Model fit comparison
anova(ees.conf, ees.noconf)
anova(ees.exp,  ees.noconf)
anova(ees.exp,  ees.conf)

## ------------------------------Table SI.C1-----------------------------------
## Note: in text adjustments on format and added quantities of interest
## ----------------------------------------------------------------------------

print.xtable(xtable(cbind(MC$countryStr, MC$confSVdV, 
                          MC$nonConfSVdV, CORS[, 2:4]), 
             digits = 3), include.rownames = F)

## ------------------------------Table SI.C3-----------------------------------
## Note: in text adjustments on format and added quantities of interest
##       shortened version of this table appears as Table 2, main text
## ----------------------------------------------------------------------------

stargazer(c(ees.exp, ees.conf, ees.noconf), 
    intercept.bottom = TRUE,
    align = TRUE,
    column.sep.width = "0pt",
    font.size = "footnotesize",
    float = TRUE,
    float.env = "sidewaystable",
    no.space = TRUE,
    notes.align = "l",
    keep.stat = c("n","ll", "aic"),
    table.placement = "ph!",
    covariate.labels = c("Age", "Female", "Education", 
                        "Direct campaign contact", "Mediated campaign contact",
                        "Polity evaluations", "Compulsory voting",
                        "Simultaneous elections", "Exposure"))
