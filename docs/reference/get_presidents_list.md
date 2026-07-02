# Get the List of Presidents of Colombia

This function retrieves the list of presidents of Colombia from the
public API "https://api-colombia.com/api/v1/President" and returns a
data frame containing selected information about each president, ordered
by their start period date in descending order (most recent first).

## Usage

``` r
get_presidents_list()
```

## Value

A data frame with the following columns:

- `id`: The unique identifier of the president.

- `name`: The first name of the president.

- `lastName`: The last name of the president.

- `startPeriodDate`: The start date of the presidential period (in ISO
  8601 format).

- `endPeriodDate`: The end date of the presidential period (in ISO 8601
  format).

- `politicalParty`: The political party of the president.

## Details

This function sends a GET request to the API, processes the JSON
response, and converts it into a structured data frame. The data is
filtered and formatted to include only relevant columns, and it is
ordered by the `startPeriodDate` column in descending order.

If the API returns a status code of 400, the function issues a warning
message to inform the user of the error. Any other unexpected API
response is not explicitly handled and may cause the function to fail.

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
# Retrieve the list of presidents
presidents <- get_president_list()

# Print the data frame
print(presidents)

# View the data in a spreadsheet-like interface
View(presidents)

# Select presidents from a specific political party
library(dplyr)
liberal_presidents <- presidents %>%
  filter(politicalParty == "Liberal")
print(liberal_presidents)
} # }
```
