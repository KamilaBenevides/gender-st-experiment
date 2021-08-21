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

#### Dealing with outliers (performing treatment of outliers)

### Assumption: Normality distribution of data

#### Removing data that affect normality (extreme values)

``` r
non.normal <- list(

)
sdat <- removeFromDataTable(rdat, non.normal, wid)
```

#### Result of normality test in the residual model

|              | var          |   n | skewness | kurtosis | symmetry | statistic | method     |     p | p.signif | normality |
|:-------------|:-------------|----:|---------:|---------:|:---------|----------:|:-----------|------:|:---------|:----------|
| dejection    | dejection    | 107 |    1.387 |    1.881 | NO       |    32.853 | D’Agostino | 0.000 | \*\*\*\* | QQ        |
| cheerfulness | cheerfulness | 107 |   -0.170 |   -0.386 | YES      |     0.926 | D’Agostino | 0.629 | ns       | QQ        |
| agitation    | agitation    | 107 |    0.586 |   -0.625 | NO       |     8.362 | D’Agostino | 0.015 | ns       | QQ        |
| quiescence   | quiescence   | 107 |   -0.180 |   -0.565 | YES      |     2.127 | D’Agostino | 0.345 | ns       | QQ        |

#### Result of normality test in each group

This is an optional validation and only valid for groups with number
greater than 30 observations

