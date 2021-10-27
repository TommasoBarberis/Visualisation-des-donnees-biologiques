# TP

## Recuperation des données

``` r
load("../../shiny/data_varis/dfvaris_litter.Rdata")
```

### Forme des données

``` r
dim(dfvaris_litter) # 1340 portées
```

    ## [1] 1340   13

``` r
names(dfvaris_litter)
```

    ##  [1] "species"           "yearbirth"         "littersizebirth"  
    ##  [4] "littersizeweaning" "sexratiobirth"     "sexratioweaning"  
    ##  [7] "survlitter48h"     "survlitterweaning" "survlittersexmat" 
    ## [10] "agedam"            "agemaxdam"         "agesire"          
    ## [13] "agemaxsire"

``` r
str(dfvaris_litter) # types des variables
```

    ## 'data.frame':    1340 obs. of  13 variables:
    ##  $ species          : Factor w/ 2 levels "Vrubra","Vvariegata": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ yearbirth        : int  1991 2008 1998 1989 1994 1998 2000 2012 2003 1978 ...
    ##  $ littersizebirth  : num  2 2 1 2 1 1 1 1 2 3 ...
    ##  $ littersizeweaning: int  1 1 0 0 1 1 0 0 2 3 ...
    ##  $ sexratiobirth    : num  1 0 1 1 0 ...
    ##  $ sexratioweaning  : num  1 0 NaN NaN 0 ...
    ##  $ survlitter48h    : num  1 0.5 1 1 1 1 0 1 1 1 ...
    ##  $ survlitterweaning: num  0.5 0.5 0 0 1 1 0 0 1 1 ...
    ##  $ survlittersexmat : num  0.5 0.5 0 0 1 1 0 0 1 1 ...
    ##  $ agedam           : num  8 8 13 3 11 7 12 16 16 5 ...
    ##  $ agemaxdam        : num  26.6 15.7 23.8 29.7 30 ...
    ##  $ agesire          : num  5 9 20 4 11 6 10 16 9 10 ...
    ##  $ agemaxsire       : num  12.64 16.69 34.51 6.21 22.31 ...

``` r
summary(dfvaris_litter)
```

    ##        species      yearbirth    littersizebirth littersizeweaning
    ##  Vrubra    :378   Min.   :1973   Min.   :1.000   Min.   :0.000    
    ##  Vvariegata:962   1st Qu.:1990   1st Qu.:1.000   1st Qu.:1.000    
    ##                   Median :1998   Median :2.000   Median :1.000    
    ##                   Mean   :1997   Mean   :1.966   Mean   :1.383    
    ##                   3rd Qu.:2005   3rd Qu.:3.000   3rd Qu.:2.000    
    ##                   Max.   :2015   Max.   :6.000   Max.   :6.000    
    ##                                                                   
    ##  sexratiobirth    sexratioweaning  survlitter48h   survlitterweaning
    ##  Min.   :0.0000   Min.   :0.0000   Min.   :0.000   Min.   :0.0000   
    ##  1st Qu.:0.2500   1st Qu.:0.0000   1st Qu.:1.000   1st Qu.:0.5000   
    ##  Median :0.5000   Median :0.5000   Median :1.000   Median :1.0000   
    ##  Mean   :0.5742   Mean   :0.5599   Mean   :0.841   Mean   :0.7195   
    ##  3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:1.000   3rd Qu.:1.0000   
    ##  Max.   :1.0000   Max.   :1.0000   Max.   :1.000   Max.   :1.0000   
    ##                   NA's   :283      NA's   :14      NA's   :14       
    ##  survlittersexmat     agedam         agemaxdam        agesire      
    ##  Min.   :0.0000   Min.   : 2.000   Min.   : 3.00   Min.   : 2.000  
    ##  1st Qu.:0.3333   1st Qu.: 5.000   1st Qu.:13.69   1st Qu.: 6.000  
    ##  Median :1.0000   Median : 8.000   Median :19.70   Median : 8.000  
    ##  Mean   :0.6901   Mean   : 8.515   Mean   :19.58   Mean   : 9.233  
    ##  3rd Qu.:1.0000   3rd Qu.:11.000   3rd Qu.:24.61   3rd Qu.:12.000  
    ##  Max.   :1.0000   Max.   :30.000   Max.   :44.64   Max.   :38.000  
    ##  NA's   :14                                                        
    ##    agemaxsire   
    ##  Min.   : 1.72  
    ##  1st Qu.:14.64  
    ##  Median :19.72  
    ##  Mean   :19.83  
    ##  3rd Qu.:24.30  
    ##  Max.   :52.54  
    ## 

``` r
length(unique(dfvaris_litter$species)) # nb d'espèces
```

    ## [1] 2

``` r
unique(dfvaris_litter$species)
```

    ## [1] Vrubra     Vvariegata
    ## Levels: Vrubra Vvariegata

``` r
library(dplyr)
```

    ## 
    ## Attachement du package : 'dplyr'

    ## Les objets suivants sont masqués depuis 'package:stats':
    ## 
    ##     filter, lag

    ## Les objets suivants sont masqués depuis 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
sub_dfvaris_litter <- dfvaris_litter %>% dplyr::group_by(species) %>% dplyr::sample_n(100) %>% as.data.frame
```

``` r
dfvaris_litter$PAD <- dfvaris_litter$agesire - dfvaris_litter$agedam
```
