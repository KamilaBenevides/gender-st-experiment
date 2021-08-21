ANCOVA test for `promotion.pos`\~`promotion.pre`+`testType`\*`gender`
================
Geiser C. Challco <geiser@alumni.usp.br>

-   [Initial Variables and Data](#initial-variables-and-data)
    -   [Descriptive statistics of initial
        data](#descriptive-statistics-of-initial-data)
-   [Checking of Assumptions](#checking-of-assumptions)
    -   [Assumption: Symmetry and treatment of
        outliers](#assumption-symmetry-and-treatment-of-outliers)
    -   [Assumption: Normality distribution of
        data](#assumption-normality-distribution-of-data)
    -   [Assumption: Linearity of dependent variables and covariate
        variable](#assumption-linearity-of-dependent-variables-and-covariate-variable)
    -   [Assumption: Homogeneity of data
        distribution](#assumption-homogeneity-of-data-distribution)
-   [Saving the Data with Normal Distribution Used for Performing ANCOVA
    test](#saving-the-data-with-normal-distribution-used-for-performing-ancova-test)
-   [Computation of ANCOVA test and Pairwise
    Comparison](#computation-of-ancova-test-and-pairwise-comparison)
    -   [ANCOVA test](#ancova-test)
    -   [Pairwise comparison](#pairwise-comparison)
    -   [Descriptive Statistic of Estimated Marginal
        Means](#descriptive-statistic-of-estimated-marginal-means)
    -   [Ancova plots for the dependent variable
        “promotion.pos”](#ancova-plots-for-the-dependent-variable-promotionpos)
    -   [Textual Report](#textual-report)
-   [Tips and References](#tips-and-references)

## Initial Variables and Data

-   R-script file: [../code/ancova.R](../code/ancova.R)
-   Initial table file:
    [../data/initial-table.csv](../data/initial-table.csv)
-   Data for promotion.pos
    [../data/table-for-promotion.pos.csv](../data/table-for-promotion.pos.csv)
-   Table without outliers and normal distribution of data:
    [../data/table-with-normal-distribution.csv](../data/table-with-normal-distribution.csv)
-   Other data files: [../data/](../data/)
-   Files related to the presented results: [../results/](../results/)

### Descriptive statistics of initial data

| testType | gender    | variable      |   n |  mean | median |  min |  max |    sd |    se |    ci |   iqr | symmetry | skewness | kurtosis |
|:---------|:----------|:--------------|----:|------:|-------:|-----:|-----:|------:|------:|------:|------:|:---------|---------:|---------:|
| default  | Feminino  | promotion.pos |  15 | 3.751 |   3.92 | 1.33 | 5.50 | 1.322 | 0.341 | 0.732 | 2.395 | YES      |   -0.253 |   -1.434 |
| default  | Masculino | promotion.pos |  28 | 2.580 |   2.46 | 1.38 | 4.13 | 0.896 | 0.169 | 0.347 | 1.532 | YES      |    0.206 |   -1.427 |
| stFemale | Feminino  | promotion.pos |  15 | 3.185 |   3.13 | 1.58 | 6.25 | 1.356 | 0.350 | 0.751 | 1.790 | NO       |    0.813 |   -0.316 |
| stFemale | Masculino | promotion.pos |  15 | 2.960 |   2.92 | 1.25 | 4.67 | 0.911 | 0.235 | 0.504 | 1.335 | YES      |    0.093 |   -0.888 |
| stMale   | Feminino  | promotion.pos |  14 | 3.296 |   3.15 | 1.75 | 5.67 | 1.013 | 0.271 | 0.585 | 0.430 | NO       |    0.659 |    0.076 |
| stMale   | Masculino | promotion.pos |  20 | 2.534 |   2.29 | 1.25 | 5.75 | 1.095 | 0.245 | 0.513 | 0.665 | NO       |    1.378 |    1.494 |
| NA       | NA        | promotion.pos | 107 | 2.967 |   2.92 | 1.25 | 6.25 | 1.145 | 0.111 | 0.219 | 1.710 | NO       |    0.682 |   -0.100 |

![](ancova_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

    ## [1] "3d203cb0-af41-11eb-b944-15c8c1c6ce71"
    ## [2] "56024dd0-efb6-11eb-991d-7bf2f9a6c3b9"
    ## [3] "86f372c0-efb6-11eb-991d-7bf2f9a6c3b9"
    ## [4] "d7092840-efb6-11eb-991d-7bf2f9a6c3b9"
    ## [5] "1160f4b0-a439-11eb-8cbb-599e427a3fce"
    ## [6] "d79c21e0-b1db-11eb-b944-15c8c1c6ce71"

## Checking of Assumptions

### Assumption: Symmetry and treatment of outliers

#### Applying transformation for skewness data when normality is not achieved

#### Dealing with outliers (performing treatment of outliers)

``` r
rdat[["promotion.pos"]] <- winzorize(rdat[["promotion.pos"]],"promotion.pos", c("testType","gender"),covar)
```

### Assumption: Normality distribution of data

#### Removing data that affect normality (extreme values)

``` r
non.normal <- list(
"promotion.pos" = c("1160f4b0-a439-11eb-8cbb-599e427a3fce","d79c21e0-b1db-11eb-b944-15c8c1c6ce71","3ee27670-df62-11eb-bf23-972ef7bdc96c","d9957860-df63-11eb-bf23-972ef7bdc96c")
)
sdat <- removeFromDataTable(rdat, non.normal, wid)
```

#### Result of normality test in the residual model

|               | var           |   n | skewness | kurtosis | symmetry | statistic | method     |     p | p.signif | normality |
|:--------------|:--------------|----:|---------:|---------:|:---------|----------:|:-----------|------:|:---------|:----------|
| promotion.pos | promotion.pos | 103 |    0.346 |   -0.686 | YES      |     5.074 | D’Agostino | 0.079 | ns       | QQ        |

#### Result of normality test in each group

This is an optional validation and only valid for groups with number
greater than 30 observations

| testType | gender    | variable      |   n |  mean | median |   min |   max |    sd |    se |    ci |   iqr | normality | method       | statistic |     p | p.signif |
|:---------|:----------|:--------------|----:|------:|-------:|------:|------:|------:|------:|------:|------:|:----------|:-------------|----------:|------:|:---------|
| default  | Feminino  | promotion.pos |  15 | 3.767 |   3.92 | 1.909 | 5.227 | 1.222 | 0.316 | 0.677 | 2.395 | YES       | Shapiro-Wilk |     0.891 | 0.069 | ns       |
| default  | Masculino | promotion.pos |  26 | 2.567 |   2.46 | 1.402 | 3.880 | 0.843 | 0.165 | 0.340 | 1.448 | YES       | Shapiro-Wilk |     0.923 | 0.053 | ns       |
| stFemale | Feminino  | promotion.pos |  15 | 3.108 |   3.13 | 1.755 | 5.227 | 1.150 | 0.297 | 0.637 | 1.790 | YES       | Shapiro-Wilk |     0.900 | 0.095 | ns       |
| stFemale | Masculino | promotion.pos |  15 | 2.973 |   2.92 | 1.818 | 4.292 | 0.794 | 0.205 | 0.440 | 1.335 | YES       | Shapiro-Wilk |     0.942 | 0.402 | ns       |
| stMale   | Feminino  | promotion.pos |  14 | 3.246 |   3.15 | 1.860 | 4.865 | 0.869 | 0.232 | 0.502 | 0.430 | YES       | Shapiro-Wilk |     0.933 | 0.334 | ns       |
| stMale   | Masculino | promotion.pos |  18 | 2.269 |   2.19 | 1.392 | 3.880 | 0.646 | 0.152 | 0.321 | 0.600 | YES       | Shapiro-Wilk |     0.930 | 0.194 | ns       |

**Observation**:

As sample sizes increase, parametric tests remain valid even with the
violation of normality \[[1](#references)\]. According to the central
limit theorem, the sampling distribution tends to be normal if the
sample is large, more than (`n > 30`) observations. Therefore, we
performed parametric tests with large samples as described as follows:

-   In cases with the sample size greater than 100 (`n > 100`), we
    adopted a significance level of `p < 0.01`

-   For samples with `n > 50` observation, we adopted D’Agostino-Pearson
    test that offers better accuracy for larger samples
    \[[2](#references)\].

-   For samples’ size between `n > 100` and `n <= 200`, we ignored the
    normality test, and our decision of validating normality was based
    only in the interpretation of QQ-plots and histograms because the
    Shapiro-Wilk and D’Agostino-Pearson tests tend to be too sensitive
    with values greater than 200 observation \[[3](#references)\].

-   For samples with `n > 200` observation, we ignore the normality
    assumption based on the central theorem limit.

### Assumption: Linearity of dependent variables and covariate variable

``` r
ggscatter(sdat[["promotion.pos"]], x=covar, y="promotion.pos", facet.by=between, short.panel.labs = F) + 
 stat_smooth(method = "lm", span = 0.9)
```

    ## `geom_smooth()` using formula 'y ~ x'

![](ancova_files/figure-gfm/unnamed-chunk-12-1.png)<!-- -->

### Assumption: Homogeneity of data distribution

|                 | var           | method         | formula                      |   n | DFn.df1 | DFd.df2 | statistic |     p | p.signif |
|:----------------|:--------------|:---------------|:-----------------------------|----:|--------:|--------:|----------:|------:|:---------|
| promotion.pos.1 | promotion.pos | Levene’s test  | `.res`\~`testType`\*`gender` | 103 |       5 |      97 |     3.530 | 0.006 | \*       |
| promotion.pos.2 | promotion.pos | Anova’s slopes | `.res`\~`testType`\*`gender` | 103 |       5 |      91 |     1.009 | 0.417 | ns       |

## Saving the Data with Normal Distribution Used for Performing ANCOVA test

``` r
ndat <- sdat[[1]]
for (dv in names(sdat)[-1]) ndat <- merge(ndat, sdat[[dv]])
write.csv(ndat, paste0("../data/table-with-normal-distribution.csv"))
```

Descriptive statistics of data with normal distribution

|                 | testType | gender    | variable      |   n |  mean | median |   min |   max |    sd |    se |    ci |   iqr |
|:----------------|:---------|:----------|:--------------|----:|------:|-------:|------:|------:|------:|------:|------:|------:|
| promotion.pos.1 | default  | Feminino  | promotion.pos |  15 | 3.767 |   3.92 | 1.909 | 5.227 | 1.222 | 0.316 | 0.677 | 2.395 |
| promotion.pos.2 | default  | Masculino | promotion.pos |  26 | 2.567 |   2.46 | 1.402 | 3.880 | 0.843 | 0.165 | 0.340 | 1.448 |
| promotion.pos.3 | stFemale | Feminino  | promotion.pos |  15 | 3.108 |   3.13 | 1.755 | 5.227 | 1.150 | 0.297 | 0.637 | 1.790 |
| promotion.pos.4 | stFemale | Masculino | promotion.pos |  15 | 2.973 |   2.92 | 1.818 | 4.292 | 0.794 | 0.205 | 0.440 | 1.335 |
| promotion.pos.5 | stMale   | Feminino  | promotion.pos |  14 | 3.246 |   3.15 | 1.860 | 4.865 | 0.869 | 0.232 | 0.502 | 0.430 |
| promotion.pos.6 | stMale   | Masculino | promotion.pos |  18 | 2.269 |   2.19 | 1.392 | 3.880 | 0.646 | 0.152 | 0.321 | 0.600 |

![](ancova_files/figure-gfm/unnamed-chunk-18-1.png)<!-- -->

## Computation of ANCOVA test and Pairwise Comparison

### ANCOVA test

| var           | Effect          | DFn | DFd |    SSn |    SSd |      F |     p |   ges | p.signif |
|:--------------|:----------------|----:|----:|-------:|-------:|-------:|------:|------:|:---------|
| promotion.pos | promotion.pre   |   1 |  96 |  9.996 | 72.937 | 13.157 | 0.000 | 0.121 | \*\*\*   |
| promotion.pos | testType        |   2 |  96 |  0.729 | 72.937 |  0.479 | 0.621 | 0.010 | ns       |
| promotion.pos | gender          |   1 |  96 | 20.934 | 72.937 | 27.554 | 0.000 | 0.223 | \*\*\*\* |
| promotion.pos | testType:gender |   2 |  96 |  2.586 | 72.937 |  1.702 | 0.188 | 0.034 | ns       |

### Pairwise comparison

| var           | testType | gender    | group1   | group2    | estimate | conf.low | conf.high |    se | statistic |     p | p.adj | p.adj.signif |
|:--------------|:---------|:----------|:---------|:----------|---------:|---------:|----------:|------:|----------:|------:|------:|:-------------|
| promotion.pos | NA       | Feminino  | default  | stFemale  |    0.467 |   -0.173 |     1.108 | 0.323 |     1.448 | 0.151 | 0.452 | ns           |
| promotion.pos | NA       | Feminino  | default  | stMale    |    0.307 |   -0.346 |     0.961 | 0.329 |     0.933 | 0.353 | 1.000 | ns           |
| promotion.pos | NA       | Feminino  | stFemale | stMale    |   -0.160 |   -0.803 |     0.483 | 0.324 |    -0.494 | 0.622 | 1.000 | ns           |
| promotion.pos | NA       | Masculino | default  | stFemale  |   -0.297 |   -0.861 |     0.267 | 0.284 |    -1.045 | 0.299 | 0.896 | ns           |
| promotion.pos | NA       | Masculino | default  | stMale    |    0.179 |   -0.356 |     0.713 | 0.269 |     0.664 | 0.509 | 1.000 | ns           |
| promotion.pos | NA       | Masculino | stFemale | stMale    |    0.476 |   -0.142 |     1.093 | 0.311 |     1.529 | 0.130 | 0.389 | ns           |
| promotion.pos | default  | NA        | Feminino | Masculino |    1.191 |    0.630 |     1.752 | 0.283 |     4.214 | 0.000 | 0.000 | \*\*\*\*     |
| promotion.pos | stFemale | NA        | Feminino | Masculino |    0.427 |   -0.225 |     1.078 | 0.328 |     1.300 | 0.197 | 0.197 | ns           |
| promotion.pos | stMale   | NA        | Feminino | Masculino |    1.062 |    0.444 |     1.681 | 0.312 |     3.411 | 0.001 | 0.001 | \*\*\*       |

### Descriptive Statistic of Estimated Marginal Means

| var           | testType | gender    | promotion.pre | emmean | se.emms |  df | conf.low | conf.high | method       |   n |  mean | median |   min |   max |    sd | se.ds |    ci |   iqr | n.promotion.pre | mean.promotion.pre | median.promotion.pre | min.promotion.pre | max.promotion.pre | sd.promotion.pre | se.promotion.pre | ci.promotion.pre | iqr.promotion.pre | sd.emms |
|:--------------|:---------|:----------|--------------:|-------:|--------:|----:|---------:|----------:|:-------------|----:|------:|-------:|------:|------:|------:|------:|------:|------:|----------------:|-------------------:|---------------------:|------------------:|------------------:|-----------------:|-----------------:|-----------------:|------------------:|--------:|
| promotion.pos | default  | Feminino  |         3.361 |  3.700 |   0.226 |  96 |    3.252 |     4.148 | Emmeans test |  15 | 3.767 |   3.92 | 1.909 | 5.227 | 1.222 | 0.316 | 0.677 | 2.395 |              15 |              3.207 |                 3.00 |             2.330 |             4.099 |            0.626 |            0.162 |            0.346 |             0.835 |   0.875 |
| promotion.pos | default  | Masculino |         3.361 |  2.509 |   0.172 |  96 |    2.168 |     2.850 | Emmeans test |  26 | 2.567 |   2.46 | 1.402 | 3.880 | 0.843 | 0.165 | 0.340 | 1.448 |              26 |              3.226 |                 3.33 |             1.901 |             4.551 |            0.730 |            0.143 |            0.295 |             0.917 |   0.876 |
| promotion.pos | stFemale | Feminino  |         3.361 |  3.233 |   0.228 |  96 |    2.781 |     3.685 | Emmeans test |  15 | 3.108 |   3.13 | 1.755 | 5.227 | 1.150 | 0.297 | 0.637 | 1.790 |              15 |              3.647 |                 3.67 |             2.700 |             4.670 |            0.607 |            0.157 |            0.336 |             0.835 |   0.882 |
| promotion.pos | stFemale | Masculino |         3.361 |  2.806 |   0.230 |  96 |    2.350 |     3.262 | Emmeans test |  15 | 2.973 |   2.92 | 1.818 | 4.292 | 0.794 | 0.205 | 0.440 | 1.335 |              15 |              2.977 |                 2.67 |             2.000 |             4.330 |            0.903 |            0.233 |            0.500 |             1.505 |   0.890 |
| promotion.pos | stMale   | Feminino  |         3.361 |  3.393 |   0.236 |  96 |    2.923 |     3.862 | Emmeans test |  14 | 3.246 |   3.15 | 1.860 | 4.865 | 0.869 | 0.232 | 0.502 | 0.430 |              14 |              3.698 |                 3.67 |             2.099 |             5.000 |            0.935 |            0.250 |            0.540 |             0.833 |   0.885 |
| promotion.pos | stMale   | Masculino |         3.361 |  2.330 |   0.206 |  96 |    1.921 |     2.739 | Emmeans test |  18 | 2.269 |   2.19 | 1.392 | 3.880 | 0.646 | 0.152 | 0.321 | 0.600 |              18 |              3.501 |                 3.67 |             2.653 |             4.670 |            0.599 |            0.141 |            0.298 |             0.670 |   0.875 |

### Ancova plots for the dependent variable “promotion.pos”

``` r
plots <- twoWayAncovaPlots(sdat[["promotion.pos"]], "promotion.pos", between
, aov[["promotion.pos"]], pwc[["promotion.pos"]], addParam = c("jitter"), font.label.size=14, step.increase=0.25)
```

#### Plot for: `promotion.pos` \~ `testType`

``` r
plots[["testType"]]
```

![](ancova_files/figure-gfm/unnamed-chunk-26-1.png)<!-- -->

#### Plot for: `promotion.pos` \~ `gender`

``` r
plots[["gender"]]
```

![](ancova_files/figure-gfm/unnamed-chunk-27-1.png)<!-- -->

### Textual Report

After controlling the linearity of covariance “promotion.pre”, ANCOVA
tests with independent between-subjects variables “testType” (default,
stFemale, stMale) and “gender” (Feminino, Masculino) were performed to
determine statistically significant difference on the dependent varibles
“promotion.pos”. For the dependent variable “promotion.pos”, there was
statistically significant effects in the factor “promotion.pre” with
F(1,96)=13.157, p\<0.001 and ges=0.121 (effect size) and in the factor
“gender” with F(1,96)=27.554, p\<0.001 and ges=0.223 (effect size).

Pairwise comparisons using the Estimated Marginal Means (EMMs) were
computed to find statistically significant diferences among the groups
defined by the independent variables, and with the p-values ajusted by
the method “bonferroni”. For the dependent variable “promotion.pos”, the
mean in the gender=“Feminino” (adj M=3.7 and SD=1.222) was significantly
different than the mean in the gender=“Masculino” (adj M=2.509 and
SD=0.843) with p-adj\<0.001; the mean in the gender=“Feminino” (adj
M=3.393 and SD=0.869) was significantly different than the mean in the
gender=“Masculino” (adj M=2.33 and SD=0.646) with p-adj\<0.001.

## Tips and References

-   Use the site <https://www.tablesgenerator.com> to convert the HTML
    tables into Latex format

-   \[2\]: Miot, H. A. (2017). Assessing normality of data in clinical
    and experimental trials. J Vasc Bras, 16(2), 88-91.

-   \[3\]: Bárány, Imre; Vu, Van (2007). “Central limit theorems for
    Gaussian polytopes”. Annals of Probability. Institute of
    Mathematical Statistics. 35 (4): 1593–1621.