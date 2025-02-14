#' ---
#' title: "ANCOVA test for `prevention.pos`~`prevention.pre`+`testType`*`gender`"
#' author: Geiser C. Challco <geiser@alumni.usp.br>
#' comment: This file is automatically generate by Shiny-Statistic app (https://statistic.geiser.tech/)
#'          Author - Geiser C. Challco <geiser@alumni.usp.br>
#'          
#'          Shiny-Statistic is distributed in the hope that it will be useful,
#'          but WITHOUT ANY WARRANTY; without even the implied warranty of
#'          MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#'          GNU General Public License for more details.
#'          
#'          You should have received a copy of the GNU General Public License.
#'          If not, see <https://www.gnu.org/licenses/>.
#' output:
#'   github_document:
#'     toc: true
#'   word_document:
#'     toc: true
#'   html_document:
#'     toc: true
#' fontsize: 10pt
#' ---
#' 
## ----setup, include=FALSE-----------------------------------------------------
## Install and Load Packages
if (!'remotes' %in% rownames(installed.packages())) install.packages('remotes')
if (!"rshinystatistics" %in% rownames(installed.packages())) {
  remotes::install_github("geiser/rshinystatistics")
} else if (packageVersion("rshinystatistics") < "0.0.0.9300") {
  remotes::install_github("geiser/rshinystatistics")
}

wants <- c('ggplot2','ggpubr','rshinystatistics','utils')
has <- wants %in% rownames(installed.packages())
if (any(!has)) install.packages(wants[!has])

library(utils)
library(ggpubr)
library(ggplot2)
library(rshinystatistics)

#' 

#' 
#' ## Initial Variables and Data
#' 
#' * R-script file: [../code/ancova.R](../code/ancova.R)
#' * Initial table file: [../data/initial-table.csv](../data/initial-table.csv)
#' * Data for prevention.pos [../data/table-for-prevention.pos.csv](../data/table-for-prevention.pos.csv)
#' * Table without outliers and normal distribution of  data: [../data/table-with-normal-distribution.csv](../data/table-with-normal-distribution.csv)
#' * Other data files: [../data/](../data/)
#' * Files related to the presented results: [../results/](../results/)
#' 
#' 
## ---- include=FALSE-----------------------------------------------------------
wid <- "responseId"
covar <- "prevention.pre"
between <- c("testType","gender")
dvs <- c("prevention.pos")
names(dvs) <- dvs

dat <- lapply(dvs, FUN = function(dv) {
  data <- read.csv(paste0("../data/table-for-",dv,".csv"))
  rownames(data) <- data[["responseId"]]
  return(data)
})
rdat <- dat
sdat <- dat

#' 
#' ### Descriptive statistics of initial data
#' 
## ---- include=FALSE-----------------------------------------------------------
df <- dat; df[[covar]] <- dat[[1]]
(df <- get.descriptives(df, dvs, between, include.global = T, symmetry.test = T))

#' 

#' 
## ---- echo=FALSE--------------------------------------------------------------
car::Boxplot(`prevention.pos` ~ `testType`*`gender`, data = dat[["prevention.pos"]], id = list(n = Inf))

#' 
#' ## Checking of Assumptions
#' 
#' ### Assumption: Symmetry and treatment of outliers
#' 
#' #### Applying transformation for skewness data when normality is not achieved
#' 
#' 
#' 
#' #### Dealing with outliers (performing treatment of outliers)
#' 
#' 
#' 
#' ### Assumption: Normality distribution of data
#' 
#' #### Removing data that affect normality (extreme values)
#' 
## -----------------------------------------------------------------------------
non.normal <- list(

)
sdat <- removeFromDataTable(rdat, non.normal, wid)

#' 
#' #### Result of normality test in the residual model
#' 
## ---- include=FALSE-----------------------------------------------------------
(df <- normality.test.by.residual(sdat, dvs, between, c(), covar))

#' 

#' 
#' #### Result of normality test in each group
#' 
#' This is an optional validation and only valid for groups with number greater than 30 observations
#' 
## ---- include=FALSE-----------------------------------------------------------
(df <- get.descriptives(sdat, dvs, between, include.global = F, normality.test = T))

#' 

