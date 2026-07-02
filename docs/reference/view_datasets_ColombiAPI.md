# View Available Datasets in ColombiAPI

This function lists all datasets available in the 'ColombiAPI' package.
If the 'ColombiAPI' package is not loaded, it stops and shows an error
message. If no datasets are available, it returns a message and an empty
vector.

## Usage

``` r
view_datasets_ColombiAPI()
```

## Value

A character vector with the names of the available datasets. If no
datasets are found, it returns an empty character vector.

## Examples

``` r
if (requireNamespace("ColombiAPI", quietly = TRUE)) {
  library(ColombiAPI)
  view_datasets_ColombiAPI()
}
#> Datasets available in the 'ColombiAPI' package:
#>  [1] "Bogota_airstations_df"       "Bogota_business_Date"       
#>  [3] "Bogota_holidays_Date"        "Bogota_malls_tbl_df"        
#>  [5] "Bucaramanga_wifi_tbl_df"     "Cannabis_Licenses_tbl_df"   
#>  [7] "Cartagena_wifi_tbl_df"       "Colombia_coffee_tbl_df"     
#>  [9] "Medellin_rain_tbl_df"        "Tulua_Public_Schools_tbl_df"
#> [11] "admitted_students_df"        "dead_lianas_df"             
#> [13] "digital_centers_tbl_df"      "digital_graduates_tbl_df"   
#> [15] "foreign_visitors_tbl_df"     "gdp_departments_tbl_df"     
#> [17] "indigenous_vocabulary_df"    "municipalities_tbl_df"      
#> [19] "school_levels_df"            "vehicle_count_tbl_df"       
```
