---
title: "Media content and political behavior in observational research: A critical assessment"
titlenote: Research note accepted in the British Journal of Political Science. Both authors contributed equally. Please address correspondence to both authors. We are grateful for comments by Martin Ejnar Hansen, Christian Schnaudt, Federico Vegetti and anonymous reviewers at the journal. Replication materials on [https://github.com/zfazekas/bjps-conflict](https://github.com/zfazekas/bjps-conflict) and the journal website.
author:
- name: Zoltan Fazekas
  affiliation: University of Southern Denmark
  email: zfa@sam.sdu.dk
- name: Erik Gahner Larsen
  affiliation: University of Southern Denmark
  email: egl@sam.sdu.dk
date: \today
---

The media informs and influences individual political decisions [@chong2007; @laddlenz2009; @newton1999]. Rather than drawing inferences based on the amount of general media consumption [@bartels1993], the goal in recent research concerning media effects on political behavior is to jointly assess the effects of specific media content consumed by citizens at a specific rate on their political behavior [@barabasjerit2009; @barabasetal2014; @dilliplane2014]. Hence, a growing body of research links, through composite indicators, analyses of media content to individual-level political attitudes and behaviors [@semetkodevreese2002; @schuck13; @schuck14]. Along relying on the validity of self-reported news exposure [@dilliplaneetal2013; @lacourvavreck2014; @prior2009], the additional assumptions imply that information about specific media content 1) provides better measures of citizens’ news exposure which 2) provides a better estimate of the impact of  media content on political behavior.

The methodological challenge is to link media consumption and behavior in such a manner that all information is preserved and that content features are accurately integrated with the media consumption measurement. In many such analyses, media content features are measured as a proportion of news items falling into a specific coding category, such as: is it an EU related topic, does it contain a conflict frame, does it contain a strategic frame, etc. Media content information is then combined with individual level frequency of exposure, resulting in a quantity measurement that is meant to measure the extent of exposure to a particular type of news rather than general media consumption. 

Thus, the ambition of these media effects studies is to make inferences about how specific media content features affect political behavior. To meet this ambition it is crucial to separate exposure to specific media content from general media exposure. If the operationalization of specific media content consumption is merely a proxy for general media exposure, we are making unsubstantiated conclusions on the effects of specific media consumption on political outcomes. In this article we address this problem, which has so far been given little attention.

We do so by way of illustration, namely by examining the validity of the main results of a recently published article on the impact of news content framed in a conflictual manner on the propensity to vote [@schuck14] (abbreviated SVdV). The article is a state-of-the art analysis of the impact of specific news consumptions on political behavior and we sympathize with the authors’ research ambitions. It combines media information that was content coded for the whole 2009 European Parliament (EP) election campaign period, links this information to the frequency of news consumption, and then draws conclusions that are heavily based on the content features interacting with the specific news consumption in contrast to effects associated with general news consumption. Since it is a multi-country analysis, the results of this particular study are even more relevant: the validity of the inferences are increased because the study accounts for systematic cross-country variation in individual behavior, but also for media landscape features in each country.

We show that SVdV's conclusions that exposure to news conflict frame rather than mere news exposures in the 2009 EP elections affects voter turn-out do not hold. We do so in two ways. First, we show that the effect on voter-turnout of specific news exposure (conflict framing) and general news exposure are impossible to distinguish. Second, through an extension, we show that the effects of exposure to conflict and to non-conflict news frames are indistinguishable. In short, SVdV's conclusions do not hold and the reasons behind these issues are fundamental to the research setup and operationalization employed. The heterogeneous effect of news exposure given content features is crucial in such research, and also in this specific article, as SVdV argue that exposure to specific content -- i.e. the news presented in a conflictual manner -- has an effect on turnout, and not simply the level of news consumption. This differentiation also serves to arbitrate between previous contradictory findings about the role of media. We suggest that scholars in future studies explicitly address whether it is general self-reported news exposure that correlates with the outcome of interest rather than specific news content exposure, and pursue better designs to obtain reliable estimates of the effects of specific media coverage on political behavior.

While the methodological issues discussed in this paper are of particular relevance for studies interested in the impact of news frames, it also points to methodological difficulties and challenges for observational media studies in general pertaining to the joint use of individual news consumption rate and media content as key predictors of political attitudes and behaviors.

