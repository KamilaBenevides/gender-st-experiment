ANOVA test for `activityPoints`\~`testType`\*`gender`
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
    -   [Assumption: Homogeneity of data
        distribution](#assumption-homogeneity-of-data-distribution)
-   [Saving the Data with Normal Distribution Used for Performing ANOVA
    test](#saving-the-data-with-normal-distribution-used-for-performing-anova-test)
-   [Computation of ANOVA test and Pairwise
    Comparison](#computation-of-anova-test-and-pairwise-comparison)
    -   [ANOVA test](#anova-test)
    -   [Pairwise comparison](#pairwise-comparison)
    -   [Descriptive Statistic of Estimated Marginal
        Means](#descriptive-statistic-of-estimated-marginal-means)
    -   [Anova plots for the dependent variable
        “activityPoints”](#anova-plots-for-the-dependent-variable-activitypoints)
    -   [Textual Report](#textual-report)
-   [Tips and References](#tips-and-references)

## Initial Variables and Data

-   R-script file: [../code/anova.R](../code/anova.R)
-   Initial table file:
    [../data/initial-table.csv](../data/initial-table.csv)
-   Data for activityPoints
    [../data/table-for-activityPoints.csv](../data/table-for-activityPoints.csv)
-   Table without outliers and normal distribution of data:
    [../data/table-with-normal-distribution.csv](../data/table-with-normal-distribution.csv)
-   Other data files: [../data/](../data/)
-   Files related to the presented results: [../results/](../results/)

### Descriptive statistics of initial data

| testType | gender    | variable       |   n |    mean | median | min | max |     sd |     se |     ci |  iqr | symmetry | skewness | kurtosis |
|:---------|:----------|:---------------|----:|--------:|-------:|----:|----:|-------:|-------:|-------:|-----:|:---------|---------:|---------:|
| default  | Feminino  | activityPoints |  15 | 124.000 |    140 |  30 | 170 | 49.971 | 12.903 | 27.673 | 55.0 | NO       |   -0.843 |   -0.894 |
| default  | Masculino | activityPoints |  28 | 153.571 |    160 |  50 | 190 | 29.214 |  5.521 | 11.328 | 30.0 | NO       |   -1.639 |    3.261 |
| stFemale | Feminino  | activityPoints |  15 | 142.000 |    150 |  50 | 180 | 35.897 |  9.268 | 19.879 | 35.0 | NO       |   -1.129 |    0.443 |
| stFemale | Masculino | activityPoints |  15 | 164.000 |    150 | 130 | 200 | 24.727 |  6.385 | 13.693 | 45.0 | YES      |    0.257 |   -1.702 |
| stMale   | Feminino  | activityPoints |  14 | 143.571 |    145 |  60 | 190 | 33.422 |  8.932 | 19.297 | 27.5 | NO       |   -0.898 |    0.365 |
| stMale   | Masculino | activityPoints |  20 | 157.500 |    165 | 100 | 200 | 31.267 |  6.992 | 14.633 | 35.0 | NO       |   -0.663 |   -0.916 |
| NA       | NA        | activityPoints | 107 | 148.692 |    160 |  30 | 200 | 35.504 |  3.432 |  6.805 | 30.0 | NO       |   -1.344 |    1.913 |

![](anova_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

    ## [1] "358e5340-9d4b-11eb-9b7e-0daf340a71ab" "08861510-9ebb-11eb-9b7e-0daf340a71ab" "e7bb7ec0-b057-11eb-b944-15c8c1c6ce71"

## Checking of Assumptions

### Assumption: Symmetry and treatment of outliers

#### Applying transformation for skewness data when normality is not achieved

Applying transformation in “activityPoints” to reduce skewness

``` r
density.plot.by.residual(rdat[["activityPoints"]],"activityPoints",between)
```

![](anova_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

``` r
rdat[["activityPoints"]][["activityPoints"]] <- sqrt(max(dat[["activityPoints"]][["activityPoints"]]+1) - dat[["activityPoints"]][["activityPoints"]])
density.plot.by.residual(rdat[["activityPoints"]],"activityPoints",between)
```

![](anova_files/figure-gfm/unnamed-chunk-6-2.png)<!-- -->

#### Dealing with outliers (performing treatment of outliers)

``` r
rdat[["activityPoints"]] <- winzorize(rdat[["activityPoints"]],"activityPoints", c("testType","gender"))
```

### Assumption: Normality distribution of data

#### Removing data that affect normality (extreme values)

``` r
non.normal <- list(
"activityPoints" = c("208ec0b0-9d46-11eb-9b7e-0daf340a71ab","b70e56d0-a837-11eb-8cbb-599e427a3fce","8a1d24d0-b183-11eb-b944-15c8c1c6ce71","d7a07110-df61-11eb-bf23-972ef7bdc96c","67a97540-df62-11eb-bf23-972ef7bdc96c","9f602740-df62-11eb-bf23-972ef7bdc96c","a2018610-df62-11eb-bf23-972ef7bdc96c")
)
sdat <- removeFromDataTable(rdat, non.normal, wid)
```

#### Result of normality test in the residual model

|                | var            |   n | skewness | kurtosis | symmetry | statistic | method     |     p | p.signif | normality |
|:---------------|:---------------|----:|---------:|---------:|:---------|----------:|:-----------|------:|:---------|:----------|
| activityPoints | activityPoints | 100 |    0.263 |   -0.907 | YES      |     9.076 | D’Agostino | 0.011 | \*       | NO        |

#### Result of normality test in each group

This is an optional validation and only valid for groups with number
greater than 30 observations

| testType | gender    | variable       |   n |  mean | median |   min |    max |    sd |    se |    ci |   iqr | normality | method       | statistic |     p | p.signif |
|:---------|:----------|:---------------|----:|------:|-------:|------:|-------:|------:|------:|------:|------:|:----------|:-------------|----------:|------:|:---------|
| default  | Feminino  | activityPoints |  15 | 8.115 |  7.810 | 5.568 | 11.473 | 2.221 | 0.574 | 1.230 | 3.392 | YES       | Shapiro-Wilk |     0.883 | 0.052 | ns       |
| default  | Masculino | activityPoints |  28 | 6.538 |  6.403 | 3.760 |  9.351 | 1.614 | 0.305 | 0.626 | 2.242 | YES       | Shapiro-Wilk |     0.931 | 0.065 | ns       |
| stFemale | Feminino  | activityPoints |  15 | 7.290 |  7.141 | 4.583 | 10.817 | 1.962 | 0.507 | 1.086 | 2.441 | YES       | Shapiro-Wilk |     0.945 | 0.453 | ns       |
| stFemale | Masculino | activityPoints |   8 | 5.940 |  6.772 | 3.317 |  7.810 | 1.916 | 0.677 | 1.602 | 3.043 | YES       | Shapiro-Wilk |     0.834 | 0.065 | ns       |
| stMale   | Feminino  | activityPoints |  14 | 7.220 |  7.476 | 4.139 | 10.216 | 1.834 | 0.490 | 1.059 | 2.034 | YES       | Shapiro-Wilk |     0.953 | 0.612 | ns       |
| stMale   | Masculino | activityPoints |  20 | 6.253 |  5.985 | 3.317 | 10.050 | 2.271 | 0.508 | 1.063 | 2.880 | YES       | Shapiro-Wilk |     0.906 | 0.054 | ns       |

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

### Assumption: Homogeneity of data distribution

|                | var            | method        | formula                                |   n | df1 | df2 | statistic |     p | p.signif |
|:---------------|:---------------|:--------------|:---------------------------------------|----:|----:|----:|----------:|------:|:---------|
| activityPoints | activityPoints | Levene’s test | `activityPoints`\~`testType`\*`gender` | 100 |   5 |  94 |     0.758 | 0.582 | ns       |

## Saving the Data with Normal Distribution Used for Performing ANOVA test

``` r
ndat <- sdat[[1]]
for (dv in names(sdat)[-1]) ndat <- merge(ndat, sdat[[dv]])
write.csv(ndat, paste0("../data/table-with-normal-distribution.csv"))
```

Descriptive statistics of data with normal distribution

|                  | testType | gender    | variable       |   n |  mean | median |   min |    max |    sd |    se |    ci |   iqr |
|:-----------------|:---------|:----------|:---------------|----:|------:|-------:|------:|-------:|------:|------:|------:|------:|
| activityPoints.1 | default  | Feminino  | activityPoints |  15 | 8.115 |  7.810 | 5.568 | 11.473 | 2.221 | 0.574 | 1.230 | 3.392 |
| activityPoints.2 | default  | Masculino | activityPoints |  28 | 6.538 |  6.403 | 3.760 |  9.351 | 1.614 | 0.305 | 0.626 | 2.242 |
| activityPoints.3 | stFemale | Feminino  | activityPoints |  15 | 7.290 |  7.141 | 4.583 | 10.817 | 1.962 | 0.507 | 1.086 | 2.441 |
| activityPoints.4 | stFemale | Masculino | activityPoints |   8 | 5.940 |  6.772 | 3.317 |  7.810 | 1.916 | 0.677 | 1.602 | 3.043 |
| activityPoints.5 | stMale   | Feminino  | activityPoints |  14 | 7.220 |  7.476 | 4.139 | 10.216 | 1.834 | 0.490 | 1.059 | 2.034 |
| activityPoints.6 | stMale   | Masculino | activityPoints |  20 | 6.253 |  5.985 | 3.317 | 10.050 | 2.271 | 0.508 | 1.063 | 2.880 |

![](anova_files/figure-gfm/unnamed-chunk-18-1.png)<!-- -->

## Computation of ANOVA test and Pairwise Comparison

### ANOVA test

| var            | Effect          | DFn | DFd |    SSn |     SSd |      F |     p |   ges | p.signif |
|:---------------|:----------------|----:|----:|-------:|--------:|-------:|------:|------:|:---------|
| activityPoints | testType        |   2 |  94 |  8.172 | 360.684 |  1.065 | 0.349 | 0.022 | ns       |
| activityPoints | gender          |   1 |  94 | 39.820 | 360.684 | 10.378 | 0.002 | 0.099 | \*\*     |
| activityPoints | testType:gender |   2 |  94 |  1.674 | 360.684 |  0.218 | 0.804 | 0.005 | ns       |

### Pairwise comparison

| var            | testType | gender    | group1   | group2    | estimate | conf.low | conf.high |    se | statistic |     p | p.adj | p.adj.signif |
|:---------------|:---------|:----------|:---------|:----------|---------:|---------:|----------:|------:|----------:|------:|------:|:-------------|
| activityPoints | NA       | Feminino  | default  | stFemale  |    0.825 |   -0.595 |     2.245 | 0.715 |     1.154 | 0.252 | 0.755 | ns           |
| activityPoints | NA       | Feminino  | default  | stMale    |    0.895 |   -0.550 |     2.340 | 0.728 |     1.229 | 0.222 | 0.666 | ns           |
| activityPoints | NA       | Feminino  | stFemale | stMale    |    0.070 |   -1.375 |     1.515 | 0.728 |     0.096 | 0.924 | 1.000 | ns           |
| activityPoints | NA       | Masculino | default  | stFemale  |    0.598 |   -0.962 |     2.157 | 0.785 |     0.761 | 0.449 | 1.000 | ns           |
| activityPoints | NA       | Masculino | default  | stMale    |    0.285 |   -0.854 |     1.423 | 0.573 |     0.497 | 0.621 | 1.000 | ns           |
| activityPoints | NA       | Masculino | stFemale | stMale    |   -0.313 |   -1.940 |     1.314 | 0.819 |    -0.382 | 0.704 | 1.000 | ns           |
| activityPoints | default  | NA        | Feminino | Masculino |    1.577 |    0.333 |     2.822 | 0.627 |     2.516 | 0.014 | 0.014 | \*           |
| activityPoints | stFemale | NA        | Feminino | Masculino |    1.350 |   -0.353 |     3.052 | 0.858 |     1.574 | 0.119 | 0.119 | ns           |
| activityPoints | stMale   | NA        | Feminino | Masculino |    0.967 |   -0.388 |     2.322 | 0.683 |     1.417 | 0.160 | 0.160 | ns           |

### Descriptive Statistic of Estimated Marginal Means

| var            | testType | gender    |   n | emmean |  mean | conf.low | conf.high |    sd | sd.emms | se.emms |
|:---------------|:---------|:----------|----:|-------:|------:|---------:|----------:|------:|--------:|--------:|
| activityPoints | default  | Feminino  |  15 |  8.115 | 8.115 |    7.111 |     9.119 | 2.221 |   1.959 |   0.506 |
| activityPoints | default  | Masculino |  28 |  6.538 | 6.538 |    5.803 |     7.273 | 1.614 |   1.959 |   0.370 |
| activityPoints | stFemale | Feminino  |  15 |  7.290 | 7.290 |    6.286 |     8.294 | 1.962 |   1.959 |   0.506 |
| activityPoints | stFemale | Masculino |   8 |  5.940 | 5.940 |    4.565 |     7.315 | 1.916 |   1.959 |   0.693 |
| activityPoints | stMale   | Feminino  |  14 |  7.220 | 7.220 |    6.180 |     8.259 | 1.834 |   1.959 |   0.524 |
| activityPoints | stMale   | Masculino |  20 |  6.253 | 6.253 |    5.383 |     7.123 | 2.271 |   1.959 |   0.438 |

### Anova plots for the dependent variable “activityPoints”

``` r
plots <- twoWayAnovaPlots(sdat[["activityPoints"]], "activityPoints", between, aov[["activityPoints"]], pwc[["activityPoints"]], c("jitter"), font.label.size=14, step.increase=0.25)
```

#### Plot of “activityPoints” based on “testType” (color: gender)

``` r
plots[["testType"]]
```

![](anova_files/figure-gfm/unnamed-chunk-26-1.png)<!-- -->

#### Plot of “activityPoints” based on “gender” (color: testType)

``` r
plots[["gender"]]
```

![](anova_files/figure-gfm/unnamed-chunk-27-1.png)<!-- -->

### Textual Report

ANOVA tests with independent between-subjects variables “testType”
(default, stFemale, stMale) and “gender” (Feminino, Masculino) were
performed to determine statistically significant difference on the
dependent varibles “activityPoints”. For the dependent variable
“activityPoints”, there was statistically significant effects in the
factor “gender” with F(1,94)=10.378, p=0.002 and ges=0.099 (effect
size).

Pairwise comparisons using the Estimated Marginal Means (EMMs) were
computed to find statistically significant diferences among the groups
defined by the independent variables, and with the p-values ajusted by
the method “bonferroni”. For the dependent variable “activityPoints”,
the mean in the gender=“Feminino” (adj M=8.115 and SD=2.221) was
significantly different than the mean in the gender=“Masculino” (adj
M=6.538 and SD=1.614) with p-adj=0.014.

## Tips and References

-   Use the site <https://www.tablesgenerator.com> to convert the HTML
    tables into Latex format

-   \[2\]: Miot, H. A. (2017). Assessing normality of data in clinical
    and experimental trials. J Vasc Bras, 16(2), 88-91.

-   \[3\]: Bárány, Imre; Vu, Van (2007). “Central limit theorems for
    Gaussian polytopes”. Annals of Probability. Institute of
    Mathematical Statistics. 35 (4): 1593–1621.