---
title: "Supplementary Information for Media content and political behavior in observational research: A critical assessment"
titlenote: Research note accepted in the British Journal of Political Science. Both authors contributed equally. Please address correspondence to both authors. Replication materials on [https://github.com/zfazekas/bjps-conflict](https://github.com/zfazekas/bjps-conflict) and the journal website.
author:
- name: Zoltan Fazekas
  affiliation: University of Southern Denmark
  email: zfa@sam.sdu.dk
- name: Erik Gahner Larsen
  affiliation: University of Southern Denmark
  email: egl@sam.sdu.dk
date: \today
---

\newpage

# Supplementary Information A
## Replication of @schuck14

The results reported by SVdV are based on data from twenty countries instead of the intended twenty-one. Most likely due to between-wave merging problems, all entries from Bulgaria appeared as duplicates, in which the data rows were shifted. Ultimately, this generated a data file that -- published along the original article, for Bulgaria, contained no single observation for which all of the covariates and the response variable were _complete cases_. Given the default listwise deletion employed by many statistical software packages, this means that all results reported by SVdV in the multivariate section are based on data from twenty, instead of the intended twenty-one countries, Bulgaria being completely excluded from the analysis.

The $N$ of 21,776 reported by SVdV does not include a single respondent from Bulgaria. After the necessary corrections, we have 22,792 valid observations, in twenty-one countries now. This sample size is also in line with what @schuck13 report (22,791) when they analyze a different dependent variable -- cynicism -- using data from the same study with a very similar methodological approach. Thus, we re-specified the models reported by SVdV using the originally intended sample of twenty-one countries. We re-estimated the models using multiple statistical softwares (results from R reported here). Table SI.A1 displays results from all four models reported by SVdV (pages 11-12) tagged as _Published_ and, in parallel, the results from the models on the complete data, tagged as _Revised_.

The results reported in the _Published_ columns are identical to the ones originally reported by the authors. When comparing the revised model outputs on the full data, few, but important results change. SVdV report statistical significance based one-tailed tests, so we note that $\star$ in our tables ($p < 0.1$, two-tailed) is identical to the $\star$ ($p<0.05$, one-tailed significance levels) reported by SVdV. Independent of the threshold chosen, when Bulgaria is included, the cross-level interaction supporting SVdV's second hypothesis fails to reach statistical significance. While we do not necessarily contest the idea that the same media content can have different effects in different contexts, we do argue that there is no empirical support for contextual effects as proposed by SVdV.

\figureversion{tabular}
\begin{sidewaystable}[ph!] 
\centering 
\singlespacing
\footnotesize
\caption*{Table SI.A1: Model results}
\begin{tabular}{@{\extracolsep{0pt}}lD{.}{.}{-3} D{.}{.}{-3} D{.}{.}{-3} D{.}{.}{-3} D{.}{.}{-3} D{.}{.}{-3} D{.}{.}{-3} D{.}{.}{-3} } 
\\\hline 
 & \multicolumn{2}{c}{Table 1 model} & \multicolumn{2}{c}{Fixed-effects model} & \multicolumn{2}{c}{Random-effects model} & \multicolumn{2}{c}{Cross-level interaction}\\ 
 & \multicolumn{1}{c}{Published} & \multicolumn{1}{c}{Revised} & \multicolumn{1}{c}{Published} & \multicolumn{1}{c}{Revised} & \multicolumn{1}{c}{Published} & \multicolumn{1}{c}{Revised} & \multicolumn{1}{c}{Published} & \multicolumn{1}{c}{Revised}\\ 
\hline \\ 
 Turnout intention (t-1) & 0.514^{***} & 0.512^{***} & 0.514^{***} & 0.511^{***} & 0.514^{***} & 0.511^{***} & 0.514^{***} & 0.511^{***} \\ 
  & (0.009) & (0.009) & (0.009) & (0.009) & (0.009) & (0.009) & (0.009) & (0.009) \\ 
 Education & 0.139^{***} & 0.145^{***} & 0.140^{***} & 0.146^{***} & 0.140^{***} & 0.146^{***} & 0.140^{***} & 0.146^{***} \\ 
  & (0.018) & (0.018) & (0.018) & (0.018) & (0.018) & (0.018) & (0.018) & (0.018) \\ 
 Female & -0.186^{***} & -0.171^{***} & -0.187^{***} & -0.172^{***} & -0.187^{***} & -0.172^{***} & -0.188^{***} & -0.174^{***} \\ 
  & (0.034) & (0.033) & (0.034) & (0.033) & (0.034) & (0.033) & (0.034) & (0.033) \\ 
 Age & 0.016^{***} & 0.017^{***} & 0.016^{***} & 0.017^{***} & 0.016^{***} & 0.017^{***} & 0.016^{***} & 0.017^{***} \\ 
  & (0.001) & (0.001) & (0.001) & (0.001) & (0.001) & (0.001) & (0.001) & (0.001) \\ 
 Direct campaign contact & 0.162^{***} & 0.195^{***} & 0.159^{***} & 0.191^{***} & 0.159^{***} & 0.191^{***} & 0.159^{***} & 0.191^{***} \\ 
  & (0.051) & (0.050) & (0.051) & (0.050) & (0.051) & (0.050) & (0.051) & (0.050) \\ 
 Mediated campaign contact & 0.180^{***} & 0.180^{***} & 0.180^{***} & 0.179^{***} & 0.180^{***} & 0.180^{***} & 0.179^{***} & 0.179^{***} \\ 
  & (0.025) & (0.024) & (0.025) & (0.025) & (0.025) & (0.025) & (0.025) & (0.025) \\ 
 News exposure & -0.014^{*} & -0.016^{**} &  &  &  &  &  &  \\ 
  & (0.008) & (0.007) &  &  &  &  &  &  \\ 
 News conflict & 0.073^{***} & 0.078^{***} & 0.030^{***} & 0.027^{***} & 0.030^{***} & 0.027^{***} & 0.037^{***} & 0.033^{***} \\ 
  & (0.025) & (0.025) & (0.010) & (0.009) & (0.010) & (0.010) & (0.010) & (0.010) \\ 
News conflict $\times$ Polity evaluations &  &  &  &  &  &  & 0.151^{*} & 0.133 \\ 
 &  &  &  &  &  &  & (0.086) & (0.085) \\ 
 Polity evaluations & 0.312 & 0.382 & 0.181 & 0.215 & 0.146 & 0.187 & -0.204 & -0.123 \\ 
  & (1.168) & (1.128) & (1.181) & (1.141) & (1.187) & (1.147) & (1.198) & (1.158) \\ 
 Compulsory voting & 0.817^{**} & 0.821^{**} & 0.801^{*} & 0.801^{**} & 0.799^{*} & 0.800^{**} & 0.788^{*} & 0.789^{**} \\ 
  & (0.406) & (0.396) & (0.411) & (0.402) & (0.413) & (0.404) & (0.410) & (0.401) \\ 
 Simultaneous elections & 0.657^{**} & 0.643^{**} & 0.636^{**} & 0.619^{**} & 0.640^{**} & 0.623^{**} & 0.631^{**} & 0.615^{**} \\ 
  & (0.274) & (0.267) & (0.277) & (0.270) & (0.279) & (0.272) & (0.277) & (0.270) \\ 
 Constant & -3.274^{***} & -3.288^{***} & -3.276^{***} & -3.292^{***} & -3.279^{***} & -3.294^{***} & -3.292^{***} & -3.304^{***} \\ 
  & (0.157) & (0.149) & (0.159) & (0.150) & (0.159) & (0.151) & (0.159) & (0.150) \\ 
\hline 
N & \multicolumn{1}{c}{21,776} & \multicolumn{1}{c}{22,792} & \multicolumn{1}{c}{21,776} & \multicolumn{1}{c}{22,792} & \multicolumn{1}{c}{21,776} & \multicolumn{1}{c}{22,792} & \multicolumn{1}{c}{21,776} & \multicolumn{1}{c}{22,792} \\ 
Countries & \multicolumn{1}{c}{20} & \multicolumn{1}{c}{21} & \multicolumn{1}{c}{20} & \multicolumn{1}{c}{21} & \multicolumn{1}{c}{20} & \multicolumn{1}{c}{21} & \multicolumn{1}{c}{20} & \multicolumn{1}{c}{21} \\ 
$\sigma^2$ country level & 0.252 & 0.240 & 0.259 & 0.247 & 0.260 & 0.249 & 0.257 & 0.246\\ 
$\sigma^2$ News conflict &  &  &  &  & 0.0002 & 0.0002 & < 0.0001 & < 0.0001 \\
Log Likelihood & \multicolumn{1}{c}{-11,013.380} & \multicolumn{1}{c}{-11,566.840} & \multicolumn{1}{c}{-11,015.070} & \multicolumn{1}{c}{-11,569.260} & \multicolumn{1}{c}{-11,015.030} & \multicolumn{1}{c}{-11,569.240} & \multicolumn{1}{c}{-11,013.530} & \multicolumn{1}{c}{-11,568.050} \\ 
\hline
\multicolumn{9}{l}{\textit{Note: }$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01. In line with SVdV, unstandardized coefficients reported.} \\ 
\normalsize 
\end{tabular} 
\end{sidewaystable}

The authors themselves point out that the amount of between-country variation of the _news conflict_ slope is rather small, but they also emphasize that the variation is statistically significant. Beside the point that just because something is statistically significant it does not mean that it is substantively relevant, we investigate the "proclaimed significance" of the slope variation. Naturally, variation is bound to be $\geq 0$, so if the decision to consider it statistically significant was based on the fact that the lower bound of the 95\% confidence interval for the slope variation was above zero, there might be an issue. Also, just by looking at the log-likelihoods reported by SVdV in Table 2 (original piece), we are hard-pressed to believe that letting the slope of _news conflict_ vary across countries yields significantly better fitting models compared to the "fixed-effects" model. We use quotation marks here, because we consider this to be better described as a varying-intercept model, but for the ease of comparability, we follow the names employed by SVdV. There are many ways to assess whether this variation is significant, and here we choose to look at comparative model fit ($\chi^2$ difference test) for nested models: the "fixed-effects" model is nested within the random-effects model, which is nested within the cross-level interaction model (and subsequently the "fixed-effects model" is nested in the cross-level interaction model).

\begin{table}[h!]
\centering
\singlespacing
\footnotesize
\resizebox{0.8\textwidth}{!}{\begin{minipage}{\textwidth}
\caption*{Table SI.A2: Model fit comparison}
\begin{tabular}{llccccccc}
\hline
Compared to & Model  & Df & AIC & BIC & logLik & $\chi^2$ & Diff. Df & Pr($>\chi^2$) \\ 
  \hline
\emph{Published} & &  &  &  &  &  & & \\ 
- & Fixed-effects & 12 & 22054.13 & 22149.99 & -11015.07 &  &  &  \\
Fixed-effects & Random-effects &  13 & 22056.06 & 22159.91 & -11015.03 & 0.07 & 1 & 0.7945 \\ 
Fixed-effects & Cross-level int. & 14 & 22055.06 & 22166.90 & -11013.53 & 3.07 & 2 & 0.2153 \\ 
Random-effects & Cross-level int.& 14 & 22055.06 & 22166.90 & -11013.53 & 3.00 & 1 & 0.0831 \\\hline 
\emph{Revised} & &  &  &  &  &  & & \\ 
- & Fixed-effects & 12 & 23162.53 & 23258.94 & -11569.27 &  &  &  \\ 
Fixed-effects & Random-effects & 13 & 23164.47 & 23268.91 & -11569.23 &  0.06 & 1 & 0.8058 \\ 
Fixed-effects & Cross-level int.& 14 & 23164.10 & 23276.58 & -11568.05 & 2.43 & 2 & 0.2964 \\ 
Random-effects & Cross-level int.& 14 & 23164.10 & 23276.58 & -11568.05 &  2.37 & 1 & 0.1235 \\ 
   \hline
\normalsize
\end{tabular}
\end{minipage}}
\end{table}

Model fit comparisons for both _Published_ and _Revised_ models are reported in Table SI.A2. These results indicate that estimating an extra parameter for the between-country variance of the _news conflict_ slope brings no added value to the model. While one could argue that including the cross-level interaction and fitting that model to the original (20 country) data results in a better fit compared to the random-effects model, it still does not fit significantly better than the "fixed-effects" model. And in-between, the random-effects model does not fit better than the "fixed-effects" model. Both the Akaike Information Criterion and the Bayesian Information Criterion point to the same substantive conclusion. It should be noted that with each step between the models we are losing only one degree of freedom. This is due to the fact that the models employed by SVdV assumed that the random effects for the intercept and the slope are uncorrelated.

We re-specified the last two models including the estimation of a covariance parameter between the random effects. The results do not change substantively, and the correlation between the intercept and slope random effects is $-0.80$ for the random effects model. This correlation is substantially reduced, when we employed the necessary centering of the predictors (an issue discussed in the next section). Model fit comparisons are even less friendly towards the original claims, if we estimate the random effects covariance parameter.

Figure 2 of the original piece offers a visual display of the different _news conflict_ slopes, depending on polity evaluation (negative, neutral, positive). This figure is intended to convey the substantive importance of the information environment. The figure is based only on the "fixed part of the analysis" (SVdV, 12) and does not display any uncertainty measures. Accordingly, when reproducing this figure, no substantial differences should be expected compared to those reported in the original paper. We have followed the description by SVdV of Figure 2. It was not perfectly clear what SVdV mean by "fixed part of the analysis", so we used the fixed-effects from the cross-level interaction. All continuous variables were set to closest existing value of their mean, and as the mean polity evaluations ($-0.04$) are closest to Slovakia, the country level predictors were fixed to the values found for each country -- Austria, Slovakia, and Spain -- and in all cases these country predictors had the value of 0.

However, confidence intervals and the distribution of the key variable help us to understand the conditions under which _news conflict_ has a statistically and substantially significant effect on turnout [@bramboretal2005; @kamfranzese2007]. As the point we are making does not necessarily depend on whether the cross-level interaction is significant or not, we decided to reproduce Figure 2 using the original data (20 countries), displayed in Panel A of Figure SI.A1.

\begin{figure}[ph!]
 \caption*[]%
  {Figure SI.A1: Polity evaluation and news conflict\clfootnote[0]{}}
    \begin{minipage}[t][0.5\textheight][t]{0.45\textwidth}
        \centering
        \captionsetup[figure]{labelformat=empty}
        \caption*{(A)}
    \includegraphics[scale = 0.35]{f1-a.png}
    \end{minipage}
    \begin{minipage}[t][0.5\textheight][t]{0.45\textwidth}
        \centering
                \caption*[]%
  {(B)\clfootnote[0]{}}
        \includegraphics[scale = 0.6]{f1-b.png}
    \end{minipage}

    \nointerlineskip
    \begin{minipage}[b][0.49\textheight][t]{\textwidth}
        \centering
        \vspace{-1.75in}
                \caption*[]%
  {(C)\clfootnote[0]{Panel (A): predicted turnout as a function of news conflict for different polity evaluation levels (reproducing Figure 2 by SVdV). All other variables fixed at values described in the text and by SVdV, predictions based on fixed-effects only. Distribution of news conflict on the 20 country original sample. Panel (B): difference in predicted turnout between most positive and most negative polity evaluation countries plotted against the \% of the sample in a country with news conflict values for which the $\delta$ turnout probability was calculated. Panel (C): identical to Panel (A) with 95\% confidence intervals calculated based on fixed-effects (and their standard errors) only. Random effects are averaged over, news conflict values range from its minimum ($0$) to its maximum ($15.5$), with increments of $0.25$ for the prediction.}}
        \includegraphics[scale = 0.65]{f1-c.png}
    \end{minipage}
\end{figure}

The distribution of the predictor (full sample, 20 countries) and sample moments of interest indicate that sizable between-country differences in predicted turnout appear only at unlikely values of the _news conflict_. Panel B in Figure SI.A1 substantiates this claim. Again, we see that substantive between-country differences in predicted turnout appear at very small proportions of the samples. While we do not deem the chosen method of presentation or discussion used by SVdV as an issue, these further details help in better grasping the substantial role between-system differences can play.

However, we can also see that in some countries, given the same level of _news conflict_, the predicted probability of turnout is above $0.5$, whereas in others is below $0.5$. This can also be regarded as a substantively important effect, as it differentiates between individuals for whom the predicted behavior would be turnout vs. those below $0.5$ are expected to stay home. Panel C in Figure 1 includes 95% confidence bounds calculated using only the fixed effects from the cross-level interaction model (original data), with all other covariates fixed at values discussed above. We note that bounds do not take the distribution of the predictor in the data into consideration. When uncertainty is factored in, we see that even with the selection of the minimum and maximum (positive) polity evaluation country values, these slopes are not significantly different from each other, or the $0.5$ probability value. Using the full sample, we find no statistical or substantial cross-level interaction between the information environment and _news conflict_.

\begin{table}[h!]
\centering
\footnotesize
\singlespacing
\caption*{Table SI.A3: Conflicted, but not exposed}
\begin{tabular}{rccc}
  \hline
 Country & Miscoded & \% of valid & \% of no exposure \\ 
  \hline
AT &  59 & 6.03 & 11.64 \\ 
  BE & 167 & 8.59 & 16.23 \\ 
  BG &  46 & 2.30 & 4.34 \\ 
  CZ &  24 & 2.38 & 4.75 \\ 
  DE &  57 & 5.77 & 11.95 \\ 
  DK &  40 & 3.98 & 8.75 \\ 
  FI &  40 & 3.98 & 8.44 \\ 
  FR &  77 & 7.79 & 15.19 \\ 
  GRE &  56 & 5.76 & 11.16 \\ 
  HU &  57 & 5.75 & 11.88 \\ 
  IRE &  53 & 5.35 & 11.04 \\ 
  IT &  25 & 2.52 & 5.54 \\ 
  LAT &  92 & 7.22 & 8.53 \\ 
  LIT &  25 & 2.30 & 7.55 \\ 
  NL &  53 & 5.33 & 11.35 \\ 
  PL &  26 & 2.59 & 6.05 \\ 
  PT &  27 & 2.70 & 6.01 \\ 
  SPA &  40 & 4.01 & 8.00 \\ 
  SVK &  50 & 4.25 & 9.96 \\ 
  SWE &  62 & 6.33 & 12.16 \\ 
  UK & 132 & 13.40 & 23.24 \\ 
   \hline
\end{tabular}
\end{table} 


## Further non-influential coding issues in @schuck14

Another issue with the data material is the discrepancy with the operationalization. The operationalization of news conflict implies that for an individual who reports not following at all any of the media outlets, both news exposure (a simple summation) and _news conflict_ should take the value 0: people with no media exposure could not have been exposed to any _news conflict_. However, in the replication data 1208 respondents were not exposed to any medium but have scores above zero on the _news conflict_ variable. The country level breakdown of the 1208 observations is reported in Table SI.A3. 

The _news conflict_ scores were very low for all these cases, and accordingly it does not change any of the previously reported results. Nevertheless, being the most important predictor, such mis-alignment between intended coding and data is worrisome. For the analyses reported in the article, we followed the operationalization coding, and we re-coded all cases with 0 exposure to 0 _news conflict_ value. We also note that Appendix A SVdV indicates that for newspapers the range of exposure variable was 0-6, however, in the data, given the maximum values found, we believe that this range also 0-7, as for the TV news shows. 

A final concern with the data is the fact that the medium specific conflict frame index feeds into this composite score. As per page 6 or the original article, four features of the news item indicate conflict, and each of them can either present (1) or not (0). These "presence" scores were averaged ("summed and divided by the number of items to build an additive index scale" [SVdV, p. 6]), and then averaged across all news items in each media outlet. The four items are described in Appendix B (SVdV), and we note some concern related to the first item, that is not listed as a limitation by SVdV:

> __Appendix B, SVdV__: "Explicitly (only if the story or somebody in the story says depicts so): Does the story (or somebody in the story) mention two or more sides of (i.e., not two separate arguments of but two or more distinct perspectives on) a problem or issue?"

> __@schuck2010 [p. 54]__: "__V33__ Explicitly (only if the story or somebody in the story says depicts so): Does the story (or somebody in the story) mention two or more sides of (i.e., not two separate arguments of but two or more distinct perspectives on) a problem or issue? __Note: These 'sides' do not necessarily indicate a conflict or disagreement.__ Example: The tax increase might look good on the budget but it might slow down demand as citizens will be left with less money to spend. Coding: 1 = no 2 = yes" (emphasis added)

We found that including this problematic item in the index __does not__ influence the substantive findings at the individual level. We still find this discrepancy crucial as, yet again, it is related to the most important predictor in the analyses reported, and it undoubtedly paints a more conflictual news environment at both outlet and country level. As the removal of this item does not change the results substantially, we use the four items as SVdV. 

\newpage

# Supplementary Information B
## Model fit comparison

SVdV present an additional, statistical, reason behind the dismissal of news exposure in favor of _news conflict_. As the collinearity between the two variables is not perfect, the authors also report that adding _news conflict_ to a model that has all other predictors (including exposure) yields a significant gain in fit. This is correct, but some other model comparisons are missing from the discussion. Table SI.B1 reports these model comparisons. The sequence of models based on SVdV's Table 1 is intuitive: the "no media" model contains all predictors used by the authors, except the two exposure predictors; the "exposure only" model includes the mere news exposure predictor; the "conflict only" model includes the _news conflict_ measure; and finally, the "full model" includes the two predictors simultaneously, as the model reported by SVdV in Table 1. We use the full sample (21 countries), with the corrected _news conflict_ measure (see discussion in the main text and _Supplementary Information_ __A__).

\begin{table}[h!]
\centering
\singlespacing
\footnotesize
\resizebox{0.8\textwidth}{!}{\begin{minipage}{\textwidth}
\caption*{Table SI.B1: Model fit comparison: exposure vs. news conflict}
\begin{tabular}{llccccccc}
  \hline
Compared to & Model & Df & AIC & BIC & logLik & $\chi^2$ & Diff. Df & Pr($>\chi^2$) \\ 
  \hline
No media & Conflict only & 12 & 23164.10 & 23260.51 & -11570.05  & 6.90 & 1 & 0.0086 \\ 
No media & Exposure only & 12 & 23166.70 & 23263.11 & -11571.35 & 4.29 & 1 & 0.0383 \\ 
Exposure only & Full model & 13 & 23162.36 & 23266.81 & -11568.18  & 6.34 & 1 & 0.0118 \\ 
Conflict only & Full model & 13 & 23162.36 & 23266.81 & -11568.18 & 3.74 & 1 & 0.0532 \\ 
   \hline
\end{tabular}
\end{minipage}}
\normalsize
\end{table}

As Table SI.B1 shows, adding either one of the exposure related predictors produces a model with significantly better fit (first two rows). Next, adding _news conflict_ to a model that already includes news exposure further enhances the fit. Adding exposure to a model with _news conflict_ already present results in a better fitting model, but this difference is not statistically significant at conventional level ($p = 0.0532$). But the differences are minimal, and the the AIC and BIC fit statistics point into opposite directions.

\newpage

# Supplementary Information C
## Data and model for "The mobilizing effect of non-conflictual news"


In the first two columns of Table SI.C1 we report the country average scores for news conflict and news non-conflict. These are based on the conflict and non-conflict scores for each outlet in the respective country. The last three columns report correlations between the individual level exposure variables, after using the operationalization proposed by SVdV.

\begin{table}[ph!]
\centering
\singlespacing
\footnotesize
\resizebox{0.8\textwidth}{!}{\begin{minipage}{\textwidth}
\caption*{Table SI.C1: Exposure, news conflict, new non-conflict}
\begin{tabular}{lccccc}
  \hline
 & News conflict & News non-conflict & $\rho$ & $\rho$ & $\rho$ \\
 &  &  & (conf, no-conf) & (conf, exposure) & (no-conf, exposure) \\
  \hline
AT & 0.456 & 0.544 & 0.992 & 0.998 & 0.998 \\ 
  BE-F & 0.172 & 0.828 & 0.978 & 0.984 & 0.999 \\ 
  BE-W & 0.279 & 0.721 & 0.961 & 0.980 & 0.997 \\ 
  BG & 0.231 & 0.769 & 0.982 & 0.989 & 0.999 \\ 
  CYP & 0.246 & 0.754 & 0.957 & 0.976 & 0.997 \\ 
  CZ & 0.324 & 0.676 & 0.974 & 0.988 & 0.997 \\ 
  DE & 0.146 & 0.854 & 0.984 & 0.988 & 1.000 \\ 
  DK & 0.263 & 0.737 & 0.952 & 0.975 & 0.996 \\ 
  EE & 0.195 & 0.805 & 0.982 & 0.988 & 0.999 \\ 
  FI & 0.314 & 0.686 & 0.976 & 0.989 & 0.998 \\ 
  FR & 0.438 & 0.562 & 0.986 & 0.995 & 0.998 \\ 
  GRE & 0.286 & 0.714 & 0.975 & 0.988 & 0.998 \\ 
  HU & 0.302 & 0.698 & 0.984 & 0.993 & 0.998 \\ 
  IRE & 0.169 & 0.831 & 0.985 & 0.990 & 1.000 \\ 
  IT & 0.334 & 0.666 & 0.980 & 0.991 & 0.998 \\ 
  LAT & 0.358 & 0.642 & 0.993 & 0.997 & 0.999 \\ 
  LIT & 0.040 & 0.960 & 0.716 & 0.740 & 0.999 \\ 
  LUX & 0.190 & 0.810 & 0.997 & 0.998 & 1.000 \\ 
  MT & 0.455 & 0.545 & 0.992 & 0.998 & 0.998 \\ 
  NL & 0.329 & 0.671 & 0.955 & 0.980 & 0.995 \\ 
  PL & 0.383 & 0.617 & 0.939 & 0.980 & 0.988 \\ 
  PT & 0.348 & 0.652 & 0.919 & 0.969 & 0.988 \\ 
  RO & 0.371 & 0.629 & 0.976 & 0.991 & 0.996 \\ 
  SLO & 0.255 & 0.745 & 0.986 & 0.942 & 0.932 \\ 
  SPA & 0.332 & 0.668 & 0.981 & 0.992 & 0.998 \\ 
  SVK & 0.283 & 0.717 & 0.983 & 0.991 & 0.999 \\ 
  SWE & 0.165 & 0.835 & 0.904 & 0.935 & 0.997 \\ 
  UK & 0.214 & 0.786 & 0.960 & 0.977 & 0.998 \\ 
   \hline
\end{tabular}
\end{minipage}}
\normalsize
\end{table}


Descriptive statistics for the variables used in this section are displayed in Table SI.C2. All models were specified to mimic those reported by SVdV, Table 1. Media predictor slopes are fixed across countries and no-cross level interaction was specified. General formula for $n$ individuals in $J$ countries:

\begin{equation*}
\begin{split}
\mbox{Pr(y}_i = 1)   = & \mbox{ logit}^{-1}(\alpha_{j[i]} + \beta_1 \mbox{age}_i + + \beta_2 \mbox{female}_i + \beta_3 \mbox{education}_i  + \\
                       & \beta_4 \mbox{directContact}_i + \beta_5 \mbox{indirectContact}_i + \beta_6 \mbox{mediaVariable}_i)\mbox{, for i = 1, \dots, n} \\
\alpha_j = &\mbox{ } \gamma_0^\alpha + \gamma_1^\alpha \mbox{simElect} + \gamma_2^\alpha \mbox{compVote} + \gamma_3^\alpha \mbox{polityEval} + \eta^\alpha_j\mbox{, for j = 1, \dots J.} 
\end{split}
\end{equation*}

where the second level errors are normally distributed, $\eta^\alpha_j \sim N(0, \sigma^2_\alpha)$. Full model results are reported in Table SI.C3.

\begin{table}[h!] \centering 
\centering
\footnotesize
\singlespacing
\caption*{Table SI.C2: EES summary statistics}
\begin{tabular}{@{\extracolsep{0pt}}lccccc} 
\hline 
Statistic & \multicolumn{1}{c}{N} & \multicolumn{1}{c}{Mean} & \multicolumn{1}{c}{SD} & \multicolumn{1}{c}{Min} & \multicolumn{1}{c}{Max} \\ 
Turnout & 26,908 & 0.710 & 0.454 & 0 & 1 \\ 
Age & 26,763 & 50.291 & 16.911 & 18 & 99 \\ 
Sex (female = 1) & 27,068 & 0.559 & 0.497 & 0 & 1 \\ 
Education & 26,206 & 0.771 & 0.896 & 0 & 2 \\ 
Direct contact & 27,069 & 0.161 & 0.432 & 0 & 2 \\ 
Indirect contact & 27,069 & 0.824 & 0.982 & 0 & 5 \\ 
News conflict (uncentered) & 27,069 & 2.579 & 2.034 & 0.000 & 16.593 \\ 
News non-conflict (uncentered) & 27,069 & 6.187 & 4.417 & 0.000 & 33.587 \\ 
News exposure (uncentered) & 27,069 & 8.839 & 6.037 & 0 & 42 \\ 
\hline
\end{tabular} 
\end{table} 


\begin{table}[h!] 
\centering 
  \caption*{Table SI.C3: The impact of mere exposure, EES 2009} 
\singlespacing
\footnotesize
\begin{tabular}{@{\extracolsep{0pt}}lD{.}{.}{-3} D{.}{.}{-3} D{.}{.}{-3} } 
\\
\hline 
 & \multicolumn{3}{c}{\textit{Turnout}} \\ 
\cline{2-4} 
\\ & \multicolumn{1}{c}{Mere exposure} & \multicolumn{1}{c}{Conflict} & \multicolumn{1}{c}{No-conflict}\\ 
\hline
 \textbf{Exposure} & 0.259^{***} & 0.252^{***} & 0.261^{***} \\ 
  & (0.016) & (0.016) & (0.016) \\
 Age & 0.026^{***} & 0.026^{***} & 0.026^{***} \\ 
  & (0.001) & (0.001) & (0.001) \\
 Female & -0.062^{**} & -0.065^{**} & -0.061^{**} \\ 
  & (0.030) & (0.030) & (0.030) \\
 Education & 0.248^{***} & 0.248^{***} & 0.246^{***} \\ 
  & (0.018) & (0.018) & (0.018) \\
 Direct campaign contact & 0.210^{***} & 0.212^{***} & 0.211^{***} \\ 
  & (0.046) & (0.046) & (0.046) \\
 Mediated campaign contact & 0.263^{***} & 0.263^{***} & 0.263^{***} \\ 
  & (0.020) & (0.020) & (0.020) \\
 Polity evaluations & 0.201 & 0.201 & 0.201 \\ 
  & (0.932) & (0.936) & (0.937) \\
 Compulsory voting & 1.003^{***} & 1.002^{***} & 1.004^{***} \\ 
  & (0.385) & (0.385) & (0.385) \\
 Simultaneous elections & 0.951^{***} & 0.950^{***} & 0.952^{***} \\ 
  & (0.233) & (0.232) & (0.233) \\
 Constant & -0.946^{***} & -0.950^{***} & -0.948^{***} \\ 
  & (0.138) & (0.138) & (0.138) \\
\hline 
N & \multicolumn{1}{c}{25,841} & \multicolumn{1}{c}{25,841} & \multicolumn{1}{c}{25,841} \\ 
Political systems & \multicolumn{1}{c}{28} & \multicolumn{1}{c}{28} & \multicolumn{1}{c}{28} \\ 
 $\sigma^2$ country level & 0.289 & 0.288 & 0.289 \\ \hline
Log Likelihood & \multicolumn{1}{c}{-13,502.110} & \multicolumn{1}{c}{-13,507.600} & \multicolumn{1}{c}{-13,499.410} \\ 
AIC & \multicolumn{1}{c}{27,026.220} & \multicolumn{1}{c}{27,037.190} & \multicolumn{1}{c}{27,020.810} \\ 
\hline 
\multicolumn{4}{l}{\textit{Note:}$^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\multicolumn{4}{l}{Best fitting model based on model comparison: news non-conflict.}
\normalsize 
\end{tabular} 
\end{table}

\newpage

# References
\indent
\setlength{\parindent}{-0.2in}
\setlength{\leftskip}{0.2in}
\setlength{\parskip}{8pt}