| testType | gender    | variable     |   n |  mean | median |  min |   max |    sd |    se |    ci |   iqr | normality | method       | statistic |     p | p.signif |
|:---------|:----------|:-------------|----:|------:|-------:|-----:|------:|------:|------:|------:|------:|:----------|:-------------|----------:|------:|:---------|
| default  | Feminino  | dejection    |  15 | 2.867 |  2.333 | 1.00 | 7.000 | 1.685 | 0.435 | 0.933 | 2.167 | YES       | Shapiro-Wilk |     0.900 | 0.094 | ns       |
| default  | Masculino | dejection    |  28 | 1.708 |  1.333 | 1.00 | 5.000 | 1.004 | 0.190 | 0.389 | 1.333 | NO        | Shapiro-Wilk |     0.741 | 0.000 | \*\*\*\* |
| stFemale | Feminino  | dejection    |  15 | 2.689 |  2.333 | 1.00 | 7.000 | 1.752 | 0.452 | 0.970 | 1.500 | NO        | Shapiro-Wilk |     0.856 | 0.021 | \*       |
| stFemale | Masculino | dejection    |  15 | 2.000 |  2.000 | 1.00 | 4.667 | 1.134 | 0.293 | 0.628 | 1.333 | NO        | Shapiro-Wilk |     0.827 | 0.008 | \*\*     |
| stMale   | Feminino  | dejection    |  14 | 2.500 |  2.333 | 1.00 | 5.333 | 0.994 | 0.266 | 0.574 | 0.833 | NO        | Shapiro-Wilk |     0.832 | 0.013 | \*       |
| stMale   | Masculino | dejection    |  20 | 1.967 |  1.667 | 1.00 | 6.000 | 1.297 | 0.290 | 0.607 | 1.000 | NO        | Shapiro-Wilk |     0.729 | 0.000 | \*\*\*\* |
| default  | Feminino  | cheerfulness |  15 | 3.367 |  3.250 | 1.50 | 7.000 | 1.614 | 0.417 | 0.894 | 2.500 | YES       | Shapiro-Wilk |     0.925 | 0.231 | ns       |
| default  | Masculino | cheerfulness |  28 | 4.554 |  5.000 | 1.25 | 6.500 | 1.356 | 0.256 | 0.526 | 1.750 | YES       | Shapiro-Wilk |     0.945 | 0.144 | ns       |
| stFemale | Feminino  | cheerfulness |  15 | 4.317 |  4.000 | 2.25 | 6.750 | 1.428 | 0.369 | 0.791 | 1.875 | YES       | Shapiro-Wilk |     0.947 | 0.473 | ns       |
| stFemale | Masculino | cheerfulness |  15 | 4.083 |  4.500 | 1.00 | 6.500 | 1.528 | 0.395 | 0.846 | 1.000 | YES       | Shapiro-Wilk |     0.905 | 0.112 | ns       |
| stMale   | Feminino  | cheerfulness |  14 | 3.911 |  4.125 | 1.00 | 6.500 | 1.543 | 0.412 | 0.891 | 1.812 | YES       | Shapiro-Wilk |     0.975 | 0.932 | ns       |
| stMale   | Masculino | cheerfulness |  20 | 4.900 |  5.000 | 2.50 | 6.500 | 1.098 | 0.246 | 0.514 | 1.125 | YES       | Shapiro-Wilk |     0.954 | 0.428 | ns       |
| default  | Feminino  | agitation    |  15 | 2.875 |  2.170 | 1.00 | 5.800 | 1.627 | 0.420 | 0.901 | 2.660 | NO        | Shapiro-Wilk |     0.871 | 0.035 | \*       |
| default  | Masculino | agitation    |  28 | 2.792 |  2.500 | 1.00 | 6.000 | 1.288 | 0.243 | 0.499 | 1.915 | YES       | Shapiro-Wilk |     0.937 | 0.091 | ns       |
| stFemale | Feminino  | agitation    |  15 | 3.435 |  3.170 | 1.33 | 6.500 | 1.546 | 0.399 | 0.856 | 2.000 | YES       | Shapiro-Wilk |     0.932 | 0.296 | ns       |
| stFemale | Masculino | agitation    |  15 | 2.953 |  2.330 | 1.00 | 5.500 | 1.605 | 0.415 | 0.889 | 2.415 | YES       | Shapiro-Wilk |     0.892 | 0.071 | ns       |
| stMale   | Feminino  | agitation    |  14 | 3.238 |  3.000 | 1.17 | 5.830 | 1.503 | 0.402 | 0.868 | 1.585 | YES       | Shapiro-Wilk |     0.945 | 0.481 | ns       |
| stMale   | Masculino | agitation    |  20 | 2.824 |  2.415 | 1.17 | 6.330 | 1.187 | 0.265 | 0.556 | 1.415 | NO        | Shapiro-Wilk |     0.898 | 0.038 | \*       |
| default  | Feminino  | quiescence   |  15 | 4.183 |  4.250 | 1.00 | 7.000 | 1.967 | 0.508 | 1.089 | 3.375 | YES       | Shapiro-Wilk |     0.933 | 0.307 | ns       |
| default  | Masculino | quiescence   |  28 | 4.634 |  4.625 | 1.00 | 6.500 | 1.310 | 0.248 | 0.508 | 2.062 | YES       | Shapiro-Wilk |     0.937 | 0.095 | ns       |
| stFemale | Feminino  | quiescence   |  15 | 4.067 |  4.000 | 1.00 | 6.500 | 1.465 | 0.378 | 0.811 | 2.250 | YES       | Shapiro-Wilk |     0.966 | 0.802 | ns       |
| stFemale | Masculino | quiescence   |  15 | 4.772 |  4.750 | 1.75 | 6.750 | 1.488 | 0.384 | 0.824 | 2.125 | YES       | Shapiro-Wilk |     0.942 | 0.407 | ns       |
| stMale   | Feminino  | quiescence   |  14 | 4.232 |  4.125 | 2.00 | 7.000 | 1.680 | 0.449 | 0.970 | 2.250 | YES       | Shapiro-Wilk |     0.929 | 0.299 | ns       |
| stMale   | Masculino | quiescence   |  20 | 5.191 |  5.500 | 2.75 | 7.000 | 1.098 | 0.246 | 0.514 | 1.562 | YES       | Shapiro-Wilk |     0.966 | 0.663 | ns       |

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
| dejection    | dejection    | Levene’s test | `dejection`\~`testType`\*`gender`    | 107 |   5 | 101 |     1.603 | 0.166 | ns       |
| cheerfulness | cheerfulness | Levene’s test | `cheerfulness`\~`testType`\*`gender` | 107 |   5 | 101 |     0.538 | 0.747 | ns       |
| agitation    | agitation    | Levene’s test | `agitation`\~`testType`\*`gender`    | 107 |   5 | 101 |     0.705 | 0.621 | ns       |
| quiescence   | quiescence   | Levene’s test | `quiescence`\~`testType`\*`gender`   | 107 |   5 | 101 |     1.684 | 0.145 | ns       |

