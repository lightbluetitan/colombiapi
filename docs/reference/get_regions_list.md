# Get the List of Regions in Colombia

This function retrieves a list of regions in Colombia from the public
API "https://api-colombia.com/api/v1/Region" and returns a data frame
containing selected information about each region, ordered by region
name in alphabetical order.

## Usage

``` r
get_regions_list()
```

## Value

A data frame with the following columns:

- `id`: The unique identifier of the region.

- `name`: The name of the region.

## Details

This function sends a GET request to the API, processes the JSON
response, and converts it into a structured data frame. The data is
filtered and formatted to include only relevant columns (`id` and
`name`), and it is ordered by the `name` column in alphabetical order (A
to Z).

If the API returns a status code other than 200, the function issues a
message with the status code received and returns `NULL`.

## Note

Ensure you have an active internet connection to access the API. If the
API structure changes or the API becomes unavailable, the function may
need modifications.

This function relies on the following packages: `httr`, `jsonlite`,
`dplyr`, and `magrittr`. The `%>%` operator, used for chaining commands,
is provided by the `magrittr` package.

## See also

[`GET`](https://httr.r-lib.org/reference/GET.html),
[`fromJSON`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html),
[`select`](https://dplyr.tidyverse.org/reference/select.html),
[`arrange`](https://dplyr.tidyverse.org/reference/arrange.html)

## Examples

``` r
if (FALSE) { # \dontrun{
# Retrieve the list of regions
regions <- get_regions_list()

# Print the data frame
print(regions)

# View the data in a spreadsheet-like interface
View(regions)

# Select regions with specific characteristics (e.g., starting with "Atlántico")
atlantic_regions <- regions %>%
  filter(grepl("^Atlántico", name))
print(atlantic_regions)
} # }
```
