#' ---
#' title: "ANOVA test for `dejection,cheerfulness,agitation,quiescence`~`Condition`"
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
## ----setup, include=FALSE-----------------------------------------------------------------------------------------------------------------------
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
#' * R-script file: [../code/anova.R](../code/anova.R)
#' * Initial table file: [../data/initial-table.csv](../data/initial-table.csv)
#' * Data for dejection [../data/table-for-dejection.csv](../data/table-for-dejection.csv)
#' * Data for cheerfulness [../data/table-for-cheerfulness.csv](../data/table-for-cheerfulness.csv)
#' * Data for agitation [../data/table-for-agitation.csv](../data/table-for-agitation.csv)
#' * Data for quiescence [../data/table-for-quiescence.csv](../data/table-for-quiescence.csv)
#' * Table without outliers and normal distribution of  data: [../data/table-with-normal-distribution.csv](../data/table-with-normal-distribution.csv)
#' * Other data files: [../data/](../data/)
#' * Files related to the presented results: [../results/](../results/)
#' 
#' 
## ---- include=FALSE-----------------------------------------------------------------------------------------------------------------------------
wid <- "responseId"

between <- c("Condition")
dvs <- c("dejection","cheerfulness","agitation","quiescence")
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
## ---- include=FALSE-----------------------------------------------------------------------------------------------------------------------------
(df <- get.descriptives(dat, dvs, between, include.global = T, symmetry.test = T))

#' 

#' 
## ---- echo=FALSE--------------------------------------------------------------------------------------------------------------------------------
car::Boxplot(`dejection` ~ `Condition`, data = dat[["dejection"]], id = list(n = Inf))
car::Boxplot(`cheerfulness` ~ `Condition`, data = dat[["cheerfulness"]], id = list(n = Inf))
car::Boxplot(`agitation` ~ `Condition`, data = dat[["agitation"]], id = list(n = Inf))
car::Boxplot(`quiescence` ~ `Condition`, data = dat[["quiescence"]], id = list(n = Inf))

#' 
#' ## Checking of Assumptions
#' 
#' ### Assumption: Symmetry and treatment of outliers
#' 
#' #### Applying transformation for skewness data when normality is not achieved
#' 
#' 
#'  Applying transformation in "dejection" to reduce skewness
#' 
## -----------------------------------------------------------------------------------------------------------------------------------------------
density.plot.by.residual(rdat[["dejection"]],"dejection",between)
rdat[["dejection"]][["dejection"]] <- log10(dat[["dejection"]][["dejection"]])
density.plot.by.residual(rdat[["dejection"]],"dejection",between)

#' 
#' 
#' 
#' 
#'  Applying transformation in "agitation" to reduce skewness
#' 
## -----------------------------------------------------------------------------------------------------------------------------------------------
density.plot.by.residual(rdat[["agitation"]],"agitation",between)
rdat[["agitation"]][["agitation"]] <- sqrt(dat[["agitation"]][["agitation"]])
density.plot.by.residual(rdat[["agitation"]],"agitation",between)

#' 
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
## -----------------------------------------------------------------------------------------------------------------------------------------------
non.normal <- list(
"dejection" = c("18379910-9df4-11eb-9b7e-0daf340a71ab","4b9fd020-9e02-11eb-9b7e-0daf340a71ab","a9467110-a853-11eb-8cbb-599e427a3fce","e7bb7ec0-b057-11eb-b944-15c8c1c6ce71","c5d98fb0-b1c7-11eb-b944-15c8c1c6ce71","3cbe7e50-b25a-11eb-b944-15c8c1c6ce71","108b6210-b649-11eb-ad27-3593da35795f","b7ecef30-dbf9-11eb-916d-ef9a5fc9a834","9d1ee580-f6ea-11eb-991d-7bf2f9a6c3b9","d23aa670-9d47-11eb-9b7e-0daf340a71ab","09bbd000-9e39-11eb-9b7e-0daf340a71ab","eb0ea380-aeb9-11eb-8cbb-599e427a3fce","f343a310-df61-11eb-bf23-972ef7bdc96c","412915a0-df63-11eb-bf23-972ef7bdc96c","e6b9afe0-efb5-11eb-991d-7bf2f9a6c3b9","56024dd0-efb6-11eb-991d-7bf2f9a6c3b9")
)
sdat <- removeFromDataTable(rdat, non.normal, wid)

#' 
#' #### Result of normality test in the residual model
#' 
## ---- include=FALSE-----------------------------------------------------------------------------------------------------------------------------
(df <- normality.test.by.residual(sdat, dvs, between))

#' 

#' 
#' #### Result of normality test in each group
#' 
#' This is an optional validation and only valid for groups with number greater than 30 observations
#' 
## ---- include=FALSE-----------------------------------------------------------------------------------------------------------------------------
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
#' 
#' 
#' ### Assumption: Homogeneity of data distribution
#' 
## ---- include=FALSE-----------------------------------------------------------------------------------------------------------------------------
(df <- homogeneity.test(sdat, dvs, between))