## Saving the Data with Normal Distribution Used for Performing ANOVA test

``` r
ndat <- sdat[[1]]
for (dv in names(sdat)[-1]) ndat <- merge(ndat, sdat[[dv]])
```

    ## debug: ndat <- merge(ndat, sdat[[dv]])
    ## debug: ndat <- merge(ndat, sdat[[dv]])
    ## debug: ndat <- merge(ndat, sdat[[dv]])

``` r
write.csv(ndat, paste0("../data/table-with-normal-distribution.csv"))
```

Descriptive statistics of data with normal distribution

|                | testType | gender    | variable     |   n |  mean | median |  min |   max |    sd |    se |    ci |   iqr |
|:---------------|:---------|:----------|:-------------|----:|------:|-------:|-----:|------:|------:|------:|------:|------:|
| dejection.1    | default  | Feminino  | dejection    |  15 | 2.867 |  2.333 | 1.00 | 7.000 | 1.685 | 0.435 | 0.933 | 2.167 |
| dejection.2    | default  | Masculino | dejection    |  28 | 1.708 |  1.333 | 1.00 | 5.000 | 1.004 | 0.190 | 0.389 | 1.333 |
| dejection.3    | stFemale | Feminino  | dejection    |  15 | 2.689 |  2.333 | 1.00 | 7.000 | 1.752 | 0.452 | 0.970 | 1.500 |
| dejection.4    | stFemale | Masculino | dejection    |  15 | 2.000 |  2.000 | 1.00 | 4.667 | 1.134 | 0.293 | 0.628 | 1.333 |
| dejection.5    | stMale   | Feminino  | dejection    |  14 | 2.500 |  2.333 | 1.00 | 5.333 | 0.994 | 0.266 | 0.574 | 0.833 |
| dejection.6    | stMale   | Masculino | dejection    |  20 | 1.967 |  1.667 | 1.00 | 6.000 | 1.297 | 0.290 | 0.607 | 1.000 |
| cheerfulness.1 | default  | Feminino  | cheerfulness |  15 | 3.367 |  3.250 | 1.50 | 7.000 | 1.614 | 0.417 | 0.894 | 2.500 |
| cheerfulness.2 | default  | Masculino | cheerfulness |  28 | 4.554 |  5.000 | 1.25 | 6.500 | 1.356 | 0.256 | 0.526 | 1.750 |
| cheerfulness.3 | stFemale | Feminino  | cheerfulness |  15 | 4.317 |  4.000 | 2.25 | 6.750 | 1.428 | 0.369 | 0.791 | 1.875 |
| cheerfulness.4 | stFemale | Masculino | cheerfulness |  15 | 4.083 |  4.500 | 1.00 | 6.500 | 1.528 | 0.395 | 0.846 | 1.000 |
| cheerfulness.5 | stMale   | Feminino  | cheerfulness |  14 | 3.911 |  4.125 | 1.00 | 6.500 | 1.543 | 0.412 | 0.891 | 1.812 |
| cheerfulness.6 | stMale   | Masculino | cheerfulness |  20 | 4.900 |  5.000 | 2.50 | 6.500 | 1.098 | 0.246 | 0.514 | 1.125 |
| agitation.1    | default  | Feminino  | agitation    |  15 | 2.875 |  2.170 | 1.00 | 5.800 | 1.627 | 0.420 | 0.901 | 2.660 |
| agitation.2    | default  | Masculino | agitation    |  28 | 2.792 |  2.500 | 1.00 | 6.000 | 1.288 | 0.243 | 0.499 | 1.915 |
| agitation.3    | stFemale | Feminino  | agitation    |  15 | 3.435 |  3.170 | 1.33 | 6.500 | 1.546 | 0.399 | 0.856 | 2.000 |
| agitation.4    | stFemale | Masculino | agitation    |  15 | 2.953 |  2.330 | 1.00 | 5.500 | 1.605 | 0.415 | 0.889 | 2.415 |
| agitation.5    | stMale   | Feminino  | agitation    |  14 | 3.238 |  3.000 | 1.17 | 5.830 | 1.503 | 0.402 | 0.868 | 1.585 |
| agitation.6    | stMale   | Masculino | agitation    |  20 | 2.824 |  2.415 | 1.17 | 6.330 | 1.187 | 0.265 | 0.556 | 1.415 |
| quiescence.1   | default  | Feminino  | quiescence   |  15 | 4.183 |  4.250 | 1.00 | 7.000 | 1.967 | 0.508 | 1.089 | 3.375 |
| quiescence.2   | default  | Masculino | quiescence   |  28 | 4.634 |  4.625 | 1.00 | 6.500 | 1.310 | 0.248 | 0.508 | 2.062 |
| quiescence.3   | stFemale | Feminino  | quiescence   |  15 | 4.067 |  4.000 | 1.00 | 6.500 | 1.465 | 0.378 | 0.811 | 2.250 |
| quiescence.4   | stFemale | Masculino | quiescence   |  15 | 4.772 |  4.750 | 1.75 | 6.750 | 1.488 | 0.384 | 0.824 | 2.125 |
| quiescence.5   | stMale   | Feminino  | quiescence   |  14 | 4.232 |  4.125 | 2.00 | 7.000 | 1.680 | 0.449 | 0.970 | 2.250 |
| quiescence.6   | stMale   | Masculino | quiescence   |  20 | 5.191 |  5.500 | 2.75 | 7.000 | 1.098 | 0.246 | 0.514 | 1.562 |

    ## debug at <text>#2: car::Boxplot(dv ~ testType * gender, data = sdat[[dv]] %>% cbind(dv = sdat[[dv]][[dv]]), 
    ##     id = list(n = Inf))