#' 
#' **Observation**:
#' 
#' As sample sizes increase, parametric tests remain valid even with the violation of normality [[1](#references)].
#' According to the central limit theorem, the sampling distribution tends to be normal if the sample is large, more than (`n > 30`) observations.
#' Therefore, we performed parametric tests with large samples as described as follows: 
#' 
#' - In cases with the sample size greater than 100 (`n > 100`), we adopted a significance level of `p < 0.01`
#' 
#' - For samples with `n > 50` observation, we adopted D'Agostino-Pearson test
#' that offers better accuracy for larger samples [[2](#references)].
#' 
#' - For samples' size between `n > 100` and `n <= 200`, we ignored the normality test,
#' and our decision of validating normality was based only in the interpretation of QQ-plots
#' and histograms because the Shapiro-Wilk and D'Agostino-Pearson tests tend to be too sensitive
#' with values greater than 200 observation [[3](#references)].
#' 
#' - For samples with `n > 200` observation, we ignore the normality assumption based on the central theorem limit.
#' 
#' 
#' 
#' ### Assumption: Linearity of dependent variables and covariate variable 
#' 
## -----------------------------------------------------------------------------
ggscatter(sdat[["prevention.pos"]], x=covar, y="prevention.pos", facet.by=between, short.panel.labs = F) + 
 stat_smooth(method = "lm", span = 0.9)

#' 
#' 
#' 
#' 
#' 
#' ### Assumption: Homogeneity of data distribution
#' 
## ---- include=FALSE-----------------------------------------------------------
(df <- homogeneity.test(sdat, dvs, between, c(), covar))

#' 

#' 
#' ## Saving the Data with Normal Distribution Used for Performing ANCOVA test 
#' 
## -----------------------------------------------------------------------------
ndat <- sdat[[1]]
for (dv in names(sdat)[-1]) ndat <- merge(ndat, sdat[[dv]])
write.csv(ndat, paste0("../data/table-with-normal-distribution.csv"))

#' 
#' Descriptive statistics of data with normal distribution
#' 
## ---- include=FALSE-----------------------------------------------------------
(df <- get.descriptives(sdat, dvs, between))

#' 

#' 
## ---- echo=FALSE--------------------------------------------------------------
for (dv in dvs) {
  car::Boxplot(`dv` ~ `testType`*`gender`, data = sdat[[dv]] %>% cbind(dv=sdat[[dv]][[dv]]), id = list(n = Inf))  
}

#' 
#' ## Computation of ANCOVA test and Pairwise Comparison
#' 
#' ### ANCOVA test
#' 
## ---- include=FALSE-----------------------------------------------------------
aov <- ancova.test(sdat, dvs, between, covar, 2, "ges")
(adf <- get.ancova.table(aov))

#' 

#' 
#' ### Pairwise comparison
#' 
## ---- include=FALSE-----------------------------------------------------------
pwc <- ancova.pwc(sdat, dvs, between, covar, p.adjust.method = "bonferroni")
(pdf <- get.ancova.pwc.table(pwc, only.sig = F))

#' 

#' 
#' ### Descriptive Statistic of Estimated Marginal Means
#' 
## ---- include=FALSE-----------------------------------------------------------
(emms <- get.ancova.emmeans.with.ds(pwc, sdat, dvs, between, "common", covar = covar))

#' 

#' 
#' 
#' ### Ancova plots for the dependent variable "prevention.pos"
## -----------------------------------------------------------------------------
plots <- twoWayAncovaPlots(sdat[["prevention.pos"]], "prevention.pos", between
, aov[["prevention.pos"]], pwc[["prevention.pos"]], addParam = c("jitter"), font.label.size=14, step.increase=0.25)

#' 
#' #### Plot for: `prevention.pos` ~ `testType`
## ---- fig.width=7, fig.height=7-----------------------------------------------
plots[["testType"]]

#' 
#' 
#' #### Plot for: `prevention.pos` ~ `gender`
## ---- fig.width=7, fig.height=7-----------------------------------------------
plots[["gender"]]

#' 
#' 
#' 
#' ### Textual Report
#' 
#' After controlling the linearity of covariance "prevention.pre", ANCOVA tests with independent between-subjects variables "testType" (stFemale, stMale, default) and "gender" (Masculino, Feminino) were performed to determine statistically significant difference on the dependent varibles "prevention.pos". For the dependent variable "prevention.pos", there was not statistically significant effects.
#' 
#' 
#' 
#' 
#' 
#' ## Tips and References
#' 
#' - Use the site [https://www.tablesgenerator.com](https://www.tablesgenerator.com) to convert the HTML tables into Latex format
#' 
#' - [2]: Miot, H. A. (2017). Assessing normality of data in clinical and experimental trials. J Vasc Bras, 16(2), 88-91.
#' 
#' - [3]: Bárány, Imre; Vu, Van (2007). "Central limit theorems for Gaussian polytopes". Annals of Probability. Institute of Mathematical Statistics. 35 (4): 1593–1621.
#' 
