Media content and political behavior in observational research: A critical assessment
---

### Description

Supporting material for the research note at the British Journal of Political Science. Both authors contributed equally. Please address correspondence to both authors. Replication material on [https://github.com/zfazekas/bjps-conflict](https://github.com/zfazekas/bjps-conflict). Please contact us, or preferably use Issues to signal any problems or additional requests.

### Authors:

 - Erik Gahner Larsen, University of Southern Denmark, egl@sam.sdu.dk 
 - Zoltan Fazekas, University of Southern Denmark, zfa@sam.sdu.dk

### Data sources

- Schuck et al (2014) replication data available at the [BJPS](http://journals.cambridge.org/action/displaySuppMaterial?cupCode=1&type=4&jid=JPS&volumeId=-1&issueId=-1&aid=9172993&sessionId=22BEC4038D1882E0FDD23D34CA518A2F.journals) website, institutional login/subscription required for access: in scripts as `S0007123413000525sup001.sav`
- PIREDEU media data from [GESIS](https://dbk.gesis.org/dbksearch/sdesc2.asp?no=5056&db=e&doi=10.4232/1.10203), free login required: in scripts as `ZA5056_v1-0-0.dta`
- PIREDEU voter study from [GESIS](http://info1.gesis.org/dbksearch/sdesc2.asp?no=5055&db=e&doi=10.4232/1.10202), free login required: in scripts as `ZA5055_v1-1-0.dta`

- Note: we are looking into options for hosting these data files such that these logins and subscriptions are not necessary. However, the scripts are set up to take input the _most raw_ (or _rawest possible_?) versions of the data files. We might just cut versions of the original data files including only the variables used.

### Repository contents

#### Scripts (/R/ and /STATA/)

- Scripts to produce the analyses reported can be found in the `/R/` folder and the `/STATA/` folder respectively
- Both scripts contain __all__ steps, starting from the original data that can be downloaded from the respective websites (see above)
- The scripts are grouped following the original submission structure 
- In `/R/`:
    - `bjps-functions.R` = set of helper functions used in the analyses
    - `bjps-replication.R` = contains all analyses that use the data from the original piece (Section 2 and 3, and SI.A, SI.B in the present paper)
    - `bjps-extension.R` = contains all analyses for the extension using the 2009 EES data (Section 4 and SI.C in the present paper)
    - `sessionInfo.txt` = session information
- In `/STATA/`:
    - `bjps-replication.do` = all the analyses the pertain reproduction, replication, and corrections using the data from the original piece (Section 2 and 3, and SI.A, SI.B in the present paper)
    - `bjps-extension.do` = all the data preparation and analyses related to the extension using the 2009 EES data (Section 4 and SI.C in the present paper)
- Results reported in the paper are based on the analysis carried out in `R`. Results from `Stata` are identical essentially, with minor differences at the 3rd-4th decimals.

#### `/data/`

- If repository forked or downloaded for replication purposes, all downloaded original datasets should be placed in this folder and the scripts will run automatically (assuming you have set that once you open an R script, for example, the current working directory will be in `/R/`)
- `country-vars.csv`: dataset with two contextual variables (compVote = compulsory voting, and simElec = simultaneous national elections) and a country ID variable. This is only used by the `R` scripts, and it is equally possible to simply create these variables within the script. Coding is based on SVdV's coding for the countries in their analysis, and for the rest of the countries it was compiled by the authors.

#### `/paper/` - PENDING

- `bjps-conflict-main.md` = Original main text version (submitted)
- `bjps-conflict-si.md` = Original supplementary materials version (submitted)
- `Makefile` = Makefile to create PDF document (uses style and bibliography file)

#### `/style/`

- `bjps-conflict.template` = LaTeX template used with pandoc for PDF creation; requires having Minion Pro font installed, otherwise comment out

#### `/bib/`    

- `bjps-conflict.bib` = references

#### `/figures/`

- `.png` files for figures
- `.pdf` files for figures

#### Producing PDF document

- Directly using the makefile in the `/paper/` folder 
- Or you can edit the commands therein

#### Note on reproducibility

As we had to use a relatively large table presenting model results from `glmerMod` and we do like `dcolumn`, unfortunately script outputs were added to the markdown file manually, with some minor edit in terms of re-labeling and re-sizing. We are working on an `Rmarkdown` solution. 