![](anova_files/figure-gfm/unnamed-chunk-16-1.png)<!-- -->

    ## debug at <text>#2: car::Boxplot(dv ~ testType * gender, data = sdat[[dv]] %>% cbind(dv = sdat[[dv]][[dv]]), 
    ##     id = list(n = Inf))

![](anova_files/figure-gfm/unnamed-chunk-16-2.png)<!-- -->

    ## debug at <text>#2: car::Boxplot(dv ~ testType * gender, data = sdat[[dv]] %>% cbind(dv = sdat[[dv]][[dv]]), 
    ##     id = list(n = Inf))

![](anova_files/figure-gfm/unnamed-chunk-16-3.png)<!-- -->

    ## debug at <text>#2: car::Boxplot(dv ~ testType * gender, data = sdat[[dv]] %>% cbind(dv = sdat[[dv]][[dv]]), 
    ##     id = list(n = Inf))

![](anova_files/figure-gfm/unnamed-chunk-16-4.png)<!-- -->

## Computation of ANOVA test and Pairwise Comparison

### ANOVA test

| var          | Effect          | DFn | DFd |    SSn |     SSd |     F |     p |   ges | p.signif |
|:-------------|:----------------|----:|----:|-------:|--------:|------:|------:|------:|:---------|
| dejection    | testType        |   2 | 101 |  0.216 | 172.738 | 0.063 | 0.939 | 0.001 | ns       |
| dejection    | gender          |   1 | 101 | 17.083 | 172.738 | 9.989 | 0.002 | 0.090 | \*\*     |
| dejection    | testType:gender |   2 | 101 |  1.924 | 172.738 | 0.562 | 0.572 | 0.011 | ns       |
| cheerfulness | testType        |   2 | 101 |  2.994 | 201.296 | 0.751 | 0.474 | 0.015 | ns       |
| cheerfulness | gender          |   1 | 101 | 12.691 | 201.296 | 6.367 | 0.013 | 0.059 | \*       |
| cheerfulness | testType:gender |   2 | 101 |  9.537 | 201.296 | 2.393 | 0.097 | 0.045 | ns       |
| agitation    | testType        |   2 | 101 |  1.866 | 207.511 | 0.454 | 0.636 | 0.009 | ns       |
| agitation    | gender          |   1 | 101 |  2.404 | 207.511 | 1.170 | 0.282 | 0.011 | ns       |
| agitation    | testType:gender |   2 | 101 |  0.809 | 207.511 | 0.197 | 0.822 | 0.004 | ns       |
| quiescence   | testType        |   2 | 101 |  2.781 | 221.162 | 0.635 | 0.532 | 0.012 | ns       |
| quiescence   | gender          |   1 | 101 | 12.135 | 221.162 | 5.542 | 0.021 | 0.052 | \*       |
| quiescence   | testType:gender |   2 | 101 |  1.159 | 221.162 | 0.265 | 0.768 | 0.005 | ns       |

