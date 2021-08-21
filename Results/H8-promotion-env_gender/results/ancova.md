ANCOVA test for `prevention.pos`\~`prevention.pre`+`testType`\*`gender`
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
        “prevention.pos”](#ancova-plots-for-the-dependent-variable-preventionpos)
    -   [Textual Report](#textual-report)
-   [Tips and References](#tips-and-references)

## Initial Variables and Data

-   R-script file: [../code/ancova.R](../code/ancova.R)
-   Initial table file:
    [../data/initial-table.csv](../data/initial-table.csv)
-   Data for prevention.pos
    [../data/table-for-prevention.pos.csv](../data/table-for-prevention.pos.csv)
-   Table without outliers and normal distribution of data:
    [../data/table-with-normal-distribution.csv](../data/table-with-normal-distribution.csv)
-   Other data files: [../data/](../data/)
-   Files related to the presented results: [../results/](../results/)

### Descriptive statistics of initial data

| testType | gender    | variable       |   n |  mean | median |  min |  max |    sd |    se |    ci |   iqr | symmetry | skewness | kurtosis |
|:---------|:----------|:---------------|----:|------:|-------:|-----:|-----:|------:|------:|------:|------:|:---------|---------:|---------:|
| default  | Feminino  | prevention.pos |  15 | 3.347 |  2.790 | 1.00 | 5.63 | 1.611 | 0.416 | 0.892 | 2.880 | YES      |   -0.018 |   -1.723 |
| default  | Masculino | prevention.pos |  28 | 3.080 |  2.830 | 1.46 | 6.50 | 1.152 | 0.218 | 0.447 | 1.402 | NO       |    0.904 |    0.669 |
| stFemale | Feminino  | prevention.pos |  15 | 3.684 |  3.380 | 1.75 | 6.75 | 1.384 | 0.357 | 0.766 | 1.980 | NO       |    0.547 |   -0.726 |
| stFemale | Masculino | prevention.pos |  15 | 3.091 |  2.830 | 1.46 | 5.04 | 1.345 | 0.347 | 0.745 | 2.490 | YES      |    0.074 |   -1.755 |
| stMale   | Feminino  | prevention.pos |  14 | 3.504 |  3.435 | 1.08 | 5.67 | 1.481 | 0.396 | 0.855 | 2.170 | YES      |   -0.194 |   -1.342 |
| stMale   | Masculino | prevention.pos |  20 | 2.818 |  2.665 | 1.42 | 5.17 | 0.936 | 0.209 | 0.438 | 1.242 | NO       |    0.595 |   -0.201 |
| NA       | NA        | prevention.pos | 107 | 3.210 |  2.920 | 1.00 | 6.75 | 1.296 | 0.125 | 0.248 | 1.880 | YES      |    0.425 |   -0.610 |

![](ancova_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

    ## [1] "9bf2ecf0-df62-11eb-bf23-972ef7bdc96c"

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

|                | var            |   n | skewness | kurtosis | symmetry | statistic | method     |     p | p.signif | normality |
|:---------------|:---------------|----:|---------:|---------:|:---------|----------:|:-----------|------:|:---------|:----------|
| prevention.pos | prevention.pos | 107 |     0.25 |   -0.728 | YES      |     4.949 | D’Agostino | 0.084 | ns       | QQ        |

#### Result of normality test in each group

This is an optional validation and only valid for groups with number
greater than 30 observations

| testType | gender    | variable       |   n |  mean | median |  min |  max |    sd |    se |    ci |   iqr | normality | method       | statistic |     p | p.signif |
|:---------|:----------|:---------------|----:|------:|-------:|-----:|-----:|------:|------:|------:|------:|:----------|:-------------|----------:|------:|:---------|
| default  | Feminino  | prevention.pos |  15 | 3.347 |  2.790 | 1.00 | 5.63 | 1.611 | 0.416 | 0.892 | 2.880 | YES       | Shapiro-Wilk |     0.891 | 0.070 | ns       |
| default  | Masculino | prevention.pos |  28 | 3.080 |  2.830 | 1.46 | 6.50 | 1.152 | 0.218 | 0.447 | 1.402 | YES       | Shapiro-Wilk |     0.937 | 0.093 | ns       |
| stFemale | Feminino  | prevention.pos |  15 | 3.684 |  3.380 | 1.75 | 6.75 | 1.384 | 0.357 | 0.766 | 1.980 | YES       | Shapiro-Wilk |     0.948 | 0.489 | ns       |
| stFemale | Masculino | prevention.pos |  15 | 3.091 |  2.830 | 1.46 | 5.04 | 1.345 | 0.347 | 0.745 | 2.490 | YES       | Shapiro-Wilk |     0.888 | 0.063 | ns       |
| stMale   | Feminino  | prevention.pos |  14 | 3.504 |  3.435 | 1.08 | 5.67 | 1.481 | 0.396 | 0.855 | 2.170 | YES       | Shapiro-Wilk |     0.953 | 0.613 | ns       |
| stMale   | Masculino | prevention.pos |  20 | 2.818 |  2.665 | 1.42 | 5.17 | 0.936 | 0.209 | 0.438 | 1.242 | YES       | Shapiro-Wilk |     0.959 | 0.524 | ns       |

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
ggscatter(sdat[["prevention.pos"]], x=covar, y="prevention.pos", facet.by=between, short.panel.labs = F) + 
 stat_smooth(method = "lm", span = 0.9)
```

    ## `geom_smooth()` using formula 'y ~ x'

![](ancova_files/figure-gfm/unnamed-chunk-11-1.png)<!-- -->

### Assumption: Homogeneity of data distribution

|                  | var            | method         | formula                      |   n | DFn.df1 | DFd.df2 | statistic |     p | p.signif |
|:-----------------|:---------------|:---------------|:-----------------------------|----:|--------:|--------:|----------:|------:|:---------|
| prevention.pos.1 | prevention.pos | Levene’s test  | `.res`\~`testType`\*`gender` | 107 |       5 |     101 |     1.803 | 0.119 | ns       |
| prevention.pos.2 | prevention.pos | Anova’s slopes | `.res`\~`testType`\*`gender` | 107 |       5 |      95 |     1.481 | 0.203 | ns       |

## Saving the Data with Normal Distribution Used for Performing ANCOVA test

``` r
ndat <- sdat[[1]]
for (dv in names(sdat)[-1]) ndat <- merge(ndat, sdat[[dv]])
write.csv(ndat, paste0("../data/table-with-normal-distribution.csv"))
```

Descriptive statistics of data with normal distribution

|                  | testType | gender    | variable       |   n |  mean | median |  min |  max |    sd |    se |    ci |   iqr |
|:-----------------|:---------|:----------|:---------------|----:|------:|-------:|-----:|-----:|------:|------:|------:|------:|
| prevention.pos.1 | default  | Feminino  | prevention.pos |  15 | 3.347 |  2.790 | 1.00 | 5.63 | 1.611 | 0.416 | 0.892 | 2.880 |
| prevention.pos.2 | default  | Masculino | prevention.pos |  28 | 3.080 |  2.830 | 1.46 | 6.50 | 1.152 | 0.218 | 0.447 | 1.402 |
| prevention.pos.3 | stFemale | Feminino  | prevention.pos |  15 | 3.684 |  3.380 | 1.75 | 6.75 | 1.384 | 0.357 | 0.766 | 1.980 |
| prevention.pos.4 | stFemale | Masculino | prevention.pos |  15 | 3.091 |  2.830 | 1.46 | 5.04 | 1.345 | 0.347 | 0.745 | 2.490 |
| prevention.pos.5 | stMale   | Feminino  | prevention.pos |  14 | 3.504 |  3.435 | 1.08 | 5.67 | 1.481 | 0.396 | 0.855 | 2.170 |
| prevention.pos.6 | stMale   | Masculino | prevention.pos |  20 | 2.818 |  2.665 | 1.42 | 5.17 | 0.936 | 0.209 | 0.438 | 1.242 |

![](ancova_files/figure-gfm/unnamed-chunk-17-1.png)<!-- -->

## Computation of ANCOVA test and Pairwise Comparison

### ANCOVA test

| var            | Effect          | DFn | DFd |   SSn |     SSd |     F |     p |   ges | p.signif |
|:---------------|:----------------|----:|----:|------:|--------:|------:|------:|------:|:---------|
| prevention.pos | prevention.pre  |   1 | 100 | 1.843 | 167.594 | 1.100 | 0.297 | 0.011 | ns       |
| prevention.pos | testType        |   2 | 100 | 1.120 | 167.594 | 0.334 | 0.717 | 0.007 | ns       |
| prevention.pos | gender          |   1 | 100 | 6.112 | 167.594 | 3.647 | 0.059 | 0.035 | ns       |
| prevention.pos | testType:gender |   2 | 100 | 1.123 | 167.594 | 0.335 | 0.716 | 0.007 | ns       |

### Pairwise comparison

| var            | testType | gender    | group1   | group2    | estimate | conf.low | conf.high |    se | statistic |     p | p.adj | p.adj.signif |
|:---------------|:---------|:----------|:---------|:----------|---------:|---------:|----------:|------:|----------:|------:|------:|:-------------|
| prevention.pos | NA       | Feminino  | default  | stFemale  |   -0.357 |   -1.296 |     0.581 | 0.473 |    -0.755 | 0.452 | 1.000 | ns           |
| prevention.pos | NA       | Feminino  | default  | stMale    |   -0.164 |   -1.118 |     0.791 | 0.481 |    -0.340 | 0.734 | 1.000 | ns           |
| prevention.pos | NA       | Feminino  | stFemale | stMale    |    0.193 |   -0.761 |     1.148 | 0.481 |     0.402 | 0.688 | 1.000 | ns           |
| prevention.pos | NA       | Masculino | default  | stFemale  |    0.009 |   -0.814 |     0.831 | 0.415 |     0.021 | 0.983 | 1.000 | ns           |
| prevention.pos | NA       | Masculino | default  | stMale    |    0.313 |   -0.445 |     1.072 | 0.382 |     0.820 | 0.414 | 1.000 | ns           |
| prevention.pos | NA       | Masculino | stFemale | stMale    |    0.305 |   -0.575 |     1.184 | 0.443 |     0.688 | 0.493 | 1.000 | ns           |
| prevention.pos | default  | NA        | Feminino | Masculino |    0.227 |   -0.598 |     1.053 | 0.416 |     0.547 | 0.586 | 0.586 | ns           |
| prevention.pos | stFemale | NA        | Feminino | Masculino |    0.593 |   -0.345 |     1.531 | 0.473 |     1.255 | 0.212 | 0.212 | ns           |
| prevention.pos | stMale   | NA        | Feminino | Masculino |    0.705 |   -0.191 |     1.600 | 0.451 |     1.561 | 0.122 | 0.122 | ns           |

### Descriptive Statistic of Estimated Marginal Means

| var            | testType | gender    | prevention.pre | emmean | se.emms |  df | conf.low | conf.high | method       |   n |  mean | median |  min |  max |    sd | se.ds |    ci |   iqr | n.prevention.pre | mean.prevention.pre | median.prevention.pre | min.prevention.pre | max.prevention.pre | sd.prevention.pre | se.prevention.pre | ci.prevention.pre | iqr.prevention.pre | sd.emms |
|:---------------|:---------|:----------|---------------:|-------:|--------:|----:|---------:|----------:|:-------------|----:|------:|-------:|-----:|-----:|------:|------:|------:|------:|-----------------:|--------------------:|----------------------:|-------------------:|-------------------:|------------------:|------------------:|------------------:|-------------------:|--------:|
| prevention.pos | default  | Feminino  |          6.664 |  3.332 |   0.335 | 100 |    2.669 |     3.996 | Emmeans test |  15 | 3.347 |  2.790 | 1.00 | 5.63 | 1.611 | 0.416 | 0.892 | 2.880 |               15 |               7.000 |                     6 |                  3 |                 12 |             2.828 |             0.730 |             1.566 |               4.50 |   1.296 |
| prevention.pos | default  | Masculino |          6.664 |  3.105 |   0.246 | 100 |    2.617 |     3.593 | Emmeans test |  28 | 3.080 |  2.830 | 1.46 | 6.50 | 1.152 | 0.218 | 0.447 | 1.402 |               28 |               6.071 |                     6 |                  3 |                 10 |             2.071 |             0.391 |             0.803 |               2.50 |   1.301 |
| prevention.pos | stFemale | Feminino  |          6.664 |  3.690 |   0.334 | 100 |    3.026 |     4.353 | Emmeans test |  15 | 3.684 |  3.380 | 1.75 | 6.75 | 1.384 | 0.357 | 0.766 | 1.980 |               15 |               6.533 |                     5 |                  3 |                 15 |             4.155 |             1.073 |             2.301 |               4.00 |   1.295 |
| prevention.pos | stFemale | Masculino |          6.664 |  3.096 |   0.334 | 100 |    2.433 |     3.759 | Emmeans test |  15 | 3.091 |  2.830 | 1.46 | 5.04 | 1.345 | 0.347 | 0.745 | 2.490 |               15 |               6.533 |                     6 |                  3 |                 11 |             3.044 |             0.786 |             1.686 |               5.00 |   1.295 |
| prevention.pos | stMale   | Feminino  |          6.664 |  3.496 |   0.346 | 100 |    2.809 |     4.183 | Emmeans test |  14 | 3.504 |  3.435 | 1.08 | 5.67 | 1.481 | 0.396 | 0.855 | 2.170 |               14 |               6.857 |                     5 |                  3 |                 13 |             3.613 |             0.966 |             2.086 |               5.75 |   1.295 |
| prevention.pos | stMale   | Masculino |          6.664 |  2.791 |   0.291 | 100 |    2.215 |     3.368 | Emmeans test |  20 | 2.818 |  2.665 | 1.42 | 5.17 | 0.936 | 0.209 | 0.438 | 1.242 |               20 |               7.300 |                     6 |                  3 |                 15 |             3.614 |             0.808 |             1.692 |               4.25 |   1.300 |

### Ancova plots for the dependent variable “prevention.pos”

``` r
plots <- twoWayAncovaPlots(sdat[["prevention.pos"]], "prevention.pos", between
, aov[["prevention.pos"]], pwc[["prevention.pos"]], addParam = c("jitter"), font.label.size=14, step.increase=0.25)
```

#### Plot for: `prevention.pos` \~ `testType`

``` r
plots[["testType"]]
```

![](ancova_files/figure-gfm/unnamed-chunk-25-1.png)<!-- -->

#### Plot for: `prevention.pos` \~ `gender`

``` r
plots[["gender"]]
```

![](ancova_files/figure-gfm/unnamed-chunk-26-1.png)<!-- -->

### Textual Report

After controlling the linearity of covariance “prevention.pre”, ANCOVA
tests with independent between-subjects variables “testType” (stFemale,
stMale, default) and “gender” (Masculino, Feminino) were performed to
determine statistically significant difference on the dependent varibles
“prevention.pos”. For the dependent variable “prevention.pos”, there was
not statistically significant effects.

## Tips and References

-   Use the site <https://www.tablesgenerator.com> to convert the HTML
    tables into Latex format

-   \[2\]: Miot, H. A. (2017). Assessing normality of data in clinical
    and experimental trials. J Vasc Bras, 16(2), 88-91.

-   \[3\]: Bárány, Imre; Vu, Van (2007). “Central limit theorems for
    Gaussian polytopes”. Annals of Probability. Institute of
    Mathematical Statistics. 35 (4): 1593–1621.