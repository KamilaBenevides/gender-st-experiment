ANCOVA test for `fss`\~`dfs`+`testType`\*`gender`
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
        “fss”](#ancova-plots-for-the-dependent-variable-fss)
    -   [Textual Report](#textual-report)
-   [Tips and References](#tips-and-references)

## Initial Variables and Data

-   R-script file: [../code/ancova.R](../code/ancova.R)
-   Initial table file:
    [../data/initial-table.csv](../data/initial-table.csv)
-   Data for fss [../data/table-for-fss.csv](../data/table-for-fss.csv)
-   Table without outliers and normal distribution of data:
    [../data/table-with-normal-distribution.csv](../data/table-with-normal-distribution.csv)
-   Other data files: [../data/](../data/)
-   Files related to the presented results: [../results/](../results/)

### Descriptive statistics of initial data

| testType | gender    | variable |   n |  mean | median |   min |   max |    sd |    se |    ci |   iqr | symmetry | skewness | kurtosis |
|:---------|:----------|:---------|----:|------:|-------:|------:|------:|------:|------:|------:|------:|:---------|---------:|---------:|
| default  | Feminino  | fss      |  15 | 3.233 |  3.125 | 1.875 | 5.000 | 0.929 | 0.240 | 0.515 | 1.125 | YES      |    0.416 |   -1.029 |
| default  | Masculino | fss      |  28 | 3.750 |  3.875 | 2.000 | 4.750 | 0.655 | 0.124 | 0.254 | 0.812 | NO       |   -0.657 |   -0.038 |
| stFemale | Feminino  | fss      |  15 | 3.683 |  4.000 | 2.000 | 4.625 | 0.783 | 0.202 | 0.434 | 0.875 | NO       |   -0.688 |   -0.712 |
| stFemale | Masculino | fss      |  15 | 3.767 |  3.875 | 2.250 | 4.625 | 0.627 | 0.162 | 0.347 | 0.688 | NO       |   -0.836 |    0.019 |
| stMale   | Feminino  | fss      |  14 | 3.732 |  3.562 | 2.500 | 5.000 | 0.743 | 0.199 | 0.429 | 1.031 | YES      |    0.335 |   -1.156 |
| stMale   | Masculino | fss      |  20 | 3.944 |  3.938 | 2.625 | 4.875 | 0.638 | 0.143 | 0.299 | 0.688 | YES      |   -0.437 |   -0.780 |
| NA       | NA        | fss      | 107 | 3.704 |  3.750 | 1.875 | 5.000 | 0.735 | 0.071 | 0.141 | 1.000 | YES      |   -0.440 |   -0.451 |

![](ancova_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

    ## [1] "65ae5870-b819-11eb-93e6-43229aa359ae"

## Checking of Assumptions

### Assumption: Symmetry and treatment of outliers

#### Applying transformation for skewness data when normality is not achieved

#### Dealing with outliers (performing treatment of outliers)

### Assumption: Normality distribution of data

#### Removing data that affect normality (extreme values)

``` r
non.normal <- list(

)
sdat <- removeFromDataTable(rdat, non.normal, wid)
```

#### Result of normality test in the residual model

|     | var |   n | skewness | kurtosis | symmetry | statistic | method     |     p | p.signif | normality |
|:----|:----|----:|---------:|---------:|:---------|----------:|:-----------|------:|:---------|:----------|
| fss | fss | 107 |   -0.342 |   -0.208 | YES      |     2.305 | D’Agostino | 0.316 | ns       | QQ        |

#### Result of normality test in each group

This is an optional validation and only valid for groups with number
greater than 30 observations

| testType | gender    | variable |   n |  mean | median |   min |   max |    sd |    se |    ci |   iqr | normality | method       | statistic |     p | p.signif |
|:---------|:----------|:---------|----:|------:|-------:|------:|------:|------:|------:|------:|------:|:----------|:-------------|----------:|------:|:---------|
| default  | Feminino  | fss      |  15 | 3.233 |  3.125 | 1.875 | 5.000 | 0.929 | 0.240 | 0.515 | 1.125 | YES       | Shapiro-Wilk |     0.955 | 0.610 | ns       |
| default  | Masculino | fss      |  28 | 3.750 |  3.875 | 2.000 | 4.750 | 0.655 | 0.124 | 0.254 | 0.812 | YES       | Shapiro-Wilk |     0.958 | 0.314 | ns       |
| stFemale | Feminino  | fss      |  15 | 3.683 |  4.000 | 2.000 | 4.625 | 0.783 | 0.202 | 0.434 | 0.875 | YES       | Shapiro-Wilk |     0.917 | 0.171 | ns       |
| stFemale | Masculino | fss      |  15 | 3.767 |  3.875 | 2.250 | 4.625 | 0.627 | 0.162 | 0.347 | 0.688 | YES       | Shapiro-Wilk |     0.933 | 0.298 | ns       |
| stMale   | Feminino  | fss      |  14 | 3.732 |  3.562 | 2.500 | 5.000 | 0.743 | 0.199 | 0.429 | 1.031 | YES       | Shapiro-Wilk |     0.924 | 0.253 | ns       |
| stMale   | Masculino | fss      |  20 | 3.944 |  3.938 | 2.625 | 4.875 | 0.638 | 0.143 | 0.299 | 0.688 | YES       | Shapiro-Wilk |     0.951 | 0.390 | ns       |

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
ggscatter(sdat[["fss"]], x=covar, y="fss", facet.by=between, short.panel.labs = F) + 
 stat_smooth(method = "lm", span = 0.9)
```

    ## `geom_smooth()` using formula 'y ~ x'

![](ancova_files/figure-gfm/unnamed-chunk-11-1.png)<!-- -->

### Assumption: Homogeneity of data distribution

|       | var | method         | formula                      |   n | DFn.df1 | DFd.df2 | statistic |     p | p.signif |
|:------|:----|:---------------|:-----------------------------|----:|--------:|--------:|----------:|------:|:---------|
| fss.1 | fss | Levene’s test  | `.res`\~`testType`\*`gender` | 107 |       5 |     101 |     1.009 | 0.416 | ns       |
| fss.2 | fss | Anova’s slopes | `.res`\~`testType`\*`gender` | 107 |       5 |      95 |     0.331 | 0.893 | ns       |

## Saving the Data with Normal Distribution Used for Performing ANCOVA test

``` r
ndat <- sdat[[1]]
for (dv in names(sdat)[-1]) ndat <- merge(ndat, sdat[[dv]])
write.csv(ndat, paste0("../data/table-with-normal-distribution.csv"))
```

Descriptive statistics of data with normal distribution

|       | testType | gender    | variable |   n |  mean | median |   min |   max |    sd |    se |    ci |   iqr |
|:------|:---------|:----------|:---------|----:|------:|-------:|------:|------:|------:|------:|------:|------:|
| fss.1 | default  | Feminino  | fss      |  15 | 3.233 |  3.125 | 1.875 | 5.000 | 0.929 | 0.240 | 0.515 | 1.125 |
| fss.2 | default  | Masculino | fss      |  28 | 3.750 |  3.875 | 2.000 | 4.750 | 0.655 | 0.124 | 0.254 | 0.812 |
| fss.3 | stFemale | Feminino  | fss      |  15 | 3.683 |  4.000 | 2.000 | 4.625 | 0.783 | 0.202 | 0.434 | 0.875 |
| fss.4 | stFemale | Masculino | fss      |  15 | 3.767 |  3.875 | 2.250 | 4.625 | 0.627 | 0.162 | 0.347 | 0.688 |
| fss.5 | stMale   | Feminino  | fss      |  14 | 3.732 |  3.562 | 2.500 | 5.000 | 0.743 | 0.199 | 0.429 | 1.031 |
| fss.6 | stMale   | Masculino | fss      |  20 | 3.944 |  3.938 | 2.625 | 4.875 | 0.638 | 0.143 | 0.299 | 0.688 |

![](ancova_files/figure-gfm/unnamed-chunk-17-1.png)<!-- -->

## Computation of ANCOVA test and Pairwise Comparison

### ANCOVA test

| var | Effect          | DFn | DFd |   SSn |   SSd |     F |     p |   ges | p.signif |
|:----|:----------------|----:|----:|------:|------:|------:|------:|------:|:---------|
| fss | dfs             |   1 | 100 | 4.116 | 48.57 | 8.473 | 0.004 | 0.078 | \*\*     |
| fss | testType        |   2 | 100 | 1.377 | 48.57 | 1.418 | 0.247 | 0.028 | ns       |
| fss | gender          |   1 | 100 | 1.858 | 48.57 | 3.825 | 0.053 | 0.037 | ns       |
| fss | testType:gender |   2 | 100 | 0.935 | 48.57 | 0.962 | 0.386 | 0.019 | ns       |

### Pairwise comparison

| var | testType | gender    | group1   | group2    | estimate | conf.low | conf.high |    se | statistic |     p | p.adj | p.adj.signif |
|:----|:---------|:----------|:---------|:----------|---------:|---------:|----------:|------:|----------:|------:|------:|:-------------|
| fss | NA       | Feminino  | default  | stFemale  |   -0.441 |   -0.946 |     0.064 | 0.254 |    -1.734 | 0.086 | 0.258 | ns           |
| fss | NA       | Feminino  | default  | stMale    |   -0.450 |   -0.965 |     0.065 | 0.260 |    -1.734 | 0.086 | 0.258 | ns           |
| fss | NA       | Feminino  | stFemale | stMale    |   -0.009 |   -0.523 |     0.506 | 0.259 |    -0.034 | 0.973 | 1.000 | ns           |
| fss | NA       | Masculino | default  | stFemale  |    0.015 |   -0.428 |     0.458 | 0.223 |     0.068 | 0.946 | 1.000 | ns           |
| fss | NA       | Masculino | default  | stMale    |   -0.156 |   -0.562 |     0.250 | 0.204 |    -0.763 | 0.447 | 1.000 | ns           |
| fss | NA       | Masculino | stFemale | stMale    |   -0.171 |   -0.643 |     0.301 | 0.238 |    -0.719 | 0.474 | 1.000 | ns           |
| fss | default  | NA        | Feminino | Masculino |   -0.499 |   -0.942 |    -0.057 | 0.223 |    -2.238 | 0.027 | 0.027 | \*           |
| fss | stFemale | NA        | Feminino | Masculino |   -0.043 |   -0.548 |     0.463 | 0.255 |    -0.168 | 0.867 | 0.867 | ns           |
| fss | stMale   | NA        | Feminino | Masculino |   -0.205 |   -0.687 |     0.277 | 0.243 |    -0.845 | 0.400 | 0.400 | ns           |

### Descriptive Statistic of Estimated Marginal Means

| var | testType | gender    |   dfs | emmean | se.emms |  df | conf.low | conf.high | method       |   n |  mean | median |   min |   max |    sd | se.ds |    ci |   iqr | n.dfs | mean.dfs | median.dfs | min.dfs | max.dfs | sd.dfs | se.dfs | ci.dfs | iqr.dfs | sd.emms |
|:----|:---------|:----------|------:|-------:|--------:|----:|---------:|----------:|:-------------|----:|------:|-------:|------:|------:|------:|------:|------:|------:|------:|---------:|-----------:|--------:|--------:|-------:|-------:|-------:|--------:|--------:|
| fss | default  | Feminino  | 3.421 |  3.263 |   0.180 | 100 |    2.905 |     3.620 | Emmeans test |  15 | 3.233 |  3.125 | 1.875 | 5.000 | 0.929 | 0.240 | 0.515 | 1.125 |    15 |    3.338 |      3.333 |   2.556 |   4.444 |  0.513 |  0.133 |  0.284 |   0.646 |   0.698 |
| fss | default  | Masculino | 3.421 |  3.762 |   0.132 | 100 |    3.501 |     4.023 | Emmeans test |  28 | 3.750 |  3.875 | 2.000 | 4.750 | 0.655 | 0.124 | 0.254 | 0.812 |    28 |    3.387 |      3.422 |   2.111 |   4.889 |  0.667 |  0.126 |  0.259 |   0.694 |   0.697 |
| fss | stFemale | Feminino  | 3.421 |  3.704 |   0.180 | 100 |    3.347 |     4.061 | Emmeans test |  15 | 3.683 |  4.000 | 2.000 | 4.625 | 0.783 | 0.202 | 0.434 | 0.875 |    15 |    3.363 |      3.444 |   2.444 |   4.000 |  0.433 |  0.112 |  0.240 |   0.333 |   0.697 |
| fss | stFemale | Masculino | 3.421 |  3.747 |   0.180 | 100 |    3.390 |     4.104 | Emmeans test |  15 | 3.767 |  3.875 | 2.250 | 4.625 | 0.627 | 0.162 | 0.347 | 0.688 |    15 |    3.478 |      3.333 |   3.000 |   4.222 |  0.439 |  0.113 |  0.243 |   0.722 |   0.697 |
| fss | stMale   | Feminino  | 3.421 |  3.713 |   0.186 | 100 |    3.343 |     4.083 | Emmeans test |  14 | 3.732 |  3.562 | 2.500 | 5.000 | 0.743 | 0.199 | 0.429 | 1.031 |    14 |    3.476 |      3.389 |   2.667 |   5.000 |  0.632 |  0.169 |  0.365 |   0.694 |   0.697 |
| fss | stMale   | Masculino | 3.421 |  3.918 |   0.156 | 100 |    3.608 |     4.228 | Emmeans test |  20 | 3.944 |  3.938 | 2.625 | 4.875 | 0.638 | 0.143 | 0.299 | 0.688 |    20 |    3.494 |      3.389 |   2.444 |   4.778 |  0.603 |  0.135 |  0.282 |   0.750 |   0.698 |

### Ancova plots for the dependent variable “fss”

``` r
plots <- twoWayAncovaPlots(sdat[["fss"]], "fss", between
, aov[["fss"]], pwc[["fss"]], addParam = c("jitter"), font.label.size=14, step.increase=0.25)
```

#### Plot for: `fss` \~ `testType`

``` r
plots[["testType"]]
```

![](ancova_files/figure-gfm/unnamed-chunk-25-1.png)<!-- -->

#### Plot for: `fss` \~ `gender`

``` r
plots[["gender"]]
```

![](ancova_files/figure-gfm/unnamed-chunk-26-1.png)<!-- -->

### Textual Report

After controlling the linearity of covariance “dfs”, ANCOVA tests with
independent between-subjects variables “testType” (stFemale, stMale,
default) and “gender” (Masculino, Feminino) were performed to determine
statistically significant difference on the dependent varibles “fss”.
For the dependent variable “fss”, there was statistically significant
effects in the factor “dfs” with F(1,100)=8.473, p=0.004 and ges=0.078
(effect size).

Pairwise comparisons using the Estimated Marginal Means (EMMs) were
computed to find statistically significant diferences among the groups
defined by the independent variables, and with the p-values ajusted by
the method “bonferroni”. For the dependent variable “fss”, the mean in
the gender=“Feminino” (adj M=3.263 and SD=0.929) was significantly
different than the mean in the gender=“Masculino” (adj M=3.762 and
SD=0.655) with p-adj=0.027.

## Tips and References

-   Use the site <https://www.tablesgenerator.com> to convert the HTML
    tables into Latex format

-   \[2\]: Miot, H. A. (2017). Assessing normality of data in clinical
    and experimental trials. J Vasc Bras, 16(2), 88-91.

-   \[3\]: Bárány, Imre; Vu, Van (2007). “Central limit theorems for
    Gaussian polytopes”. Annals of Probability. Institute of
    Mathematical Statistics. 35 (4): 1593–1621.