### Pairwise comparison

| var          | testType | gender    | group1   | group2    | estimate | conf.low | conf.high |    se | statistic |     p | p.adj | p.adj.signif |
|:-------------|:---------|:----------|:---------|:----------|---------:|---------:|----------:|------:|----------:|------:|------:|:-------------|
| dejection    | NA       | Feminino  | default  | stFemale  |    0.178 |   -0.770 |     1.125 | 0.478 |     0.372 | 0.710 | 1.000 | ns           |
| dejection    | NA       | Feminino  | default  | stMale    |    0.367 |   -0.597 |     1.331 | 0.486 |     0.754 | 0.452 | 1.000 | ns           |
| dejection    | NA       | Feminino  | stFemale | stMale    |    0.189 |   -0.775 |     1.153 | 0.486 |     0.389 | 0.698 | 1.000 | ns           |
| dejection    | NA       | Masculino | default  | stFemale  |   -0.292 |   -1.122 |     0.538 | 0.418 |    -0.697 | 0.487 | 1.000 | ns           |
| dejection    | NA       | Masculino | default  | stMale    |   -0.258 |   -1.018 |     0.501 | 0.383 |    -0.675 | 0.501 | 1.000 | ns           |
| dejection    | NA       | Masculino | stFemale | stMale    |    0.033 |   -0.853 |     0.919 | 0.447 |     0.075 | 0.941 | 1.000 | ns           |
| dejection    | default  | NA        | Feminino | Masculino |    1.158 |    0.328 |     1.988 | 0.418 |     2.768 | 0.007 | 0.007 | \*\*         |
| dejection    | stFemale | NA        | Feminino | Masculino |    0.689 |   -0.258 |     1.636 | 0.478 |     1.443 | 0.152 | 0.152 | ns           |
| dejection    | stMale   | NA        | Feminino | Masculino |    0.533 |   -0.371 |     1.437 | 0.456 |     1.170 | 0.245 | 0.245 | ns           |
| cheerfulness | NA       | Feminino  | default  | stFemale  |   -0.950 |   -1.973 |     0.073 | 0.515 |    -1.843 | 0.068 | 0.205 | ns           |
| cheerfulness | NA       | Feminino  | default  | stMale    |   -0.544 |   -1.585 |     0.497 | 0.525 |    -1.037 | 0.302 | 0.907 | ns           |
| cheerfulness | NA       | Feminino  | stFemale | stMale    |    0.406 |   -0.635 |     1.447 | 0.525 |     0.774 | 0.441 | 1.000 | ns           |
| cheerfulness | NA       | Masculino | default  | stFemale  |    0.470 |   -0.426 |     1.366 | 0.452 |     1.041 | 0.300 | 0.901 | ns           |
| cheerfulness | NA       | Masculino | default  | stMale    |   -0.346 |   -1.166 |     0.473 | 0.413 |    -0.838 | 0.404 | 1.000 | ns           |
| cheerfulness | NA       | Masculino | stFemale | stMale    |   -0.817 |   -1.773 |     0.140 | 0.482 |    -1.694 | 0.093 | 0.280 | ns           |
| cheerfulness | default  | NA        | Feminino | Masculino |   -1.187 |   -2.083 |    -0.291 | 0.452 |    -2.628 | 0.010 | 0.010 | \*\*         |
| cheerfulness | stFemale | NA        | Feminino | Masculino |    0.233 |   -0.789 |     1.256 | 0.515 |     0.453 | 0.652 | 0.652 | ns           |
| cheerfulness | stMale   | NA        | Feminino | Masculino |   -0.989 |   -1.965 |    -0.013 | 0.492 |    -2.011 | 0.047 | 0.047 | \*           |
| agitation    | NA       | Feminino  | default  | stFemale  |   -0.559 |   -1.598 |     0.479 | 0.523 |    -1.069 | 0.288 | 0.863 | ns           |
| agitation    | NA       | Feminino  | default  | stMale    |   -0.363 |   -1.419 |     0.694 | 0.533 |    -0.681 | 0.498 | 1.000 | ns           |
| agitation    | NA       | Feminino  | stFemale | stMale    |    0.197 |   -0.860 |     1.253 | 0.533 |     0.369 | 0.713 | 1.000 | ns           |
| agitation    | NA       | Masculino | default  | stFemale  |   -0.162 |   -1.071 |     0.748 | 0.459 |    -0.352 | 0.725 | 1.000 | ns           |
| agitation    | NA       | Masculino | default  | stMale    |   -0.033 |   -0.865 |     0.800 | 0.420 |    -0.078 | 0.938 | 1.000 | ns           |
| agitation    | NA       | Masculino | stFemale | stMale    |    0.129 |   -0.842 |     1.100 | 0.490 |     0.263 | 0.793 | 1.000 | ns           |
| agitation    | default  | NA        | Feminino | Masculino |    0.084 |   -0.826 |     0.993 | 0.459 |     0.182 | 0.856 | 0.856 | ns           |
| agitation    | stFemale | NA        | Feminino | Masculino |    0.481 |   -0.557 |     1.520 | 0.523 |     0.920 | 0.360 | 0.360 | ns           |
| agitation    | stMale   | NA        | Feminino | Masculino |    0.413 |   -0.577 |     1.404 | 0.499 |     0.828 | 0.410 | 0.410 | ns           |
| quiescence   | NA       | Feminino  | default  | stFemale  |    0.117 |   -0.955 |     1.189 | 0.540 |     0.216 | 0.829 | 1.000 | ns           |
| quiescence   | NA       | Feminino  | default  | stMale    |   -0.049 |   -1.140 |     1.042 | 0.550 |    -0.089 | 0.929 | 1.000 | ns           |
| quiescence   | NA       | Feminino  | stFemale | stMale    |   -0.165 |   -1.256 |     0.925 | 0.550 |    -0.301 | 0.764 | 1.000 | ns           |
| quiescence   | NA       | Masculino | default  | stFemale  |   -0.138 |   -1.077 |     0.801 | 0.473 |    -0.292 | 0.771 | 1.000 | ns           |
| quiescence   | NA       | Masculino | default  | stMale    |   -0.558 |   -1.417 |     0.302 | 0.433 |    -1.287 | 0.201 | 0.603 | ns           |
| quiescence   | NA       | Masculino | stFemale | stMale    |   -0.420 |   -1.422 |     0.583 | 0.505 |    -0.830 | 0.409 | 1.000 | ns           |
| quiescence   | default  | NA        | Feminino | Masculino |   -0.451 |   -1.390 |     0.489 | 0.473 |    -0.952 | 0.344 | 0.344 | ns           |
| quiescence   | stFemale | NA        | Feminino | Masculino |   -0.705 |   -1.777 |     0.367 | 0.540 |    -1.305 | 0.195 | 0.195 | ns           |
| quiescence   | stMale   | NA        | Feminino | Masculino |   -0.959 |   -1.982 |     0.064 | 0.516 |    -1.860 | 0.066 | 0.066 | ns           |

