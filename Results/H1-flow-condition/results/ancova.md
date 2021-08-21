ANCOVA test for `fss`\~`dfs`+`Condition`
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

| Condition | variable |   n |  mean | median |   min |   max |    sd |    se |    ci |   iqr | symmetry | skewness | kurtosis |
|:----------|:---------|----:|------:|-------:|------:|------:|------:|------:|------:|------:|:---------|---------:|---------:|
| control   | fss      |  43 | 3.570 |  3.625 | 1.875 | 5.000 | 0.791 | 0.121 | 0.243 | 1.000 | YES      |   -0.306 |   -0.771 |
| inBoost   | fss      |  35 | 3.832 |  4.000 | 2.000 | 4.875 | 0.705 | 0.119 | 0.242 | 0.812 | NO       |   -0.693 |   -0.233 |
| inThreat  | fss      |  29 | 3.750 |  3.750 | 2.250 | 5.000 | 0.673 | 0.125 | 0.256 | 0.875 | YES      |   -0.143 |   -0.558 |
| NA        | fss      | 107 | 3.704 |  3.750 | 1.875 | 5.000 | 0.735 | 0.071 | 0.141 | 1.000 | YES      |   -0.440 |   -0.451 |

![](ancova_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

    ## [1] "670fa950-f6e7-11eb-991d-7bf2f9a6c3b9"

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
| fss | fss | 107 |   -0.504 |    -0.25 | NO       |     4.791 | D’Agostino | 0.091 | ns       | QQ        |

#### Result of normality test in each group

This is an optional validation and only valid for groups with number
greater than 30 observations

| Condition | variable |   n |  mean | median |   min |   max |    sd |    se |    ci |   iqr | normality | method       | statistic |     p | p.signif |
|:----------|:---------|----:|------:|-------:|------:|------:|------:|------:|------:|------:|:----------|:-------------|----------:|------:|:---------|
| control   | fss      |  43 | 3.570 |  3.625 | 1.875 | 5.000 | 0.791 | 0.121 | 0.243 | 1.000 | YES       | Shapiro-Wilk |     0.975 | 0.455 | ns       |
| inBoost   | fss      |  35 | 3.832 |  4.000 | 2.000 | 4.875 | 0.705 | 0.119 | 0.242 | 0.812 | YES       | Shapiro-Wilk |     0.942 | 0.065 | ns       |
| inThreat  | fss      |  29 | 3.750 |  3.750 | 2.250 | 5.000 | 0.673 | 0.125 | 0.256 | 0.875 | YES       | Shapiro-Wilk |     0.984 | 0.928 | ns       |

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

|       | var | method         | formula             |   n | DFn.df1 | DFd.df2 | statistic |     p | p.signif |
|:------|:----|:---------------|:--------------------|----:|--------:|--------:|----------:|------:|:---------|
| fss.1 | fss | Levene’s test  | `.res`\~`Condition` | 107 |       2 |     104 |     0.813 | 0.446 | ns       |
| fss.2 | fss | Anova’s slopes | `.res`\~`Condition` | 107 |       2 |     101 |     0.538 | 0.586 | ns       |

## Saving the Data with Normal Distribution Used for Performing ANCOVA test

``` r
ndat <- sdat[[1]]
for (dv in names(sdat)[-1]) ndat <- merge(ndat, sdat[[dv]])
write.csv(ndat, paste0("../data/table-with-normal-distribution.csv"))
```

Descriptive statistics of data with normal distribution

|       | Condition | variable |   n |  mean | median |   min |   max |    sd |    se |    ci |   iqr |
|:------|:----------|:---------|----:|------:|-------:|------:|------:|------:|------:|------:|------:|
| fss.1 | control   | fss      |  43 | 3.570 |  3.625 | 1.875 | 5.000 | 0.791 | 0.121 | 0.243 | 1.000 |
| fss.2 | inBoost   | fss      |  35 | 3.832 |  4.000 | 2.000 | 4.875 | 0.705 | 0.119 | 0.242 | 0.812 |
| fss.3 | inThreat  | fss      |  29 | 3.750 |  3.750 | 2.250 | 5.000 | 0.673 | 0.125 | 0.256 | 0.875 |

![](ancova_files/figure-gfm/unnamed-chunk-17-1.png)<!-- -->

## Computation of ANCOVA test and Pairwise Comparison

### ANCOVA test

| var | Effect    | DFn | DFd |   SSn |    SSd |     F |     p |   ges | p.signif |
|:----|:----------|----:|----:|------:|-------:|------:|------:|------:|:---------|
| fss | dfs       |   1 | 103 | 4.484 | 51.399 | 8.985 | 0.003 | 0.080 | \*\*     |
| fss | Condition |   2 | 103 | 1.109 | 51.399 | 1.111 | 0.333 | 0.021 | ns       |

### Pairwise comparison

| var | Condition | group1  | group2   | estimate | conf.low | conf.high |    se | statistic |     p | p.adj | p.adj.signif |
|:----|:----------|:--------|:---------|---------:|---------:|----------:|------:|----------:|------:|------:|:-------------|
| fss | NA        | control | inBoost  |   -0.237 |   -0.557 |     0.082 | 0.161 |    -1.474 | 0.143 |  0.43 | ns           |
| fss | NA        | control | inThreat |   -0.141 |   -0.479 |     0.197 | 0.170 |    -0.828 | 0.409 |  1.00 | ns           |
| fss | NA        | inBoost | inThreat |    0.096 |   -0.256 |     0.448 | 0.177 |     0.543 | 0.588 |  1.00 | ns           |

### Descriptive Statistic of Estimated Marginal Means

| var | Condition |   dfs | emmean | se.emms |  df | conf.low | conf.high | method       |   n |  mean | median |   min |   max |    sd | se.ds |    ci |   iqr | n.dfs | mean.dfs | median.dfs | min.dfs | max.dfs | sd.dfs | se.dfs | ci.dfs | iqr.dfs | sd.emms |
|:----|:----------|------:|-------:|--------:|----:|---------:|----------:|:-------------|----:|------:|-------:|------:|------:|------:|------:|------:|------:|------:|---------:|-----------:|--------:|--------:|-------:|-------:|-------:|--------:|--------:|
| fss | control   | 3.421 |  3.589 |   0.108 | 103 |    3.375 |     3.803 | Emmeans test |  43 | 3.570 |  3.625 | 1.875 | 5.000 | 0.791 | 0.121 | 0.243 | 1.000 |    43 |    3.370 |      3.400 |   2.111 |   4.889 |  0.612 |  0.093 |  0.188 |   0.722 |   0.708 |
| fss | inBoost   | 3.421 |  3.826 |   0.119 | 103 |    3.589 |     4.063 | Emmeans test |  35 | 3.832 |  4.000 | 2.000 | 4.875 | 0.705 | 0.119 | 0.242 | 0.812 |    35 |    3.438 |      3.444 |   2.444 |   4.778 |  0.534 |  0.090 |  0.183 |   0.556 |   0.707 |
| fss | inThreat  | 3.421 |  3.730 |   0.131 | 103 |    3.469 |     3.990 | Emmeans test |  29 | 3.750 |  3.750 | 2.250 | 5.000 | 0.673 | 0.125 | 0.256 | 0.875 |    29 |    3.477 |      3.333 |   2.667 |   5.000 |  0.531 |  0.099 |  0.202 |   0.667 |   0.707 |

### Ancova plots for the dependent variable “fss”

``` r
plots <- oneWayAncovaPlots(sdat[["fss"]], "fss", between
, aov[["fss"]], pwc[["fss"]], addParam = c("jitter"), font.label.size=14, step.increase=0.25)
```

#### Plot for: `fss` \~ `Condition`

``` r
plots[["Condition"]]
```

![](ancova_files/figure-gfm/unnamed-chunk-25-1.png)<!-- -->

### Textual Report

After controlling the linearity of covariance “dfs”, ANCOVA tests with
independent between-subjects variables “Condition” (inThreat, inBoost,
control) were performed to determine statistically significant
difference on the dependent varibles “fss”. For the dependent variable
“fss”, there was statistically significant effects in the factor “dfs”
with F(1,103)=8.985, p=0.003 and ges=0.08 (effect size).

## Tips and References

-   Use the site <https://www.tablesgenerator.com> to convert the HTML
    tables into Latex format

-   \[2\]: Miot, H. A. (2017). Assessing normality of data in clinical
    and experimental trials. J Vasc Bras, 16(2), 88-91.

-   \[3\]: Bárány, Imre; Vu, Van (2007). “Central limit theorems for
    Gaussian polytopes”. Annals of Probability. Institute of
    Mathematical Statistics. 35 (4): 1593–1621.