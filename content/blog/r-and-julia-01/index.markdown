---
title: "An R user meets julia"
subtitle: "Trying to get oriented"
author: "Matt Williamson"
date: "2026-06-09"
excerpt: >
  I've wanted to learn `julia` for a long time, but felt overwhelmed every time I tried to get started. This article (and series) is my effort to force myself to get over that. As a geographer and ecologist, most of my computational background comes from `R` (with some `Stan`) so the bulk of these posts will be devoted to helping me learn to do "`R`-things" with `julia`. Maybe other julia-curious folks will find this useful. 
draft: true
series:
  - "julia for the R user"
tags: ["r", "julia"]
categories: ["r", "julia"]
layout: single-sidebar
format: hugo-md
engine: knitr
execute:
  warning: false
  message: false
  fig-width: 8
  fig-height: 5
knitr:
  opts_chunk:
    collapse: true
    comment: "#>"
---



## What!? Whyyyyyyyyyy????

I'm a quantitative geographer that uses Bayesian statistics and computational models to understand the emergence and effectiveness of environmental institutions. Although I write code daily for my work, I am **definitely not** a computer scientist. Most of what I know about `R` and `Stan`, I've learned by teaching myself, reading helpful vignettes online, or begging for help on various discourse forums and Github issue pages. I've gotten passable enough at using `R` for spatial analyses that they even let me teach a [course](https://isdrfall25.classes.spaseslab.com/) on it^[I do not teach any courses in `Stan`, but I use it a lot for [my research](https://scholar.google.com/citations?user=SfbubrAAAAAJ&hl=en&oi=ao)]. So, why am I forcing myself to learn Julia.



## The R approach


``` r
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  scale_color_spases() +
  labs(
    x = "Weight (1000 lbs)",
    y = "Miles per Gallon",
    color = "Cylinders"
  ) +
  theme_minimal()
```

<div class="figure">
<img src="{{< blogdown/postref >}}index_files/figure-html/fig-r-example-1.png" alt="Example plot using the SPASES palette in R" width="672" />
<p class="caption"><span id="fig:fig-r-example"></span>Figure 1: Example plot using the SPASES palette in R</p>
</div>

## The Julia approach


``` julia
using CairoMakie

fig = Figure(size = (700, 450))
ax = Axis(fig[1, 1],
    xlabel = "Weight (1000 lbs)",
    ylabel = "Miles per Gallon"
)
```

```
## Axis with 0 plots:
```

``` julia

x = [2.6, 3.2, 3.5, 3.8, 4.1]
```

```
## 5-element Vector{Float64}:
##  2.6
##  3.2
##  3.5
##  3.8
##  4.1
```

``` julia
y = [21.0, 18.5, 16.2, 14.8, 13.5]
```

```
## 5-element Vector{Float64}:
##  21.0
##  18.5
##  16.2
##  14.8
##  13.5
```

``` julia
scatter!(ax, x, y, markersize = 12)
```

```
## Scatter{Tuple{Vector{Point{2, Float64}}}}
```

``` julia

save("julia-example.png", fig, px_per_unit = 2)
```

![Equivalent plot in Julia](julia-example.png)

## Comparison

Wrap up what's similar, what's different, and when you might prefer
one approach over the other.

## Session info


``` r
sessionInfo()
```

```
## R version 4.5.3 (2026-03-11)
## Platform: x86_64-apple-darwin20
## Running under: macOS Sequoia 15.7.5
## 
## Matrix products: default
## BLAS:   /Library/Frameworks/R.framework/Versions/4.5-x86_64/Resources/lib/libRblas.0.dylib 
## LAPACK: /Library/Frameworks/R.framework/Versions/4.5-x86_64/Resources/lib/libRlapack.dylib;  LAPACK version 3.12.1
## 
## locale:
## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
## 
## time zone: America/Boise
## tzcode source: internal
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] ggplot2_4.0.0    JuliaCall_0.17.6
## 
## loaded via a namespace (and not attached):
##  [1] vctrs_0.7.1        cli_3.6.6          knitr_1.51         rlang_1.2.0       
##  [5] xfun_0.56          generics_0.1.4     S7_0.2.0           jsonlite_2.0.0    
##  [9] labeling_0.4.3     glue_1.8.0         htmltools_0.5.8.1  sass_0.4.10       
## [13] scales_1.4.0       rmarkdown_2.30     grid_4.5.3         tibble_3.3.1      
## [17] evaluate_1.0.5     jquerylib_0.1.4    fastmap_1.2.0      yaml_2.3.12       
## [21] lifecycle_1.0.5    bookdown_0.45      compiler_4.5.3     dplyr_1.2.0       
## [25] RColorBrewer_1.1-3 pkgconfig_2.0.3    Rcpp_1.1.1         rstudioapi_0.17.1 
## [29] blogdown_1.21      farver_2.1.2       digest_0.6.37      R6_2.6.1          
## [33] tidyselect_1.2.1   pillar_1.11.1      magrittr_2.0.4     bslib_0.9.0       
## [37] withr_3.0.2        tools_4.5.3        gtable_0.3.6       cachem_1.1.0
```