### Descriptive Statistic of Estimated Marginal Means

| var          | testType | gender    |   n | emmean |  mean | conf.low | conf.high |    sd | sd.emms | se.emms |
|:-------------|:---------|:----------|----:|-------:|------:|---------:|----------:|------:|--------:|--------:|
| agitation    | default  | Feminino  |  15 |  2.875 | 2.875 |    2.141 |     3.610 | 1.627 |   1.433 |   0.370 |
| agitation    | default  | Masculino |  28 |  2.792 | 2.792 |    2.254 |     3.329 | 1.288 |   1.433 |   0.271 |
| agitation    | stFemale | Feminino  |  15 |  3.435 | 3.435 |    2.700 |     4.169 | 1.546 |   1.433 |   0.370 |
| agitation    | stFemale | Masculino |  15 |  2.953 | 2.953 |    2.219 |     3.688 | 1.605 |   1.433 |   0.370 |
| agitation    | stMale   | Feminino  |  14 |  3.238 | 3.238 |    2.478 |     3.998 | 1.503 |   1.433 |   0.383 |
| agitation    | stMale   | Masculino |  20 |  2.824 | 2.824 |    2.189 |     3.460 | 1.187 |   1.433 |   0.321 |
| cheerfulness | default  | Feminino  |  15 |  3.367 | 3.367 |    2.644 |     4.090 | 1.614 |   1.412 |   0.365 |
| cheerfulness | default  | Masculino |  28 |  4.554 | 4.554 |    4.024 |     5.083 | 1.356 |   1.412 |   0.267 |
| cheerfulness | stFemale | Feminino  |  15 |  4.317 | 4.317 |    3.594 |     5.040 | 1.428 |   1.412 |   0.365 |
| cheerfulness | stFemale | Masculino |  15 |  4.083 | 4.083 |    3.360 |     4.806 | 1.528 |   1.412 |   0.365 |
| cheerfulness | stMale   | Feminino  |  14 |  3.911 | 3.911 |    3.162 |     4.659 | 1.543 |   1.412 |   0.377 |
| cheerfulness | stMale   | Masculino |  20 |  4.900 | 4.900 |    4.274 |     5.526 | 1.098 |   1.412 |   0.316 |
| dejection    | default  | Feminino  |  15 |  2.867 | 2.867 |    2.197 |     3.537 | 1.685 |   1.308 |   0.338 |
| dejection    | default  | Masculino |  28 |  1.708 | 1.708 |    1.218 |     2.199 | 1.004 |   1.308 |   0.247 |
| dejection    | stFemale | Feminino  |  15 |  2.689 | 2.689 |    2.019 |     3.359 | 1.752 |   1.308 |   0.338 |
| dejection    | stFemale | Masculino |  15 |  2.000 | 2.000 |    1.330 |     2.670 | 1.134 |   1.308 |   0.338 |
| dejection    | stMale   | Feminino  |  14 |  2.500 | 2.500 |    1.807 |     3.193 | 0.994 |   1.308 |   0.350 |
| dejection    | stMale   | Masculino |  20 |  1.967 | 1.967 |    1.387 |     2.547 | 1.297 |   1.308 |   0.292 |
| quiescence   | default  | Feminino  |  15 |  4.183 | 4.183 |    3.425 |     4.941 | 1.967 |   1.480 |   0.382 |
| quiescence   | default  | Masculino |  28 |  4.634 | 4.634 |    4.079 |     5.189 | 1.310 |   1.480 |   0.280 |
| quiescence   | stFemale | Feminino  |  15 |  4.067 | 4.067 |    3.309 |     4.825 | 1.465 |   1.480 |   0.382 |
| quiescence   | stFemale | Masculino |  15 |  4.772 | 4.772 |    4.014 |     5.530 | 1.488 |   1.480 |   0.382 |
| quiescence   | stMale   | Feminino  |  14 |  4.232 | 4.232 |    3.448 |     5.017 | 1.680 |   1.480 |   0.395 |
| quiescence   | stMale   | Masculino |  20 |  5.191 | 5.191 |    4.535 |     5.848 | 1.098 |   1.480 |   0.331 |