# Conflictual EU news: an empirical illustration

In the article "Who's Afraid of Conflict? The Mobilizing Effect of Conflict Framing in Campaign News", SVdV theorize that exposure to European Union (EU) or European Parliament (EP) related news focusing on conflict will increase the likelihood of turning out in the EP elections, and this effect is conditional upon the general information environment, i.e. the degree of positive vs. negative polity evaluations of the EU in the news.

The authors use survey and media content data from twenty-one member states of the EU. The individual level data contains turnout intention before the 2009 European Parliament elections and self-reported turnout from a post-election survey. Media content data stems from "Providing an Infrastructure for Research on Electoral Democracy in the European Union" [@schuck2010]. For both expectations put forward, the authors report positive findings. We will show below that the used approach is insufficient to derive such conclusions. 

As we use SVdV's article as an illustration, we followed a step-by-step reproduction and replication of the presented empirical analysis. In this process, we discovered data and methods related issues that required corrections.[^fn-20] On one hand, these corrections help with the validity, transparency and interpretation of the results. On the other hand, they assure that our broader concerns are not simply rooted in the particular data or analysis reported in the original article. 

[^fn-20]: In short, the analysis and results are based on 20 countries instead of the intended and reported 21 countries. After identifying a data related issue, with the necessary adjustments we reach a sample size similar to that reported by @schuck13 on the same dataset. The use of the incomplete data has direct implications for the support for Hypothesis 2 of SVdV, failing to reach statistical significance after corrections. First, we see this is a minor issue as the substantial support for Hypothesis 2 was absent in the first place. Second, coding errors can happen and our more general claims made in this paper are not strictly related to these deficiencies. However, we urge those interested in the role of the polity evaluation at a macro level or general considerations regarding cross-level variation in hierarchical models to consult the detailed replication and corrections described in _Supplementary Information_ __A__.

# How specific __is__ exposure to specific type of news?

While _news exposure_ is a simple summation of the weekly frequencies with which an individual follows the specific media outlets (from 0 to 7 days, for five outlets, on average, per country), incorporating content related information requires additional adjustment. The core operationalization of _news conflict_ combines both individual and content related features, and SVdV (p. 9, footnote 45) use the following formula to calculate this individual level predictor: 

> _news conflict_ = [(exposure medium 1 $\times$ conflict frame index medium 1) + (…) + (exposure medium _n_ $\times$ conflict frame index medium _n_)]

From the media content data, each outlet has a conflict frame index. This is the proportion of news items with a conflict frame from the total news items in the campaign that were about the EU/EP elections. 

The first step carried out by SVdV includes a hierarchical model, with observations nested in countries, where the probability to turn out in the EP elections is a function of both news exposure and _news conflict_. In addition they control for other variables. After this model including both predictors, SVdV (p. 11) turn to models including only _news conflict_: "[...] however, the model in Table 2 includes conflict news [but not mere news exposure] in light of previous findings" (SVdV, p. 11). These reasons can be that news exposure had a substantively small effect, a negative effect, and/or that adding _news conflict_ to the full model (in Table 1, SVdV) resulted in significant model fit improvement. We assess these decisions below, focusing on the substantive features.[^fn-30] In the subsequent steps of the analysis, SVdV evaluate whether the effect of _news conflict_ on turnout varies across countries and finally, whether that variation can be explained by country level features of the media content, modeled as cross-level interaction between polity evaluations and _news conflict_.

[^fn-30]: An analysis of the "model-fit improvement argument" is presented in _Supplementary Information_ __B__.

The authors note that there is a substantial correlation between _news conflict_ and news exposure, $r = 0.89$. Ideally, the inclusion of news exposure would be required to tap into the specific effects of conflict. Using models with only one media predictor appears to be an empirical necessity, given the multicollinearity issue. Thus, the decision of which predictor should be used and how the chosen predictor relates __substantively__ to the excluded operationalization becomes the most important step of the analysis, and basing this decision solely on model results with serious multicollinearity issues is misleading.

