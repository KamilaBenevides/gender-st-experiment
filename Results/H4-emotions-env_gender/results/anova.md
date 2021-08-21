ANOVA test for
`dejection,cheerfulness,agitation,quiescence`\~`testType`\*`gender`
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

| testType | gender    | variable     |   n |  mean | median |  min |   max |    sd |    se |    ci |   iqr | symmetry | skewness | kurtosis |
|:---------|:----------|:-------------|----:|------:|-------:|-----:|------:|------:|------:|------:|------:|:---------|---------:|---------:|
| default  | Feminino  | dejection    |  15 | 2.867 |  2.333 | 1.00 | 7.000 | 1.685 | 0.435 | 0.933 | 2.167 | NO       |    0.829 |   -0.135 |
| default  | Masculino | dejection    |  28 | 1.708 |  1.333 | 1.00 | 5.000 | 1.004 | 0.190 | 0.389 | 1.333 | NO       |    1.644 |    2.353 |
| stFemale | Feminino  | dejection    |  15 | 2.689 |  2.333 | 1.00 | 7.000 | 1.752 | 0.452 | 0.970 | 1.500 | NO       |    1.080 |    0.111 |
| stFemale | Masculino | dejection    |  15 | 2.000 |  2.000 | 1.00 | 4.667 | 1.134 | 0.293 | 0.628 | 1.333 | NO       |    0.976 |   -0.063 |
| stMale   | Feminino  | dejection    |  14 | 2.500 |  2.333 | 1.00 | 5.333 | 0.994 | 0.266 | 0.574 | 0.833 | NO       |    1.343 |    2.184 |
| stMale   | Masculino | dejection    |  20 | 1.967 |  1.667 | 1.00 | 6.000 | 1.297 | 0.290 | 0.607 | 1.000 | NO       |    1.736 |    2.386 |
| NA       | NA        | dejection    | 107 | 2.201 |  2.000 | 1.00 | 7.000 | 1.348 | 0.130 | 0.258 | 1.667 | NO       |    1.494 |    2.067 |
| default  | Feminino  | cheerfulness |  15 | 3.367 |  3.250 | 1.50 | 7.000 | 1.614 | 0.417 | 0.894 | 2.500 | NO       |    0.517 |   -0.693 |
| default  | Masculino | cheerfulness |  28 | 4.554 |  5.000 | 1.25 | 6.500 | 1.356 | 0.256 | 0.526 | 1.750 | NO       |   -0.623 |   -0.513 |
| stFemale | Feminino  | cheerfulness |  15 | 4.317 |  4.000 | 2.25 | 6.750 | 1.428 | 0.369 | 0.791 | 1.875 | YES      |    0.240 |   -1.292 |
| stFemale | Masculino | cheerfulness |  15 | 4.083 |  4.500 | 1.00 | 6.500 | 1.528 | 0.395 | 0.846 | 1.000 | NO       |   -0.589 |   -0.570 |
| stMale   | Feminino  | cheerfulness |  14 | 3.911 |  4.125 | 1.00 | 6.500 | 1.543 | 0.412 | 0.891 | 1.812 | YES      |   -0.108 |   -0.952 |
| stMale   | Masculino | cheerfulness |  20 | 4.900 |  5.000 | 2.50 | 6.500 | 1.098 | 0.246 | 0.514 | 1.125 | YES      |   -0.378 |   -0.600 |
| NA       | NA        | cheerfulness | 107 | 4.269 |  4.500 | 1.00 | 7.000 | 1.460 | 0.141 | 0.280 | 2.125 | YES      |   -0.341 |   -0.635 |
| default  | Feminino  | agitation    |  15 | 2.875 |  2.170 | 1.00 | 5.800 | 1.627 | 0.420 | 0.901 | 2.660 | NO       |    0.576 |   -1.340 |
| default  | Masculino | agitation    |  28 | 2.792 |  2.500 | 1.00 | 6.000 | 1.288 | 0.243 | 0.499 | 1.915 | NO       |    0.572 |   -0.531 |
| stFemale | Feminino  | agitation    |  15 | 3.435 |  3.170 | 1.33 | 6.500 | 1.546 | 0.399 | 0.856 | 2.000 | NO       |    0.525 |   -1.042 |
| stFemale | Masculino | agitation    |  15 | 2.953 |  2.330 | 1.00 | 5.500 | 1.605 | 0.415 | 0.889 | 2.415 | YES      |    0.326 |   -1.576 |
| stMale   | Feminino  | agitation    |  14 | 3.238 |  3.000 | 1.17 | 5.830 | 1.503 | 0.402 | 0.868 | 1.585 | YES      |    0.246 |   -1.217 |
| stMale   | Masculino | agitation    |  20 | 2.824 |  2.415 | 1.17 | 6.330 | 1.187 | 0.265 | 0.556 | 1.415 | NO       |    1.177 |    1.343 |
| NA       | NA        | agitation    | 107 | 2.981 |  2.500 | 1.00 | 6.500 | 1.418 | 0.137 | 0.272 | 2.085 | NO       |    0.619 |   -0.596 |
| default  | Feminino  | quiescence   |  15 | 4.183 |  4.250 | 1.00 | 7.000 | 1.967 | 0.508 | 1.089 | 3.375 | YES      |    0.008 |   -1.512 |
| default  | Masculino | quiescence   |  28 | 4.634 |  4.625 | 1.00 | 6.500 | 1.310 | 0.248 | 0.508 | 2.062 | NO       |   -0.621 |   -0.081 |
| stFemale | Feminino  | quiescence   |  15 | 4.067 |  4.000 | 1.00 | 6.500 | 1.465 | 0.378 | 0.811 | 2.250 | YES      |   -0.176 |   -0.784 |
| stFemale | Masculino | quiescence   |  15 | 4.772 |  4.750 | 1.75 | 6.750 | 1.488 | 0.384 | 0.824 | 2.125 | YES      |   -0.434 |   -0.997 |
| stMale   | Feminino  | quiescence   |  14 | 4.232 |  4.125 | 2.00 | 7.000 | 1.680 | 0.449 | 0.970 | 2.250 | YES      |    0.316 |   -1.262 |
| stMale   | Masculino | quiescence   |  20 | 5.191 |  5.500 | 2.75 | 7.000 | 1.098 | 0.246 | 0.514 | 1.562 | YES      |   -0.425 |   -0.768 |
| NA       | NA        | quiescence   | 107 | 4.562 |  4.750 | 1.00 | 7.000 | 1.496 | 0.145 | 0.287 | 2.125 | YES      |   -0.352 |   -0.673 |