### Anova plots for the dependent variable “dejection”

``` r
plots <- twoWayAnovaPlots(sdat[["dejection"]], "dejection", between, aov[["dejection"]], pwc[["dejection"]], c("jitter"), font.label.size=14, step.increase=0.25)
```

#### Plot of “dejection” based on “testType” (color: gender)

``` r
plots[["testType"]]
```

![](anova_files/figure-gfm/unnamed-chunk-24-1.png)<!-- -->

#### Plot of “dejection” based on “gender” (color: testType)

``` r
plots[["gender"]]
```

![](anova_files/figure-gfm/unnamed-chunk-25-1.png)<!-- -->

### Anova plots for the dependent variable “cheerfulness”

``` r
plots <- twoWayAnovaPlots(sdat[["cheerfulness"]], "cheerfulness", between, aov[["cheerfulness"]], pwc[["cheerfulness"]], c("jitter"), font.label.size=14, step.increase=0.25)
```

#### Plot of “cheerfulness” based on “testType” (color: gender)

``` r
plots[["testType"]]
```

![](anova_files/figure-gfm/unnamed-chunk-27-1.png)<!-- -->

#### Plot of “cheerfulness” based on “gender” (color: testType)

``` r
plots[["gender"]]
```

![](anova_files/figure-gfm/unnamed-chunk-28-1.png)<!-- -->