While SVdV do not discuss in detail the properties of the scenario with both predictors included in one model, this model raises several interpretation difficulties. Within one country, two individuals can have the same summed news exposure score with different per outlet consumption frequency and this will translate into potential differences in their _news conflict_ scores. This difference is a function of the variation in outlet conflict scores and how much their media consumption vector differs. The strict interpretation of coefficients would imply the classic "everything else held constant", the effect of news exposure or news conflict is the associated $\beta$ coefficient. First, we know -- given the correlation between the two predictors -- that in most cases, _news conflict_ and news exposure will change together. News exposure had a small negative effect -- discussed below in detail why the magnitude is problematic -- when _news conflict is held constant_. This would entail at least __some__ variation of news exposure __at each level__ of the _news conflict_. In 65% of the cases in the corrected dataset, one _news conflict_ value within a country is associated with one news exposure value. More strikingly, in 97% of the cases, the number of unique values of news exposure for a fixed _news conflict_ value range between 1 and 3, questioning how meaningful the news exposure coefficient (or the _news conflict_ for that matter) can be in the initial model reported by SVdV.

\begin{figure}[h!]
 \caption*[]%
  {Figure 1: News exposure and news conflict, correlations\clfootnote[0]{}}
\vbox{
    \begin{minipage}{0.5\textwidth}
        \centering
        \captionsetup[figure]{labelformat=empty}
        \caption*[]{(A)}
    \includegraphics[scale = 0.5]{f1-a.pdf}
    \end{minipage}
    \begin{minipage}{0.48\textwidth}
        \centering
                \caption*[]{(B)}
        \includegraphics[scale = 0.5]{f1-b.pdf}
    \end{minipage}
    \begin{minipage}{\textwidth}
        \centering
                \caption*[]%
  {\clfootnote[0]{Panel (A): Country level Pearson's correlations between news conflict and news exposure, 21 countries, corrected measures. Panel (B): Country level polyserial correlations between news conflict and turnout (black) and news exposure and turnout (gray), 21 countries, corrected measures. Error bars: 95\% confidence intervals.}}
    \end{minipage}
}
\end{figure}

To address how serious the multicollinearity issue is, we first show that the correlation for the pooled-data is misleading. In reality, as displayed in Panel A of Figure 1, these correlations are close to $1.0$ in most countries, except Lithuania, where we have the lowest degree of country-level conflict. The second lowest correlation is for Belgium, but as the value is for country and not political system (Walloon vs. Flanders), this comes as no surprise. In short, this suggests that _news conflict_ is merely a rescaling of the news exposure variable. 

The "weighted" index nature of _news conflict_ results in substantially different ranges for news exposure and _news conflict_, but SVdV present, discuss, and base their decisions on unstandardized coefficients. We deem this as a misleading interpretation _per se_, e.g. the interpretation of the coefficient for news exposure as small in comparison to _news conflict_ (SVdV, Table 1, p. 11) and show that, when standardized, and hence comparable, coefficients are used, the dismissal of news exposure in favor of _news conflict_ becomes less straight forward. The first indication that this choice of reporting is problematic is displayed in Panel B of Figure 1. When looking at the zero-order correlations in each country between turnout and the two exposure variables, we find -- unsurprisingly, as there is a close-to-perfect collinearity in most countries -- that the bivariate relationships are very similar. 

For the multivariate setting, we recoded the two predictors to account for the difference in scales. After this, we are convinced that the decision made by SVdV on the basis of the unstandardized coefficients is erroneous. We group-mean centered the two predictors[^fn-31] and divided them by their standard deviation. In Table 1 we report four models with the newly recoded variables.

[^fn-31]: As the goal is to get _cleaner_ estimates for the slopes that vary across groups, we use group mean centering following the recommendations by @enders07. 

\begin{table}[h!] 
\centering 
\singlespacing
\footnotesize
\resizebox{0.8\textwidth}{!}{\begin{minipage}{\textwidth}
\caption{Multivariate model results: news exposure vs. news conflict} 
  \label{} 
\begin{tabular}{@{\extracolsep{0pt}}lD{.}{.}{-3} D{.}{.}{-3} D{.}{.}{-3} D{.}{.}{-3} } 
\\\hline 
& \multicolumn{1}{c}{News exposure} & \multicolumn{1}{c}{News conflict} & \multicolumn{1}{c}{News exposure} & \multicolumn{1}{c}{News conflict}\\ 
& \multicolumn{1}{c}{only} & \multicolumn{1}{c}{only} & \multicolumn{1}{c}{interaction} & \multicolumn{1}{c}{interaction}\\ 
\hline 
News exposure & 0.038^{**} & - & 0.051^{*} & - \\ 
              & (0.018) &  & (0.026) &  \\ 
News conflict & - & 0.048^{***} & - & 0.061^{**} \\ 
              &  & (0.018) &  & (0.025) \\ 
News exposure $\times$ Polity evaluations & - & - & 0.293 & - \\ 
  &  &  & (0.224) &  \\ 
News conflict $\times$ Polity evaluations & - & - & - & 0.313 \\ 
  &  &  &  & (0.212) \\ 
Polity evaluations & 0.167 & 0.170 & 0.064 & 0.065 \\ 
  & (1.148) & (1.148) & (1.157) & (1.157) \\ 
 All other controls & \multicolumn{1}{c}{Yes} & \multicolumn{1}{c}{Yes} & \multicolumn{1}{c}{Yes} & \multicolumn{1}{c}{Yes} \\ 
\hline 
Observations & \multicolumn{1}{c}{22,792} & \multicolumn{1}{c}{22,792} & \multicolumn{1}{c}{22,792} & \multicolumn{1}{c}{22,792} \\ 
Log Likelihood & \multicolumn{1}{c}{-11,571.350} & \multicolumn{1}{c}{-11,570.050} & \multicolumn{1}{c}{-11,567.650} & \multicolumn{1}{c}{-11,567.090} \\ 
AIC & \multicolumn{1}{c}{23,166.700} & \multicolumn{1}{c}{23,164.100} & \multicolumn{1}{c}{23,163.290} & \multicolumn{1}{c}{23,162.170} \\ 
\hline
\multicolumn{5}{l}{\textit{Note:} $^{*}$p$<$0.1; $^{**}$p$<$0.05; $^{***}$p$<$0.01} \\ 
\normalsize 
\end{tabular}
\end{minipage}}
\end{table} 

\begin{figure}[h!]
  \begin{minipage}{\textwidth}
    \centering
    \caption*[]%
  {Figure 2: News conflict vs. news exposure, cross-level interaction\clfootnote[0]{Predicted turnout as a function of news conflict (solid lines, based on news conflict only cross-level interaction model, Table 2) and news exposure (dotted lines, based on news conflict only cross-level interaction model, Table 2) for different polity evaluation levels (SP = Spain, SK = Slovakia, AT = Austria). All other variables fixed at values described in the text and by SVdV, predictions based on fixed-effects only. Predictors were group-mean centered and standardized (one SD, within country).}}
    \includegraphics[scale = 0.65]{f2.pdf}
    \end{minipage}
\end{figure}

All these models indicate that, when modeled separately, both news exposure and _news conflict_ have very similar influences on the outcome variable. When we assess the standardized coefficients and their standard errors, we can see that they overlap. Furthermore, the aim of Figure 1, Panel B is to stipulate this at the bivariate level. Accordingly, the major difference in the magnitude of the effects was a simple artifact of the reporting chosen by the authors.[^fn-32] When the cross-level interaction is modeled, news exposure is not statistically significant at the $p < 0.05$ level, but absence of evidence is not evidence for absence and using the thresholds proposed by SVdV, this effect is still statistically significant.

[^fn-32]: The results from a model including both exposure variables rescaled (as in Table 1, original article) are: news exposure $\beta = -0.144$ (SE = $0.074$), news conflict $\beta = 0.188$ (SE = $0.075$).

If the model comparisons or $p$ values larger than $0.05$ leave room for skepticism, we can always look at substantive differences and implications. Figure 2 presents the slopes for Spain, Slovakia and Austria (as reported by SVdV in Figure 2) for _news conflict_ and news exposure, estimated in separate models, using the full sample (21 countries) and corrected _news conflict_ (see _Supplementary Information_ __A__). We fail to see support for a conclusion that exposure to conflict instead of mere news exposure increases the likelihood of participating in the EP elections.

# The mobilizing effect of non-conflictual news: an illustration

While the high correlation between specific exposure and general news exposure shows the problem related to estimating the impact of specific content on political behavior, this does not necessarily mean that the proposed approach for linking media content features with individual exposure is necessarily wrong. However, we show through an extension of SVdV's work that the methodological contribution is unlikely to benefit the study of media effects on individual political behavior. Even if we assume that news conflict measures both exposure and the exposure to content, our example below focusing on non-conflictual news is intended to show that, substantively we could easily formulate the same conclusions about two opposite contextual situations. We use this section to show that with such the proposed operationalization, even if we disregard all the discussion about multicollinearity or results reporting, we are losing most information in substantive terms that is about context (or media content). Hence, evaluating what news conflict operationalized as such actually measures is really problematic. In our reading of the claims made in the paper, we should maybe expect no relationship or a negative relationship when it comes to news non-conflict.

We use the original media data [@schuck2010] to re-create the conflict scores at the outlet level and then merge it with the EES 2009 individual level data. Using SVdV's operationalization and the 2009 PIREDEU Media Study [@schuck2010], we calculate the outlet specific conflict score, using all four content variables indicated by the authors. Note that these are dichotomous indicators, 0 for no conflict, 1 for conflict. Each outlet can be described by an average level of conflict in their EU reporting throughout the whole coding period. Similarly, each outlet can be described by the average ratio of non-conflictual news. The degree of _news non-conflict_ will be $1 - \mbox{ news conflict}$. This means there should be a perfect negative correlation between these two outlet features. That is indeed the case in the Media Study, both at outlet and country level.[^fn40]

[^fn40]: Country level values for both variables, indicating that the conflict scores are in line with those reported by SVdV in Figure 1, are displayed in the first two columns of Table 1, _Supplementary Information_ __C__.  

Next, using the formula provided by SVdV and the EES data, we created the individual level _news conflict_ variable, but also a _news non-conflict_ variable, following the same logic, but multiplying outlet specific exposure with the outlet specific _news non-conflict_ score. The correlation between these two variables is $0.85$ on the full sample, with country specific correlation coefficients for these two variables and also mere news exposure reported in the last three columns of Table 1, _Supplementary Information_ __C__. From the theoretically grounded perfect negative correlation between the two variables at the outlet level we have ended up with an extremely strong __positive__ correlation in the individual level data. This is a joint effect of: the proposed method for linking the two levels together, and the measurement of conflict framing at the media item level.

While we do not have turnout intention measured in an earlier wave, we expect that the only implication is that the media coefficients will be larger compared to the ones reported in the previous section or the original study. However, how they compare to each other -- both effects and variables -- is independent of the turnout intention variable.[^fn-41] Otherwise, we used and coded all individual and country level variables employed in the original analysis, following the coding description from SVdV.[^fn-42]

[^fn-41]: The effect of group-mean centered _news conflict_ in the corrected 21 country SVdV dataset for Table 2 "fixed-effects model" without turnout intention is $\beta = 0.181$, SE = $0.017$. As seen below, the results on the full EES 2009 sample are comparable.

[^fn-42]: We were unable to get polity evaluations scores identical to the SVdV data, just by following the coding description. However, the correlation between the measure included in this set of analyses and those used by SVdV is $0.98$.

\begin{table}[h!] 
\centering 
  \caption{The impact of mere exposure, EES 2009} 
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
 Constant & -0.946^{***} & -0.950^{***} & -0.948^{***} \\ 
  & (0.138) & (0.138) & (0.138) \\
All controls & Yes & Yes & Yes \\ 
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

In Table 2 we present the results of interest from three turnout models on the EES data that mimic SVdV's "fixed-effects" model. Each model contains all individual and country level controls, with a varying-intercept. Full model results are reported in Table 3, _Supplementary Information_ __C__. The row "Exposure" contains the coefficients for the media variables, and each column head stipulates which exposure measure was used in the model. All three models indicate a positive effect of the exposure variables, independent of whether it is exposure multiplied by conflict or by non-conflict (see _Supplementary Information_ __C__ for model formula and descriptive statistics). Again, this result is due to the fact that even after applying the proposed transformations, we are essentially looking at a simple news exposure measure. Furthermore, this also indicates that, given the coding at the news item level, the proposed approach is unable to differentiate between qualitatively and quantitatively opposite media features, supplying coefficients heavily conflated by mere exposure.

# Conclusion

A decade ago, @slater2004 argued that a weakness of using self-reported measures of news exposure is the uncertainty about the content of the media, but that this "uncertainty can largely be removed when content analyses of those media are conducted in conjunction with the survey of exposure self-reports" (p. 169). Over the years, a large body of literature has used this approach with great optimism, employing different solutions for linking these sources of information. In this paper we question fundamental but so far not addressed properties of one approach, showing the deficiencies resulting from important methodological decisions. 

Theories of how the media presentation of political news could affect individual attitudes and behavior have become more fine grained throughout time. Testing these theories requires that the measurement and operationalization accurately captures such fine grained differences. Summarizing rich content data by features reflecting the prevalence of some frames marks the start of the groundwork for testing content related heterogeneity. However, as we have shown, relevant and meaningful differences at the content level can get lost through the attempted linking of these features with individual exposure measures. While an explicit focus on content is both desirable and assures that we put meaning behind media consumption, the methodological steps to actually maintain the added content related features deserve future attention. Otherwise, the rich content information is lost, and the gap between the refined theory and its empirical test widens to an extent that the added value disappears.

This was the case in the paper chosen for illustration purposes. We had to realize that with the available measurement and proposed method we do not get very far, which questions the substantive contribution of the original paper. To be more precise, we get to the same place when we focus on the effects of exposure to conflict vs. effects of exposure to non-conflict. Using SVdV's approach for integrating media and individual specific features we are still basing most of our conclusions on mere media exposure. In substantive terms, we find that individuals with average media exposure are more likely to turn out to vote. This is hardly as impressive as being able to settle the cited debate on whether exposure to conflict has positive or negative effects. Thus, we are left with a situation in which, separately both media and individual characteristics are important, but the how they were linked to create a more meaningful measure backfires, losing the added value on both levels. 

The broader methodological implications of the original piece are important for researchers in terms of how one _should_ combine media content features and individual exposure to __that__ particular content. So are the risks of the approach proposed. As in most cases, there are no easy solutions. However, the first -- and arguably most important -- step in such analyses should be an extensive discussion on the measurement and empirical properties of how the content information is merged with individual exposure. As presented above, many of the detailed checks on the correlation patterns and detailed comparison of the substantive implications already flag the issues of the operationalization. Once this step is carried out, it is clear that the operationalization needs enhancement, or the limitations should be explicitly stipulated.

Overall, based on the work that we carried out so far, there are straight forward quantifiable and serious issues whenever the outlet level features are thought of in terms of proportions/composition. While not completely independent of the distribution of these outlet scores, this issue will be a serious one even in the best and very unlikely scenarios. When outlet level features are differently coded, a joint estimation of the weighted and unweighted measures might be possible (further simulations would be needed to address this issue), but in that case, the researchers should discuss very much in detail the characteristics of the the weighted index. A beneficial next step for future research is to extend the analysis to such cases as well, establishing whether the composite measures are indeed able to capture the desired content related features. Through these extensions and further reliability and validity assessments of the linking approaches, researchers can pave the road towards a unified methodological approach for incorporating, and then comparatively assessing, the role of content conditional on exposure -- or the role of exposure, conditional on content -- in observational media studies. We believe that such analyses will also inform where and how data collection, coding, and study designs can be improved to assure that we are testing the theories we intend to.

To conclude, news exposure is not an empty shell and there are profound reasons to believe that specific content in the news media matter for political outcomes in predictable ways. In most cases, mere media exposure is of little interest by itself and is useful due to its function as a proxy of exposure to specific content, e.g. exposure to news as a proxy for exposure to political content. Hence, there are important reasons for scholars to examine how specific content -- in experimental as well as observational research -- matter for citizens' political attitudes and behavior. For observational research the challenge is to disentangle how specific content matter vis-a-vis other types of content. 

# References
\indent
\setlength{\parindent}{-0.2in}
\setlength{\leftskip}{0.2in}
\setlength{\parskip}{8pt}