ANOVA test for
`dejection,cheerfulness,agitation,quiescence`\~`Condition`
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
        “dejection”](#anova-plots-for-the-dependent-variable-dejection)
    -   [Anova plots for the dependent variable
        “cheerfulness”](#anova-plots-for-the-dependent-variable-cheerfulness)
    -   [Anova plots for the dependent variable
        “agitation”](#anova-plots-for-the-dependent-variable-agitation)
    -   [Anova plots for the dependent variable
        “quiescence”](#anova-plots-for-the-dependent-variable-quiescence)
    -   [Textual Report](#textual-report)
-   [Tips and References](#tips-and-references)

## Initial Variables and Data

-   R-script file: [../code/anova.R](../code/anova.R)
-   Initial table file:
    [../data/initial-table.csv](../data/initial-table.csv)
-   Data for dejection
    [../data/table-for-dejection.csv](../data/table-for-dejection.csv)
-   Data for cheerfulness
    [../data/table-for-cheerfulness.csv](../data/table-for-cheerfulness.csv)
-   Data for agitation
    [../data/table-for-agitation.csv](../data/table-for-agitation.csv)
-   Data for quiescence
    [../data/table-for-quiescence.csv](../data/table-for-quiescence.csv)
-   Table without outliers and normal distribution of data:
    [../data/table-with-normal-distribution.csv](../data/table-with-normal-distribution.csv)
-   Other data files: [../data/](../data/)
-   Files related to the presented results: [../results/](../results/)

### Descriptive statistics of initial data

| Condition | variable     |   n |  mean | median |  min |   max |    sd |    se |    ci |   iqr | symmetry | skewness | kurtosis |
|:----------|:-------------|----:|------:|-------:|-----:|------:|------:|------:|------:|------:|:---------|---------:|---------:|
| control   | dejection    |  43 | 2.112 |  1.667 | 1.00 | 7.000 | 1.380 | 0.211 | 0.425 | 1.417 | NO       |    1.481 |    1.933 |
| inBoost   | dejection    |  35 | 2.276 |  1.667 | 1.00 | 7.000 | 1.529 | 0.258 | 0.525 | 1.667 | NO       |    1.496 |    1.491 |
| inThreat  | dejection    |  29 | 2.241 |  2.333 | 1.00 | 5.333 | 1.080 | 0.201 | 0.411 | 1.000 | NO       |    1.006 |    0.896 |
| NA        | dejection    | 107 | 2.201 |  2.000 | 1.00 | 7.000 | 1.348 | 0.130 | 0.258 | 1.667 | NO       |    1.494 |    2.067 |
| control   | cheerfulness |  43 | 4.140 |  4.250 | 1.25 | 7.000 | 1.542 | 0.235 | 0.475 | 2.250 | YES      |   -0.246 |   -1.003 |
| inBoost   | cheerfulness |  35 | 4.650 |  5.000 | 2.25 | 6.750 | 1.265 | 0.214 | 0.435 | 1.625 | YES      |   -0.157 |   -0.986 |
| inThreat  | cheerfulness |  29 | 4.000 |  4.250 | 1.00 | 6.500 | 1.510 | 0.280 | 0.575 | 1.750 | YES      |   -0.372 |   -0.643 |
| NA        | cheerfulness | 107 | 4.269 |  4.500 | 1.00 | 7.000 | 1.460 | 0.141 | 0.280 | 2.125 | YES      |   -0.341 |   -0.635 |
| control   | agitation    |  43 | 2.821 |  2.330 | 1.00 | 6.000 | 1.396 | 0.213 | 0.430 | 2.250 | NO       |    0.628 |   -0.740 |
| inBoost   | agitation    |  35 | 3.086 |  2.670 | 1.17 | 6.500 | 1.366 | 0.231 | 0.469 | 1.585 | NO       |    0.928 |    0.082 |
| inThreat  | agitation    |  29 | 3.091 |  2.830 | 1.00 | 5.830 | 1.536 | 0.285 | 0.584 | 2.500 | YES      |    0.286 |   -1.308 |
| NA        | agitation    | 107 | 2.981 |  2.500 | 1.00 | 6.500 | 1.418 | 0.137 | 0.272 | 2.085 | NO       |    0.619 |   -0.596 |
| control   | quiescence   |  43 | 4.477 |  4.500 | 1.00 | 7.000 | 1.562 | 0.238 | 0.481 | 2.375 | YES      |   -0.392 |   -0.718 |
| inBoost   | quiescence   |  35 | 4.709 |  4.750 | 1.00 | 7.000 | 1.370 | 0.232 | 0.471 | 1.875 | NO       |   -0.513 |   -0.341 |
| inThreat  | quiescence   |  29 | 4.511 |  4.500 | 1.75 | 7.000 | 1.579 | 0.293 | 0.601 | 2.250 | YES      |   -0.061 |   -1.195 |
| NA        | quiescence   | 107 | 4.562 |  4.750 | 1.00 | 7.000 | 1.496 | 0.145 | 0.287 | 2.125 | YES      |   -0.352 |   -0.673 |

![](anova_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

    ## [1] "d7506eb0-a81e-11eb-8cbb-599e427a3fce" "5ca44270-b19e-11eb-b944-15c8c1c6ce71" "fc1e63c0-dbac-11eb-916d-ef9a5fc9a834"
    ## [4] "358e5340-9d4b-11eb-9b7e-0daf340a71ab" "1160f4b0-a439-11eb-8cbb-599e427a3fce" "670fa950-f6e7-11eb-991d-7bf2f9a6c3b9"
    ## [7] "208ec0b0-9d46-11eb-9b7e-0daf340a71ab" "d7092840-efb6-11eb-991d-7bf2f9a6c3b9"

![](anova_files/figure-gfm/unnamed-chunk-5-2.png)<!-- -->![](anova_files/figure-gfm/unnamed-chunk-5-3.png)<!-- -->

    ## [1] "358e5340-9d4b-11eb-9b7e-0daf340a71ab" "1160f4b0-a439-11eb-8cbb-599e427a3fce"

![](anova_files/figure-gfm/unnamed-chunk-5-4.png)<!-- -->

    ## [1] "358e5340-9d4b-11eb-9b7e-0daf340a71ab"

## Checking of Assumptions

### Assumption: Symmetry and treatment of outliers

#### Applying transformation for skewness data when normality is not achieved

Applying transformation in “dejection” to reduce skewness

``` r
density.plot.by.residual(rdat[["dejection"]],"dejection",between)
```

![](anova_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

``` r
rdat[["dejection"]][["dejection"]] <- log10(dat[["dejection"]][["dejection"]])
density.plot.by.residual(rdat[["dejection"]],"dejection",between)
```

![](anova_files/figure-gfm/unnamed-chunk-6-2.png)<!-- -->

Applying transformation in “agitation” to reduce skewness

``` r
density.plot.by.residual(rdat[["agitation"]],"agitation",between)
```

![](anova_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

``` r
rdat[["agitation"]][["agitation"]] <- sqrt(dat[["agitation"]][["agitation"]])
density.plot.by.residual(rdat[["agitation"]],"agitation",between)
```

![](anova_files/figure-gfm/unnamed-chunk-7-2.png)<!-- -->

#### Dealing with outliers (performing treatment of outliers)

### Assumption: Normality distribution of data

#### Removing data that affect normality (extreme values)

``` r
non.normal <- list(
"dejection" = c("18379910-9df4-11eb-9b7e-0daf340a71ab","4b9fd020-9e02-11eb-9b7e-0daf340a71ab","a9467110-a853-11eb-8cbb-599e427a3fce","e7bb7ec0-b057-11eb-b944-15c8c1c6ce71","c5d98fb0-b1c7-11eb-b944-15c8c1c6ce71","3cbe7e50-b25a-11eb-b944-15c8c1c6ce71","108b6210-b649-11eb-ad27-3593da35795f","b7ecef30-dbf9-11eb-916d-ef9a5fc9a834","9d1ee580-f6ea-11eb-991d-7bf2f9a6c3b9","d23aa670-9d47-11eb-9b7e-0daf340a71ab","09bbd000-9e39-11eb-9b7e-0daf340a71ab","eb0ea380-aeb9-11eb-8cbb-599e427a3fce","f343a310-df61-11eb-bf23-972ef7bdc96c","412915a0-df63-11eb-bf23-972ef7bdc96c","e6b9afe0-efb5-11eb-991d-7bf2f9a6c3b9","56024dd0-efb6-11eb-991d-7bf2f9a6c3b9")
)
sdat <- removeFromDataTable(rdat, non.normal, wid)
```

#### Result of normality test in the residual model

|              | var          |   n | skewness | kurtosis | symmetry | statistic | method     |     p | p.signif | normality |
|:-------------|:-------------|----:|---------:|---------:|:---------|----------:|:-----------|------:|:---------|:----------|
| dejection    | dejection    |  91 |    0.294 |   -0.572 | YES      |     2.651 | D’Agostino | 0.266 | ns       | YES       |
| cheerfulness | cheerfulness | 107 |   -0.276 |   -0.746 | YES      |     5.554 | D’Agostino | 0.062 | ns       | QQ        |
| agitation    | agitation    | 107 |    0.270 |   -0.924 | YES      |    10.753 | D’Agostino | 0.005 | \*       | QQ        |
| quiescence   | quiescence   | 107 |   -0.330 |   -0.669 | YES      |     4.858 | D’Agostino | 0.088 | ns       | QQ        |

#### Result of normality test in each group

This is an optional validation and only valid for groups with number
greater than 30 observations

| Condition | variable     |   n |  mean | median |   min |   max |    sd |    se |    ci |   iqr | normality | method       | statistic |     p | p.signif |
|:----------|:-------------|----:|------:|-------:|------:|------:|------:|------:|------:|------:|:----------|:-------------|----------:|------:|:---------|
| control   | dejection    |  34 | 0.317 |  0.301 | 0.000 | 0.845 | 0.236 | 0.040 | 0.082 | 0.352 | YES       | Shapiro-Wilk |     0.945 | 0.088 | ns       |
| inBoost   | dejection    |  31 | 0.318 |  0.301 | 0.000 | 0.845 | 0.242 | 0.044 | 0.089 | 0.253 | YES       | Shapiro-Wilk |     0.933 | 0.052 | ns       |
| inThreat  | dejection    |  26 | 0.338 |  0.368 | 0.000 | 0.727 | 0.191 | 0.037 | 0.077 | 0.184 | YES       | Shapiro-Wilk |     0.922 | 0.051 | ns       |
| control   | cheerfulness |  43 | 4.140 |  4.250 | 1.250 | 7.000 | 1.542 | 0.235 | 0.475 | 2.250 | YES       | Shapiro-Wilk |     0.963 | 0.185 | ns       |
| inBoost   | cheerfulness |  35 | 4.650 |  5.000 | 2.250 | 6.750 | 1.265 | 0.214 | 0.435 | 1.625 | YES       | Shapiro-Wilk |     0.962 | 0.268 | ns       |
| inThreat  | cheerfulness |  29 | 4.000 |  4.250 | 1.000 | 6.500 | 1.510 | 0.280 | 0.575 | 1.750 | YES       | Shapiro-Wilk |     0.944 | 0.131 | ns       |
| control   | agitation    |  43 | 1.630 |  1.526 | 1.000 | 2.449 | 0.410 | 0.062 | 0.126 | 0.677 | YES       | Shapiro-Wilk |     0.949 | 0.053 | ns       |
| inBoost   | agitation    |  35 | 1.718 |  1.634 | 1.082 | 2.550 | 0.373 | 0.063 | 0.128 | 0.472 | YES       | Shapiro-Wilk |     0.958 | 0.201 | ns       |
| inThreat  | agitation    |  29 | 1.702 |  1.682 | 1.000 | 2.415 | 0.447 | 0.083 | 0.170 | 0.750 | YES       | Shapiro-Wilk |     0.939 | 0.095 | ns       |
| control   | quiescence   |  43 | 4.477 |  4.500 | 1.000 | 7.000 | 1.562 | 0.238 | 0.481 | 2.375 | YES       | Shapiro-Wilk |     0.965 | 0.209 | ns       |
| inBoost   | quiescence   |  35 | 4.709 |  4.750 | 1.000 | 7.000 | 1.370 | 0.232 | 0.471 | 1.875 | YES       | Shapiro-Wilk |     0.958 | 0.203 | ns       |
| inThreat  | quiescence   |  29 | 4.511 |  4.500 | 1.750 | 7.000 | 1.579 | 0.293 | 0.601 | 2.250 | YES       | Shapiro-Wilk |     0.954 | 0.229 | ns       |

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

|              | var          | method        | formula                     |   n | df1 | df2 | statistic |     p | p.signif |
|:-------------|:-------------|:--------------|:----------------------------|----:|----:|----:|----------:|------:|:---------|
| dejection    | dejection    | Levene’s test | `dejection`\~`Condition`    |  91 |   2 |  88 |     1.553 | 0.217 | ns       |
| cheerfulness | cheerfulness | Levene’s test | `cheerfulness`\~`Condition` | 107 |   2 | 104 |     0.826 | 0.441 | ns       |
| agitation    | agitation    | Levene’s test | `agitation`\~`Condition`    | 107 |   2 | 104 |     1.058 | 0.351 | ns       |
| quiescence   | quiescence   | Levene’s test | `quiescence`\~`Condition`   | 107 |   2 | 104 |     0.437 | 0.647 | ns       |

## Saving the Data with Normal Distribution Used for Performing ANOVA test

``` r
ndat <- sdat[[1]]
for (dv in names(sdat)[-1]) ndat <- merge(ndat, sdat[[dv]])
write.csv(ndat, paste0("../data/table-with-normal-distribution.csv"))
```

Descriptive statistics of data with normal distribution

|                | Condition | variable     |   n |  mean | median |   min |   max |    sd |    se |    ci |   iqr |
|:---------------|:----------|:-------------|----:|------:|-------:|------:|------:|------:|------:|------:|------:|
| dejection.1    | control   | dejection    |  34 | 0.317 |  0.301 | 0.000 | 0.845 | 0.236 | 0.040 | 0.082 | 0.352 |
| dejection.2    | inBoost   | dejection    |  31 | 0.318 |  0.301 | 0.000 | 0.845 | 0.242 | 0.044 | 0.089 | 0.253 |
| dejection.3    | inThreat  | dejection    |  26 | 0.338 |  0.368 | 0.000 | 0.727 | 0.191 | 0.037 | 0.077 | 0.184 |
| cheerfulness.1 | control   | cheerfulness |  43 | 4.140 |  4.250 | 1.250 | 7.000 | 1.542 | 0.235 | 0.475 | 2.250 |
| cheerfulness.2 | inBoost   | cheerfulness |  35 | 4.650 |  5.000 | 2.250 | 6.750 | 1.265 | 0.214 | 0.435 | 1.625 |
| cheerfulness.3 | inThreat  | cheerfulness |  29 | 4.000 |  4.250 | 1.000 | 6.500 | 1.510 | 0.280 | 0.575 | 1.750 |
| agitation.1    | control   | agitation    |  43 | 1.630 |  1.526 | 1.000 | 2.449 | 0.410 | 0.062 | 0.126 | 0.677 |
| agitation.2    | inBoost   | agitation    |  35 | 1.718 |  1.634 | 1.082 | 2.550 | 0.373 | 0.063 | 0.128 | 0.472 |
| agitation.3    | inThreat  | agitation    |  29 | 1.702 |  1.682 | 1.000 | 2.415 | 0.447 | 0.083 | 0.170 | 0.750 |
| quiescence.1   | control   | quiescence   |  43 | 4.477 |  4.500 | 1.000 | 7.000 | 1.562 | 0.238 | 0.481 | 2.375 |
| quiescence.2   | inBoost   | quiescence   |  35 | 4.709 |  4.750 | 1.000 | 7.000 | 1.370 | 0.232 | 0.471 | 1.875 |
| quiescence.3   | inThreat  | quiescence   |  29 | 4.511 |  4.500 | 1.750 | 7.000 | 1.579 | 0.293 | 0.601 | 2.250 |

![](anova_files/figure-gfm/unnamed-chunk-18-1.png)<!-- -->![](anova_files/figure-gfm/unnamed-chunk-18-2.png)<!-- -->![](anova_files/figure-gfm/unnamed-chunk-18-3.png)<!-- -->![](anova_files/figure-gfm/unnamed-chunk-18-4.png)<!-- -->

## Computation of ANOVA test and Pairwise Comparison

### ANOVA test

| var          | Effect    | DFn | DFd |   SSn |     SSd |     F |     p |   ges | p.signif |
|:-------------|:----------|----:|----:|------:|--------:|------:|------:|------:|:---------|
| dejection    | Condition |   2 |  88 | 0.008 |   4.505 | 0.078 | 0.925 | 0.002 | ns       |
| cheerfulness | Condition |   2 | 104 | 7.900 | 218.188 | 1.883 | 0.157 | 0.035 | ns       |
| agitation    | Condition |   2 | 104 | 0.172 |  17.358 | 0.514 | 0.599 | 0.010 | ns       |
| quiescence   | Condition |   2 | 104 | 1.148 | 236.101 | 0.253 | 0.777 | 0.005 | ns       |

### Pairwise comparison

| var          | group1  | group2   | estimate | conf.low | conf.high |    se | statistic |     p | p.adj | p.adj.signif |
|:-------------|:--------|:---------|---------:|---------:|----------:|------:|----------:|------:|------:|:-------------|
| dejection    | control | inBoost  |    0.000 |   -0.112 |     0.111 | 0.056 |    -0.005 | 0.996 | 1.000 | ns           |
| dejection    | control | inThreat |   -0.021 |   -0.138 |     0.096 | 0.059 |    -0.354 | 0.724 | 1.000 | ns           |
| dejection    | inBoost | inThreat |   -0.021 |   -0.140 |     0.099 | 0.060 |    -0.342 | 0.733 | 1.000 | ns           |
| cheerfulness | control | inBoost  |   -0.510 |   -1.164 |     0.143 | 0.330 |    -1.548 | 0.125 | 0.374 | ns           |
| cheerfulness | control | inThreat |    0.140 |   -0.551 |     0.830 | 0.348 |     0.401 | 0.689 | 1.000 | ns           |
| cheerfulness | inBoost | inThreat |    0.650 |   -0.071 |     1.371 | 0.364 |     1.787 | 0.077 | 0.230 | ns           |
| agitation    | control | inBoost  |   -0.088 |   -0.272 |     0.097 | 0.093 |    -0.945 | 0.347 | 1.000 | ns           |
| agitation    | control | inThreat |   -0.072 |   -0.267 |     0.122 | 0.098 |    -0.736 | 0.464 | 1.000 | ns           |
| agitation    | inBoost | inThreat |    0.016 |   -0.188 |     0.219 | 0.103 |     0.152 | 0.879 | 1.000 | ns           |
| quiescence   | control | inBoost  |   -0.233 |   -0.913 |     0.448 | 0.343 |    -0.678 | 0.499 | 1.000 | ns           |
| quiescence   | control | inThreat |   -0.035 |   -0.753 |     0.683 | 0.362 |    -0.096 | 0.924 | 1.000 | ns           |
| quiescence   | inBoost | inThreat |    0.198 |   -0.552 |     0.948 | 0.378 |     0.523 | 0.602 | 1.000 | ns           |

### Descriptive Statistic of Estimated Marginal Means

| var          | Condition |   n | emmean |  mean | conf.low | conf.high |    sd | sd.emms | se.emms |
|:-------------|:----------|----:|-------:|------:|---------:|----------:|------:|--------:|--------:|
| agitation    | control   |  43 |  1.630 | 1.630 |    1.507 |     1.754 | 0.410 |   0.409 |   0.062 |
| agitation    | inBoost   |  35 |  1.718 | 1.718 |    1.581 |     1.855 | 0.373 |   0.409 |   0.069 |
| agitation    | inThreat  |  29 |  1.702 | 1.702 |    1.552 |     1.853 | 0.447 |   0.409 |   0.076 |
| cheerfulness | control   |  43 |  4.140 | 4.140 |    3.702 |     4.578 | 1.542 |   1.448 |   0.221 |
| cheerfulness | inBoost   |  35 |  4.650 | 4.650 |    4.164 |     5.136 | 1.265 |   1.448 |   0.245 |
| cheerfulness | inThreat  |  29 |  4.000 | 4.000 |    3.467 |     4.533 | 1.510 |   1.448 |   0.269 |
| dejection    | control   |  34 |  0.317 | 0.317 |    0.240 |     0.394 | 0.236 |   0.226 |   0.039 |
| dejection    | inBoost   |  31 |  0.318 | 0.318 |    0.237 |     0.398 | 0.242 |   0.226 |   0.041 |
| dejection    | inThreat  |  26 |  0.338 | 0.338 |    0.250 |     0.426 | 0.191 |   0.226 |   0.044 |
| quiescence   | control   |  43 |  4.477 | 4.477 |    4.021 |     4.932 | 1.562 |   1.507 |   0.230 |
| quiescence   | inBoost   |  35 |  4.709 | 4.709 |    4.204 |     5.214 | 1.370 |   1.507 |   0.255 |
| quiescence   | inThreat  |  29 |  4.511 | 4.511 |    3.957 |     5.066 | 1.579 |   1.507 |   0.280 |

### Anova plots for the dependent variable “dejection”

``` r
plots <- oneWayAnovaPlots(sdat[["dejection"]], "dejection", between, aov[["dejection"]], pwc[["dejection"]], c("jitter"), font.label.size=14, step.increase=0.25)
```

#### Plot of “dejection” based on “Condition”

``` r
plots[["Condition"]]
```

![](anova_files/figure-gfm/unnamed-chunk-26-1.png)<!-- -->

### Anova plots for the dependent variable “cheerfulness”

``` r
plots <- oneWayAnovaPlots(sdat[["cheerfulness"]], "cheerfulness", between, aov[["cheerfulness"]], pwc[["cheerfulness"]], c("jitter"), font.label.size=14, step.increase=0.25)
```

#### Plot of “cheerfulness” based on “Condition”

``` r
plots[["Condition"]]
```

![](anova_files/figure-gfm/unnamed-chunk-28-1.png)<!-- -->

### Anova plots for the dependent variable “agitation”

``` r
plots <- oneWayAnovaPlots(sdat[["agitation"]], "agitation", between, aov[["agitation"]], pwc[["agitation"]], c("jitter"), font.label.size=14, step.increase=0.25)
```

#### Plot of “agitation” based on “Condition”

``` r
plots[["Condition"]]
```

![](anova_files/figure-gfm/unnamed-chunk-30-1.png)<!-- -->

### Anova plots for the dependent variable “quiescence”

``` r
plots <- oneWayAnovaPlots(sdat[["quiescence"]], "quiescence", between, aov[["quiescence"]], pwc[["quiescence"]], c("jitter"), font.label.size=14, step.increase=0.25)
```

#### Plot of “quiescence” based on “Condition”

``` r
plots[["Condition"]]
```

![](anova_files/figure-gfm/unnamed-chunk-32-1.png)<!-- -->

### Textual Report

ANOVA tests with independent between-subjects variables “Condition”
(inThreat, inBoost, control) were performed to determine statistically
significant difference on the dependent varibles “dejection”,
“cheerfulness”, “agitation”, “quiescence”. For the dependent variable
“dejection”, there was not statistically significant effects. For the
dependent variable “cheerfulness”, there was not statistically
significant effects. For the dependent variable “agitation”, there was
not statistically significant effects. For the dependent variable
“quiescence”, there was not statistically significant effects.

## Tips and References

-   Use the site <https://www.tablesgenerator.com> to convert the HTML
    tables into Latex format

-   \[2\]: Miot, H. A. (2017). Assessing normality of data in clinical
    and experimental trials. J Vasc Bras, 16(2), 88-91.

-   \[3\]: Bárány, Imre; Vu, Van (2007). “Central limit theorems for
    Gaussian polytopes”. Annals of Probability. Institute of
    Mathematical Statistics. 35 (4): 1593–1621.