#' 

#' 
#' ## Saving the Data with Normal Distribution Used for Performing ANOVA test 
#' 
## -----------------------------------------------------------------------------------------------------------------------------------------------
ndat <- sdat[[1]]
for (dv in names(sdat)[-1]) ndat <- merge(ndat, sdat[[dv]])
write.csv(ndat, paste0("../data/table-with-normal-distribution.csv"))

#' 
#' Descriptive statistics of data with normal distribution
#' 
## ---- include=FALSE-----------------------------------------------------------------------------------------------------------------------------
(df <- get.descriptives(sdat, dvs, between))

#' 

#' 
## ---- echo=FALSE--------------------------------------------------------------------------------------------------------------------------------
for (dv in dvs) {
  car::Boxplot(`dv` ~ `Condition`, data = sdat[[dv]] %>% cbind(dv=sdat[[dv]][[dv]]), id = list(n = Inf))  
}

#' 
#' ## Computation of ANOVA test and Pairwise Comparison
#' 
#' ### ANOVA test
#' 
## ---- include=FALSE-----------------------------------------------------------------------------------------------------------------------------
aov <- anova.test(sdat, dvs, between, type=2, effect.size="ges")
(adf <- get.anova.table(aov))

#' 

#' 
#' ### Pairwise comparison
#' 
## ---- include=FALSE-----------------------------------------------------------------------------------------------------------------------------
pwc <- anova.pwc(sdat, dvs, between, p.adjust.method = "bonferroni")
(pdf <- get.anova.pwc.table(pwc, only.sig = F))

#' 

#' 
#' ### Descriptive Statistic of Estimated Marginal Means
#' 
## ---- include=FALSE-----------------------------------------------------------------------------------------------------------------------------
(emms <- get.anova.emmeans.with.ds(pwc, sdat, dvs, between, "common"))

#' 

#' 
#' 
#' ### Anova plots for the dependent variable "dejection"
## -----------------------------------------------------------------------------------------------------------------------------------------------
plots <- oneWayAnovaPlots(sdat[["dejection"]], "dejection", between, aov[["dejection"]], pwc[["dejection"]], c("jitter"), font.label.size=14, step.increase=0.25)

#' 
#' 
#' #### Plot of "dejection" based on "Condition"
## ---- fig.width=7, fig.height=7-----------------------------------------------------------------------------------------------------------------
plots[["Condition"]]

#' 
#' 
#' 
#' ### Anova plots for the dependent variable "cheerfulness"
## -----------------------------------------------------------------------------------------------------------------------------------------------
plots <- oneWayAnovaPlots(sdat[["cheerfulness"]], "cheerfulness", between, aov[["cheerfulness"]], pwc[["cheerfulness"]], c("jitter"), font.label.size=14, step.increase=0.25)

#' 
#' 
#' #### Plot of "cheerfulness" based on "Condition"
## ---- fig.width=7, fig.height=7-----------------------------------------------------------------------------------------------------------------
plots[["Condition"]]

#' 
#' 
#' 
#' ### Anova plots for the dependent variable "agitation"
## -----------------------------------------------------------------------------------------------------------------------------------------------
plots <- oneWayAnovaPlots(sdat[["agitation"]], "agitation", between, aov[["agitation"]], pwc[["agitation"]], c("jitter"), font.label.size=14, step.increase=0.25)

#' 
#' 
#' #### Plot of "agitation" based on "Condition"
## ---- fig.width=7, fig.height=7-----------------------------------------------------------------------------------------------------------------
plots[["Condition"]]

#' 
#' 
#' 
#' ### Anova plots for the dependent variable "quiescence"
## -----------------------------------------------------------------------------------------------------------------------------------------------
plots <- oneWayAnovaPlots(sdat[["quiescence"]], "quiescence", between, aov[["quiescence"]], pwc[["quiescence"]], c("jitter"), font.label.size=14, step.increase=0.25)

#' 
#' 
#' #### Plot of "quiescence" based on "Condition"
## ---- fig.width=7, fig.height=7-----------------------------------------------------------------------------------------------------------------
plots[["Condition"]]

#' 
#' 
#' 
#' ### Textual Report
#' 
#' ANOVA tests with independent between-subjects variables "Condition" (inThreat, inBoost, control) were performed to determine statistically significant difference on the dependent varibles "dejection", "cheerfulness", "agitation", "quiescence". For the dependent variable "dejection", there was not statistically significant effects.
#' For the dependent variable "cheerfulness", there was not statistically significant effects.
#' For the dependent variable "agitation", there was not statistically significant effects.
#' For the dependent variable "quiescence", there was not statistically significant effects.
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