![](anova_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

    ## [1] "358e5340-9d4b-11eb-9b7e-0daf340a71ab" "670fa950-f6e7-11eb-991d-7bf2f9a6c3b9" "d7092840-efb6-11eb-991d-7bf2f9a6c3b9"
    ## [4] "d7506eb0-a81e-11eb-8cbb-599e427a3fce" "208ec0b0-9d46-11eb-9b7e-0daf340a71ab" "1160f4b0-a439-11eb-8cbb-599e427a3fce"
    ## [7] "d79c21e0-b1db-11eb-b944-15c8c1c6ce71" "08506260-b812-11eb-93e6-43229aa359ae"

![](anova_files/figure-gfm/unnamed-chunk-5-2.png)<!-- -->

    ## [1] "b70e56d0-a837-11eb-8cbb-599e427a3fce" "65ae5870-b819-11eb-93e6-43229aa359ae" "d7a07110-df61-11eb-bf23-972ef7bdc96c"
    ## [4] "412915a0-df63-11eb-bf23-972ef7bdc96c"

![](anova_files/figure-gfm/unnamed-chunk-5-3.png)<!-- -->

    ## [1] "1160f4b0-a439-11eb-8cbb-599e427a3fce"

![](anova_files/figure-gfm/unnamed-chunk-5-4.png)<!-- -->

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

``` r
rdat[["dejection"]] <- winzorize(rdat[["dejection"]],"dejection", c("testType","gender"))
rdat[["cheerfulness"]] <- winzorize(rdat[["cheerfulness"]],"cheerfulness", c("testType","gender"))
rdat[["agitation"]] <- winzorize(rdat[["agitation"]],"agitation", c("testType","gender"))
rdat[["quiescence"]] <- winzorize(rdat[["quiescence"]],"quiescence", c("testType","gender"))
```

### Assumption: Normality distribution of data

#### Removing data that affect normality (extreme values)

``` r
non.normal <- list(
"dejection" = c("d23aa670-9d47-11eb-9b7e-0daf340a71ab","09bbd000-9e39-11eb-9b7e-0daf340a71ab","eb0ea380-aeb9-11eb-8cbb-599e427a3fce","d79c21e0-b1db-11eb-b944-15c8c1c6ce71","8a1d24d0-b183-11eb-b944-15c8c1c6ce71","d7a07110-df61-11eb-bf23-972ef7bdc96c","18379910-9df4-11eb-9b7e-0daf340a71ab","4b9fd020-9e02-11eb-9b7e-0daf340a71ab","a9467110-a853-11eb-8cbb-599e427a3fce","e7bb7ec0-b057-11eb-b944-15c8c1c6ce71","3cbe7e50-b25a-11eb-b944-15c8c1c6ce71","108b6210-b649-11eb-ad27-3593da35795f","369d0020-df62-11eb-bf23-972ef7bdc96c","3ee27670-df62-11eb-bf23-972ef7bdc96c","9bf2ecf0-df62-11eb-bf23-972ef7bdc96c"),
"cheerfulness" = c("d7a07110-df61-11eb-bf23-972ef7bdc96c"),
"quiescence" = c("369d0020-df62-11eb-bf23-972ef7bdc96c","2145a1e0-df63-11eb-bf23-972ef7bdc96c","46f906c0-9e36-11eb-9b7e-0daf340a71ab")
)
sdat <- removeFromDataTable(rdat, non.normal, wid)
```

#### Result of normality test in the residual model

|              | var          |   n | skewness | kurtosis | symmetry | statistic | method     |     p | p.signif | normality |
|:-------------|:-------------|----:|---------:|---------:|:---------|----------:|:-----------|------:|:---------|:----------|
| dejection    | dejection    |  92 |    0.010 |   -0.878 | YES      |     6.007 | D’Agostino | 0.050 | \*       | NO        |
| cheerfulness | cheerfulness | 106 |   -0.168 |   -0.877 | YES      |     7.976 | D’Agostino | 0.019 | ns       | QQ        |
| agitation    | agitation    | 107 |    0.173 |   -1.117 | YES      |    22.350 | D’Agostino | 0.000 | \*\*\*   | QQ        |
| quiescence   | quiescence   | 104 |   -0.016 |   -1.039 | YES      |    14.752 | D’Agostino | 0.001 | \*\*     | QQ        |

#### Result of normality test in each group

This is an optional validation and only valid for groups with number
greater than 30 observations

| testType | gender    | variable     |   n |  mean | median |   min |   max |    sd |    se |    ci |   iqr | normality | method       | statistic |     p | p.signif |
|:---------|:----------|:-------------|----:|------:|-------:|------:|------:|------:|------:|------:|------:|:----------|:-------------|----------:|------:|:---------|
| default  | Feminino  | dejection    |  15 | 0.377 |  0.368 | 0.000 | 0.675 | 0.239 | 0.062 | 0.132 | 0.361 | YES       | Shapiro-Wilk |     0.910 | 0.134 | ns       |
| default  | Masculino | dejection    |  19 | 0.252 |  0.301 | 0.000 | 0.558 | 0.188 | 0.043 | 0.091 | 0.243 | YES       | Shapiro-Wilk |     0.914 | 0.090 | ns       |
| stFemale | Feminino  | dejection    |  15 | 0.339 |  0.368 | 0.000 | 0.690 | 0.244 | 0.063 | 0.135 | 0.301 | YES       | Shapiro-Wilk |     0.922 | 0.209 | ns       |
| stFemale | Masculino | dejection    |  13 | 0.275 |  0.301 | 0.000 | 0.622 | 0.220 | 0.061 | 0.133 | 0.368 | YES       | Shapiro-Wilk |     0.886 | 0.087 | ns       |
| stMale   | Feminino  | dejection    |  14 | 0.367 |  0.368 | 0.144 | 0.552 | 0.114 | 0.031 | 0.066 | 0.147 | YES       | Shapiro-Wilk |     0.942 | 0.446 | ns       |
| stMale   | Masculino | dejection    |  16 | 0.237 |  0.222 | 0.000 | 0.606 | 0.190 | 0.047 | 0.101 | 0.207 | YES       | Shapiro-Wilk |     0.890 | 0.055 | ns       |
| default  | Feminino  | cheerfulness |  15 | 3.278 |  3.250 | 1.575 | 5.450 | 1.381 | 0.356 | 0.765 | 2.500 | YES       | Shapiro-Wilk |     0.911 | 0.139 | ns       |
| default  | Masculino | cheerfulness |  28 | 4.584 |  5.000 | 2.175 | 6.250 | 1.256 | 0.237 | 0.487 | 1.750 | YES       | Shapiro-Wilk |     0.930 | 0.062 | ns       |
| stFemale | Feminino  | cheerfulness |  15 | 4.312 |  4.000 | 2.425 | 6.500 | 1.381 | 0.357 | 0.765 | 1.875 | YES       | Shapiro-Wilk |     0.929 | 0.261 | ns       |
| stFemale | Masculino | cheerfulness |  14 | 4.275 |  4.500 | 1.698 | 6.150 | 1.282 | 0.343 | 0.740 | 0.938 | YES       | Shapiro-Wilk |     0.885 | 0.067 | ns       |
| stMale   | Feminino  | cheerfulness |  14 | 3.948 |  4.125 | 1.851 | 6.175 | 1.390 | 0.372 | 0.803 | 1.812 | YES       | Shapiro-Wilk |     0.946 | 0.499 | ns       |
| stMale   | Masculino | cheerfulness |  20 | 4.936 |  5.000 | 3.212 | 6.500 | 1.026 | 0.229 | 0.480 | 1.125 | YES       | Shapiro-Wilk |     0.942 | 0.260 | ns       |
| default  | Feminino  | agitation    |  15 | 1.636 |  1.473 | 1.082 | 2.345 | 0.453 | 0.117 | 0.251 | 0.789 | YES       | Shapiro-Wilk |     0.884 | 0.054 | ns       |
| default  | Masculino | agitation    |  28 | 1.619 |  1.581 | 1.082 | 2.182 | 0.357 | 0.068 | 0.139 | 0.569 | YES       | Shapiro-Wilk |     0.927 | 0.053 | ns       |
| stFemale | Feminino  | agitation    |  15 | 1.803 |  1.780 | 1.251 | 2.345 | 0.378 | 0.098 | 0.210 | 0.549 | YES       | Shapiro-Wilk |     0.922 | 0.206 | ns       |
| stFemale | Masculino | agitation    |  15 | 1.661 |  1.526 | 1.082 | 2.320 | 0.462 | 0.119 | 0.256 | 0.729 | YES       | Shapiro-Wilk |     0.891 | 0.071 | ns       |
| stMale   | Feminino  | agitation    |  14 | 1.749 |  1.731 | 1.128 | 2.345 | 0.417 | 0.111 | 0.241 | 0.440 | YES       | Shapiro-Wilk |     0.929 | 0.298 | ns       |
| stMale   | Masculino | agitation    |  20 | 1.638 |  1.554 | 1.282 | 2.094 | 0.268 | 0.060 | 0.126 | 0.433 | YES       | Shapiro-Wilk |     0.927 | 0.133 | ns       |
| default  | Feminino  | quiescence   |  14 | 4.370 |  4.500 | 2.075 | 6.675 | 1.750 | 0.468 | 1.010 | 3.312 | YES       | Shapiro-Wilk |     0.889 | 0.079 | ns       |
| default  | Masculino | quiescence   |  26 | 4.702 |  4.625 | 3.000 | 6.250 | 1.086 | 0.213 | 0.439 | 1.938 | YES       | Shapiro-Wilk |     0.922 | 0.050 | ns       |
| stFemale | Feminino  | quiescence   |  15 | 4.135 |  4.000 | 2.548 | 5.975 | 1.213 | 0.313 | 0.672 | 2.250 | YES       | Shapiro-Wilk |     0.906 | 0.119 | ns       |
| stFemale | Masculino | quiescence   |  15 | 4.800 |  4.750 | 2.372 | 6.552 | 1.386 | 0.358 | 0.767 | 2.125 | YES       | Shapiro-Wilk |     0.923 | 0.217 | ns       |
| stMale   | Feminino  | quiescence   |  14 | 4.199 |  4.125 | 2.189 | 6.675 | 1.581 | 0.422 | 0.913 | 2.250 | YES       | Shapiro-Wilk |     0.918 | 0.209 | ns       |
| stMale   | Masculino | quiescence   |  20 | 5.214 |  5.500 | 3.700 | 6.509 | 0.963 | 0.215 | 0.451 | 1.562 | YES       | Shapiro-Wilk |     0.917 | 0.088 | ns       |

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

|              | var          | method        | formula                              |   n | df1 | df2 | statistic |     p | p.signif |
|:-------------|:-------------|:--------------|:-------------------------------------|----:|----:|----:|----------:|------:|:---------|
| dejection    | dejection    | Levene’s test | `dejection`\~`testType`\*`gender`    |  92 |   5 |  86 |     2.260 | 0.056 | ns       |
| cheerfulness | cheerfulness | Levene’s test | `cheerfulness`\~`testType`\*`gender` | 106 |   5 | 100 |     0.658 | 0.656 | ns       |
| agitation    | agitation    | Levene’s test | `agitation`\~`testType`\*`gender`    | 107 |   5 | 101 |     1.387 | 0.235 | ns       |
| quiescence   | quiescence   | Levene’s test | `quiescence`\~`testType`\*`gender`   | 104 |   5 |  98 |     2.150 | 0.066 | ns       |

## Saving the Data with Normal Distribution Used for Performing ANOVA test

``` r
ndat <- sdat[[1]]
for (dv in names(sdat)[-1]) ndat <- merge(ndat, sdat[[dv]])
write.csv(ndat, paste0("../data/table-with-normal-distribution.csv"))
```

Descriptive statistics of data with normal distribution

|                | testType | gender    | variable     |   n |  mean | median |   min |   max |    sd |    se |    ci |   iqr |
|:---------------|:---------|:----------|:-------------|----:|------:|-------:|------:|------:|------:|------:|------:|------:|
| dejection.1    | default  | Feminino  | dejection    |  15 | 0.377 |  0.368 | 0.000 | 0.675 | 0.239 | 0.062 | 0.132 | 0.361 |
| dejection.2    | default  | Masculino | dejection    |  19 | 0.252 |  0.301 | 0.000 | 0.558 | 0.188 | 0.043 | 0.091 | 0.243 |
| dejection.3    | stFemale | Feminino  | dejection    |  15 | 0.339 |  0.368 | 0.000 | 0.690 | 0.244 | 0.063 | 0.135 | 0.301 |
| dejection.4    | stFemale | Masculino | dejection    |  13 | 0.275 |  0.301 | 0.000 | 0.622 | 0.220 | 0.061 | 0.133 | 0.368 |
| dejection.5    | stMale   | Feminino  | dejection    |  14 | 0.367 |  0.368 | 0.144 | 0.552 | 0.114 | 0.031 | 0.066 | 0.147 |
| dejection.6    | stMale   | Masculino | dejection    |  16 | 0.237 |  0.222 | 0.000 | 0.606 | 0.190 | 0.047 | 0.101 | 0.207 |
| cheerfulness.1 | default  | Feminino  | cheerfulness |  15 | 3.278 |  3.250 | 1.575 | 5.450 | 1.381 | 0.356 | 0.765 | 2.500 |
| cheerfulness.2 | default  | Masculino | cheerfulness |  28 | 4.584 |  5.000 | 2.175 | 6.250 | 1.256 | 0.237 | 0.487 | 1.750 |
| cheerfulness.3 | stFemale | Feminino  | cheerfulness |  15 | 4.312 |  4.000 | 2.425 | 6.500 | 1.381 | 0.357 | 0.765 | 1.875 |
| cheerfulness.4 | stFemale | Masculino | cheerfulness |  14 | 4.275 |  4.500 | 1.698 | 6.150 | 1.282 | 0.343 | 0.740 | 0.938 |
| cheerfulness.5 | stMale   | Feminino  | cheerfulness |  14 | 3.948 |  4.125 | 1.851 | 6.175 | 1.390 | 0.372 | 0.803 | 1.812 |
| cheerfulness.6 | stMale   | Masculino | cheerfulness |  20 | 4.936 |  5.000 | 3.212 | 6.500 | 1.026 | 0.229 | 0.480 | 1.125 |
| agitation.1    | default  | Feminino  | agitation    |  15 | 1.636 |  1.473 | 1.082 | 2.345 | 0.453 | 0.117 | 0.251 | 0.789 |
| agitation.2    | default  | Masculino | agitation    |  28 | 1.619 |  1.581 | 1.082 | 2.182 | 0.357 | 0.068 | 0.139 | 0.569 |
| agitation.3    | stFemale | Feminino  | agitation    |  15 | 1.803 |  1.780 | 1.251 | 2.345 | 0.378 | 0.098 | 0.210 | 0.549 |
| agitation.4    | stFemale | Masculino | agitation    |  15 | 1.661 |  1.526 | 1.082 | 2.320 | 0.462 | 0.119 | 0.256 | 0.729 |
| agitation.5    | stMale   | Feminino  | agitation    |  14 | 1.749 |  1.731 | 1.128 | 2.345 | 0.417 | 0.111 | 0.241 | 0.440 |
| agitation.6    | stMale   | Masculino | agitation    |  20 | 1.638 |  1.554 | 1.282 | 2.094 | 0.268 | 0.060 | 0.126 | 0.433 |
| quiescence.1   | default  | Feminino  | quiescence   |  14 | 4.370 |  4.500 | 2.075 | 6.675 | 1.750 | 0.468 | 1.010 | 3.312 |
| quiescence.2   | default  | Masculino | quiescence   |  26 | 4.702 |  4.625 | 3.000 | 6.250 | 1.086 | 0.213 | 0.439 | 1.938 |
| quiescence.3   | stFemale | Feminino  | quiescence   |  15 | 4.135 |  4.000 | 2.548 | 5.975 | 1.213 | 0.313 | 0.672 | 2.250 |
| quiescence.4   | stFemale | Masculino | quiescence   |  15 | 4.800 |  4.750 | 2.372 | 6.552 | 1.386 | 0.358 | 0.767 | 2.125 |
| quiescence.5   | stMale   | Feminino  | quiescence   |  14 | 4.199 |  4.125 | 2.189 | 6.675 | 1.581 | 0.422 | 0.913 | 2.250 |
| quiescence.6   | stMale   | Masculino | quiescence   |  20 | 5.214 |  5.500 | 3.700 | 6.509 | 0.963 | 0.215 | 0.451 | 1.562 |

![](anova_files/figure-gfm/unnamed-chunk-19-1.png)<!-- -->![](anova_files/figure-gfm/unnamed-chunk-19-2.png)<!-- -->![](anova_files/figure-gfm/unnamed-chunk-19-3.png)<!-- -->![](anova_files/figure-gfm/unnamed-chunk-19-4.png)<!-- -->

## Computation of ANOVA test and Pairwise Comparison

### ANOVA test

| var          | Effect          | DFn | DFd |    SSn |     SSd |      F |     p |   ges | p.signif |
|:-------------|:----------------|----:|----:|-------:|--------:|-------:|------:|------:|:---------|
| dejection    | testType        |   2 |  86 |  0.002 |   3.563 |  0.029 | 0.972 | 0.001 | ns       |
| dejection    | gender          |   1 |  86 |  0.265 |   3.563 |  6.402 | 0.013 | 0.069 | \*       |
| dejection    | testType:gender |   2 |  86 |  0.019 |   3.563 |  0.234 | 0.792 | 0.005 | ns       |
| cheerfulness | testType        |   2 | 100 |  4.076 | 162.484 |  1.254 | 0.290 | 0.024 | ns       |
| cheerfulness | gender          |   1 | 100 | 16.837 | 162.484 | 10.362 | 0.002 | 0.094 | \*\*     |
| cheerfulness | testType:gender |   2 | 100 |  7.850 | 162.484 |  2.416 | 0.095 | 0.046 | ns       |
| agitation    | testType        |   2 | 101 |  0.159 |  14.946 |  0.538 | 0.586 | 0.011 | ns       |
| agitation    | gender          |   1 | 101 |  0.180 |  14.946 |  1.217 | 0.273 | 0.012 | ns       |
| agitation    | testType:gender |   2 | 101 |  0.076 |  14.946 |  0.258 | 0.773 | 0.005 | ns       |
| quiescence   | testType        |   2 |  98 |  1.550 | 166.896 |  0.455 | 0.636 | 0.009 | ns       |
| quiescence   | gender          |   1 |  98 | 10.798 | 166.896 |  6.340 | 0.013 | 0.061 | \*       |
| quiescence   | testType:gender |   2 |  98 |  2.017 | 166.896 |  0.592 | 0.555 | 0.012 | ns       |

### Pairwise comparison

| var          | testType | gender    | group1   | group2    | estimate | conf.low | conf.high |    se | statistic |     p | p.adj | p.adj.signif |
|:-------------|:---------|:----------|:---------|:----------|---------:|---------:|----------:|------:|----------:|------:|------:|:-------------|
| dejection    | NA       | Feminino  | default  | stFemale  |    0.037 |   -0.110 |     0.185 | 0.074 |     0.503 | 0.616 | 1.000 | ns           |
| dejection    | NA       | Feminino  | default  | stMale    |    0.010 |   -0.141 |     0.160 | 0.076 |     0.127 | 0.900 | 1.000 | ns           |
| dejection    | NA       | Feminino  | stFemale | stMale    |   -0.028 |   -0.178 |     0.123 | 0.076 |    -0.368 | 0.714 | 1.000 | ns           |
| dejection    | NA       | Masculino | default  | stFemale  |   -0.023 |   -0.169 |     0.122 | 0.073 |    -0.318 | 0.752 | 1.000 | ns           |
| dejection    | NA       | Masculino | default  | stMale    |    0.015 |   -0.122 |     0.152 | 0.069 |     0.216 | 0.830 | 1.000 | ns           |
| dejection    | NA       | Masculino | stFemale | stMale    |    0.038 |   -0.113 |     0.189 | 0.076 |     0.502 | 0.617 | 1.000 | ns           |
| dejection    | default  | NA        | Feminino | Masculino |    0.125 |   -0.015 |     0.264 | 0.070 |     1.772 | 0.080 | 0.080 | ns           |
| dejection    | stFemale | NA        | Feminino | Masculino |    0.064 |   -0.089 |     0.217 | 0.077 |     0.829 | 0.409 | 0.409 | ns           |
| dejection    | stMale   | NA        | Feminino | Masculino |    0.130 |   -0.018 |     0.278 | 0.074 |     1.744 | 0.085 | 0.085 | ns           |
| cheerfulness | NA       | Feminino  | default  | stFemale  |   -1.033 |   -1.957 |    -0.110 | 0.465 |    -2.220 | 0.029 | 0.086 | ns           |
| cheerfulness | NA       | Feminino  | default  | stMale    |   -0.670 |   -1.610 |     0.270 | 0.474 |    -1.414 | 0.160 | 0.481 | ns           |
| cheerfulness | NA       | Feminino  | stFemale | stMale    |    0.363 |   -0.576 |     1.303 | 0.474 |     0.767 | 0.445 | 1.000 | ns           |
| cheerfulness | NA       | Masculino | default  | stFemale  |    0.309 |   -0.519 |     1.137 | 0.417 |     0.741 | 0.461 | 1.000 | ns           |
| cheerfulness | NA       | Masculino | default  | stMale    |   -0.352 |   -1.092 |     0.389 | 0.373 |    -0.942 | 0.348 | 1.000 | ns           |
| cheerfulness | NA       | Masculino | stFemale | stMale    |   -0.661 |   -1.542 |     0.220 | 0.444 |    -1.488 | 0.140 | 0.420 | ns           |
| cheerfulness | default  | NA        | Feminino | Masculino |   -1.306 |   -2.115 |    -0.496 | 0.408 |    -3.201 | 0.002 | 0.002 | \*\*         |
| cheerfulness | stFemale | NA        | Feminino | Masculino |    0.037 |   -0.903 |     0.977 | 0.474 |     0.078 | 0.938 | 0.938 | ns           |
| cheerfulness | stMale   | NA        | Feminino | Masculino |   -0.987 |   -1.869 |    -0.106 | 0.444 |    -2.223 | 0.028 | 0.028 | \*           |
| agitation    | NA       | Feminino  | default  | stFemale  |   -0.167 |   -0.446 |     0.111 | 0.140 |    -1.191 | 0.237 | 0.710 | ns           |
| agitation    | NA       | Feminino  | default  | stMale    |   -0.114 |   -0.397 |     0.170 | 0.143 |    -0.796 | 0.428 | 1.000 | ns           |
| agitation    | NA       | Feminino  | stFemale | stMale    |    0.053 |   -0.230 |     0.337 | 0.143 |     0.374 | 0.709 | 1.000 | ns           |
| agitation    | NA       | Masculino | default  | stFemale  |   -0.041 |   -0.286 |     0.203 | 0.123 |    -0.336 | 0.737 | 1.000 | ns           |
| agitation    | NA       | Masculino | default  | stMale    |   -0.019 |   -0.242 |     0.205 | 0.113 |    -0.165 | 0.869 | 1.000 | ns           |
| agitation    | NA       | Masculino | stFemale | stMale    |    0.023 |   -0.238 |     0.283 | 0.131 |     0.174 | 0.863 | 1.000 | ns           |
| agitation    | default  | NA        | Feminino | Masculino |    0.016 |   -0.228 |     0.260 | 0.123 |     0.132 | 0.895 | 0.895 | ns           |
| agitation    | stFemale | NA        | Feminino | Masculino |    0.142 |   -0.137 |     0.421 | 0.140 |     1.012 | 0.314 | 0.314 | ns           |
| agitation    | stMale   | NA        | Feminino | Masculino |    0.111 |   -0.154 |     0.377 | 0.134 |     0.832 | 0.408 | 0.408 | ns           |
| quiescence   | NA       | Feminino  | default  | stFemale  |    0.235 |   -0.728 |     1.197 | 0.485 |     0.484 | 0.629 | 1.000 | ns           |
| quiescence   | NA       | Feminino  | default  | stMale    |    0.170 |   -0.808 |     1.149 | 0.493 |     0.346 | 0.730 | 1.000 | ns           |
| quiescence   | NA       | Feminino  | stFemale | stMale    |   -0.064 |   -1.027 |     0.898 | 0.485 |    -0.133 | 0.895 | 1.000 | ns           |
| quiescence   | NA       | Masculino | default  | stFemale  |   -0.098 |   -0.938 |     0.741 | 0.423 |    -0.233 | 0.817 | 1.000 | ns           |
| quiescence   | NA       | Masculino | default  | stMale    |   -0.513 |   -1.283 |     0.258 | 0.388 |    -1.320 | 0.190 | 0.569 | ns           |
| quiescence   | NA       | Masculino | stFemale | stMale    |   -0.414 |   -1.299 |     0.470 | 0.446 |    -0.929 | 0.355 | 1.000 | ns           |
| quiescence   | default  | NA        | Feminino | Masculino |   -0.332 |   -1.191 |     0.526 | 0.433 |    -0.768 | 0.444 | 0.444 | ns           |
| quiescence   | stFemale | NA        | Feminino | Masculino |   -0.665 |   -1.611 |     0.280 | 0.477 |    -1.397 | 0.166 | 0.166 | ns           |
| quiescence   | stMale   | NA        | Feminino | Masculino |   -1.015 |   -1.918 |    -0.113 | 0.455 |    -2.233 | 0.028 | 0.028 | \*           |

### Descriptive Statistic of Estimated Marginal Means

| var          | testType | gender    |   n | emmean |  mean | conf.low | conf.high |    sd | sd.emms | se.emms |
|:-------------|:---------|:----------|----:|-------:|------:|---------:|----------:|------:|--------:|--------:|
| agitation    | default  | Feminino  |  15 |  1.636 | 1.636 |    1.438 |     1.833 | 0.453 |   0.385 |   0.099 |
| agitation    | default  | Masculino |  28 |  1.619 | 1.619 |    1.475 |     1.763 | 0.357 |   0.385 |   0.073 |
| agitation    | stFemale | Feminino  |  15 |  1.803 | 1.803 |    1.606 |     2.000 | 0.378 |   0.385 |   0.099 |
| agitation    | stFemale | Masculino |  15 |  1.661 | 1.661 |    1.464 |     1.858 | 0.462 |   0.385 |   0.099 |
| agitation    | stMale   | Feminino  |  14 |  1.749 | 1.749 |    1.545 |     1.953 | 0.417 |   0.385 |   0.103 |
| agitation    | stMale   | Masculino |  20 |  1.638 | 1.638 |    1.467 |     1.808 | 0.268 |   0.385 |   0.086 |
| cheerfulness | default  | Feminino  |  15 |  3.278 | 3.278 |    2.625 |     3.931 | 1.381 |   1.275 |   0.329 |
| cheerfulness | default  | Masculino |  28 |  4.584 | 4.584 |    4.106 |     5.062 | 1.256 |   1.275 |   0.241 |
| cheerfulness | stFemale | Feminino  |  15 |  4.312 | 4.312 |    3.659 |     4.965 | 1.381 |   1.275 |   0.329 |
| cheerfulness | stFemale | Masculino |  14 |  4.275 | 4.275 |    3.599 |     4.951 | 1.282 |   1.275 |   0.341 |
| cheerfulness | stMale   | Feminino  |  14 |  3.948 | 3.948 |    3.272 |     4.624 | 1.390 |   1.275 |   0.341 |
| cheerfulness | stMale   | Masculino |  20 |  4.936 | 4.936 |    4.370 |     5.501 | 1.026 |   1.275 |   0.285 |
| dejection    | default  | Feminino  |  15 |  0.377 | 0.377 |    0.272 |     0.481 | 0.239 |   0.204 |   0.053 |
| dejection    | default  | Masculino |  19 |  0.252 | 0.252 |    0.159 |     0.345 | 0.188 |   0.204 |   0.047 |
| dejection    | stFemale | Feminino  |  15 |  0.339 | 0.339 |    0.235 |     0.444 | 0.244 |   0.204 |   0.053 |
| dejection    | stFemale | Masculino |  13 |  0.275 | 0.275 |    0.163 |     0.387 | 0.220 |   0.204 |   0.056 |
| dejection    | stMale   | Feminino  |  14 |  0.367 | 0.367 |    0.259 |     0.475 | 0.114 |   0.204 |   0.054 |
| dejection    | stMale   | Masculino |  16 |  0.237 | 0.237 |    0.136 |     0.338 | 0.190 |   0.204 |   0.051 |
| quiescence   | default  | Feminino  |  14 |  4.370 | 4.370 |    3.678 |     5.062 | 1.750 |   1.305 |   0.349 |
| quiescence   | default  | Masculino |  26 |  4.702 | 4.702 |    4.194 |     5.210 | 1.086 |   1.305 |   0.256 |
| quiescence   | stFemale | Feminino  |  15 |  4.135 | 4.135 |    3.466 |     4.803 | 1.213 |   1.305 |   0.337 |
| quiescence   | stFemale | Masculino |  15 |  4.800 | 4.800 |    4.132 |     5.469 | 1.386 |   1.305 |   0.337 |
| quiescence   | stMale   | Feminino  |  14 |  4.199 | 4.199 |    3.507 |     4.891 | 1.581 |   1.305 |   0.349 |
| quiescence   | stMale   | Masculino |  20 |  5.214 | 5.214 |    4.635 |     5.794 | 0.963 |   1.305 |   0.292 |

### Anova plots for the dependent variable “dejection”

``` r
plots <- twoWayAnovaPlots(sdat[["dejection"]], "dejection", between, aov[["dejection"]], pwc[["dejection"]], c("jitter"), font.label.size=14, step.increase=0.25)
```

#### Plot of “dejection” based on “testType” (color: gender)

``` r
plots[["testType"]]
```

![](anova_files/figure-gfm/unnamed-chunk-27-1.png)<!-- -->

#### Plot of “dejection” based on “gender” (color: testType)

``` r
plots[["gender"]]
```

![](anova_files/figure-gfm/unnamed-chunk-28-1.png)<!-- -->

### Anova plots for the dependent variable “cheerfulness”

``` r
plots <- twoWayAnovaPlots(sdat[["cheerfulness"]], "cheerfulness", between, aov[["cheerfulness"]], pwc[["cheerfulness"]], c("jitter"), font.label.size=14, step.increase=0.25)
```

#### Plot of “cheerfulness” based on “testType” (color: gender)

``` r
plots[["testType"]]
```

![](anova_files/figure-gfm/unnamed-chunk-30-1.png)<!-- -->

#### Plot of “cheerfulness” based on “gender” (color: testType)

``` r
plots[["gender"]]
```

![](anova_files/figure-gfm/unnamed-chunk-31-1.png)<!-- -->

### Anova plots for the dependent variable “agitation”

``` r
plots <- twoWayAnovaPlots(sdat[["agitation"]], "agitation", between, aov[["agitation"]], pwc[["agitation"]], c("jitter"), font.label.size=14, step.increase=0.25)
```

#### Plot of “agitation” based on “testType” (color: gender)

``` r
plots[["testType"]]
```

![](anova_files/figure-gfm/unnamed-chunk-33-1.png)<!-- -->

#### Plot of “agitation” based on “gender” (color: testType)

``` r
plots[["gender"]]
```

![](anova_files/figure-gfm/unnamed-chunk-34-1.png)<!-- -->

### Anova plots for the dependent variable “quiescence”

``` r
plots <- twoWayAnovaPlots(sdat[["quiescence"]], "quiescence", between, aov[["quiescence"]], pwc[["quiescence"]], c("jitter"), font.label.size=14, step.increase=0.25)
```

#### Plot of “quiescence” based on “testType” (color: gender)

``` r
plots[["testType"]]
```

![](anova_files/figure-gfm/unnamed-chunk-36-1.png)<!-- -->

#### Plot of “quiescence” based on “gender” (color: testType)

``` r
plots[["gender"]]
```

![](anova_files/figure-gfm/unnamed-chunk-37-1.png)<!-- -->

### Textual Report

ANOVA tests with independent between-subjects variables “testType”
(default, stFemale, stMale) and “gender” (Feminino, Masculino) were
performed to determine statistically significant difference on the
dependent varibles “dejection”, “cheerfulness”, “agitation”,
“quiescence”. For the dependent variable “dejection”, there was
statistically significant effects in the factor “gender” with
F(1,86)=6.402, p=0.013 and ges=0.069 (effect size). For the dependent
variable “cheerfulness”, there was statistically significant effects in
the factor “gender” with F(1,100)=10.362, p=0.002 and ges=0.094 (effect
size). For the dependent variable “agitation”, there was not
statistically significant effects. For the dependent variable
“quiescence”, there was statistically significant effects in the factor
“gender” with F(1,98)=6.34, p=0.013 and ges=0.061 (effect size).

Pairwise comparisons using the Estimated Marginal Means (EMMs) were
computed to find statistically significant diferences among the groups
defined by the independent variables, and with the p-values ajusted by
the method “bonferroni”. For the dependent variable “quiescence”, the
mean in the gender=“Feminino” (adj M=3.278 and SD=1.381) was
significantly different than the mean in the gender=“Masculino” (adj
M=4.584 and SD=1.256) with p-adj=0.002; the mean in the
gender=“Feminino” (adj M=3.948 and SD=1.39) was significantly different
than the mean in the gender=“Masculino” (adj M=4.936 and SD=1.026) with
p-adj=0.028; the mean in the gender=“Feminino” (adj M=4.199 and
SD=1.581) was significantly different than the mean in the
gender=“Masculino” (adj M=5.214 and SD=0.963) with p-adj=0.028.

## Tips and References

-   Use the site <https://www.tablesgenerator.com> to convert the HTML
    tables into Latex format

-   \[2\]: Miot, H. A. (2017). Assessing normality of data in clinical
    and experimental trials. J Vasc Bras, 16(2), 88-91.

-   \[3\]: Bárány, Imre; Vu, Van (2007). “Central limit theorems for
    Gaussian polytopes”. Annals of Probability. Institute of
    Mathematical Statistics. 35 (4): 1593–1621.