#' ---
#' title: "ANOVA test for `activityPoints`~`Condition`"
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
} else if (packageVersion("rshinystatistics") < "0.0.0.9301") {
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
#' * Data for activityPoints [../data/table-for-activityPoints.csv](../data/table-for-activityPoints.csv)
#' * Table without outliers and normal distribution of  data: [../data/table-with-normal-distribution.csv](../data/table-with-normal-distribution.csv)
#' * Other data files: [../data/](../data/)
#' * Files related to the presented results: [../results/](../results/)
#' 
#' 
## ---- include=FALSE-----------------------------------------------------------------------------------------------------------------------------
wid <- "responseId"

between <- c("Condition")
dvs <- c("activityPoints")
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
car::Boxplot(`activityPoints` ~ `Condition`, data = dat[["activityPoints"]], id = list(n = Inf))

#' 
#' ## Checking of Assumptions
#' 
#' ### Assumption: Symmetry and treatment of outliers
#' 
#' #### Applying transformation for skewness data when normality is not achieved
#' 
#' 
#'  Applying transformation in "activityPoints" to reduce skewness
#' 
## -----------------------------------------------------------------------------------------------------------------------------------------------
density.plot.by.residual(rdat[["activityPoints"]],"activityPoints",between)
rdat[["activityPoints"]][["activityPoints"]] <- sqrt(max(dat[["activityPoints"]][["activityPoints"]]+1) - dat[["activityPoints"]][["activityPoints"]])
density.plot.by.residual(rdat[["activityPoints"]],"activityPoints",between)

#' 
#' 
#' 
#' #### Dealing with outliers (performing treatment of outliers)
#' 
## -----------------------------------------------------------------------------------------------------------------------------------------------
rdat[["activityPoints"]] <- winzorize(rdat[["activityPoints"]],"activityPoints", c("Condition"))


#' 
#' ### Assumption: Normality distribution of data
#' 
#' #### Removing data that affect normality (extreme values)
#' 
## -----------------------------------------------------------------------------------------------------------------------------------------------
non.normal <- list(
"activityPoints" = c("bb421410-9e34-11eb-9b7e-0daf340a71ab","46f906c0-9e36-11eb-9b7e-0daf340a71ab","a4947eb0-a456-11eb-8cbb-599e427a3fce","eb7bfbc0-a79c-11eb-8cbb-599e427a3fce","d7506eb0-a81e-11eb-8cbb-599e427a3fce","a9467110-a853-11eb-8cbb-599e427a3fce","e7bb7ec0-b057-11eb-b944-15c8c1c6ce71","5ca44270-b19e-11eb-b944-15c8c1c6ce71","16027280-b1dd-11eb-b944-15c8c1c6ce71","8eba26c0-b1ea-11eb-b944-15c8c1c6ce71","108b6210-b649-11eb-ad27-3593da35795f","b86c5a00-c0be-11eb-93e6-43229aa359ae","b7ecef30-dbf9-11eb-916d-ef9a5fc9a834","890928c0-df62-11eb-bf23-972ef7bdc96c","2145a1e0-df63-11eb-bf23-972ef7bdc96c","d9957860-df63-11eb-bf23-972ef7bdc96c","b42f8980-efb7-11eb-991d-7bf2f9a6c3b9","9d1ee580-f6ea-11eb-991d-7bf2f9a6c3b9","169a9c00-9e22-11eb-9b7e-0daf340a71ab","9186bb20-a47f-11eb-8cbb-599e427a3fce","d7a07110-df61-11eb-bf23-972ef7bdc96c","67a97540-df62-11eb-bf23-972ef7bdc96c","7cc13d00-df62-11eb-bf23-972ef7bdc96c","412915a0-df63-11eb-bf23-972ef7bdc96c")
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
#' ### Anova plots for the dependent variable "activityPoints"
## -----------------------------------------------------------------------------------------------------------------------------------------------
plots <- oneWayAnovaPlots(sdat[["activityPoints"]], "activityPoints", between, aov[["activityPoints"]], pwc[["activityPoints"]], c("jitter"), font.label.size=14, step.increase=0.25)

#' 
#' 
#' #### Plot of "activityPoints" based on "Condition"
## ---- fig.width=7, fig.height=7-----------------------------------------------------------------------------------------------------------------
plots[["Condition"]]

#' 
#' 
#' 
#' ### Textual Report
#' 
#' ANOVA tests with independent between-subjects variables "Condition" (control, inBoost, inThreat) were performed to determine statistically significant difference on the dependent varibles "activityPoints". For the dependent variable "activityPoints", there was not statistically significant effects.
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