### Anova plots for the dependent variable “agitation”

``` r
plots <- twoWayAnovaPlots(sdat[["agitation"]], "agitation", between, aov[["agitation"]], pwc[["agitation"]], c("jitter"), font.label.size=14, step.increase=0.25)
```

#### Plot of “agitation” based on “testType” (color: gender)

``` r
plots[["testType"]]
```

![](anova_files/figure-gfm/unnamed-chunk-30-1.png)<!-- -->

#### Plot of “agitation” based on “gender” (color: testType)

``` r
plots[["gender"]]
```

![](anova_files/figure-gfm/unnamed-chunk-31-1.png)<!-- -->

### Anova plots for the dependent variable “quiescence”

``` r
plots <- twoWayAnovaPlots(sdat[["quiescence"]], "quiescence", between, aov[["quiescence"]], pwc[["quiescence"]], c("jitter"), font.label.size=14, step.increase=0.25)
```

#### Plot of “quiescence” based on “testType” (color: gender)

``` r
plots[["testType"]]
```

![](anova_files/figure-gfm/unnamed-chunk-33-1.png)<!-- -->

#### Plot of “quiescence” based on “gender” (color: testType)

``` r
plots[["gender"]]
```

![](anova_files/figure-gfm/unnamed-chunk-34-1.png)<!-- -->

### Textual Report

ANOVA tests with independent between-subjects variables “testType”
(stFemale, stMale, default) and “gender” (Masculino, Feminino) were
performed to determine statistically significant difference on the
dependent varibles “dejection”, “cheerfulness”, “agitation”,
“quiescence”. For the dependent variable “dejection”, there was
statistically significant effects in the factor “gender” with
F(1,101)=9.989, p=0.002 and ges=0.09 (effect size). For the dependent
variable “cheerfulness”, there was statistically significant effects in
the factor “gender” with F(1,101)=6.367, p=0.013 and ges=0.059 (effect
size). For the dependent variable “agitation”, there was not
statistically significant effects. For the dependent variable
“quiescence”, there was statistically significant effects in the factor
“gender” with F(1,101)=5.542, p=0.021 and ges=0.052 (effect size).

Pairwise comparisons using the Estimated Marginal Means (EMMs) were
computed to find statistically significant diferences among the groups
defined by the independent variables, and with the p-values ajusted by
the method “bonferroni”. For the dependent variable “cheerfulness”, the
mean in the gender=“Feminino” (adj M=2.867 and SD=1.685) was
significantly different than the mean in the gender=“Masculino” (adj
M=1.708 and SD=1.004) with p-adj=0.007; the mean in the
gender=“Feminino” (adj M=3.367 and SD=1.614) was significantly different
than the mean in the gender=“Masculino” (adj M=4.554 and SD=1.356) with
p-adj=0.01; the mean in the gender=“Feminino” (adj M=3.911 and SD=1.543)
was significantly different than the mean in the gender=“Masculino” (adj
M=4.9 and SD=1.098) with p-adj=0.047.

## Tips and References

-   Use the site <https://www.tablesgenerator.com> to convert the HTML
    tables into Latex format

-   \[2\]: Miot, H. A. (2017). Assessing normality of data in clinical
    and experimental trials. J Vasc Bras, 16(2), 88-91.

-   \[3\]: Bárány, Imre; Vu, Van (2007). “Central limit theorems for
    Gaussian polytopes”. Annals of Probability. Institute of
    Mathematical Statistics. 35 (4): 1593–1621.