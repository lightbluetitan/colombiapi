# Get the List of Airports in Colombia

This function retrieves a list of airports in Colombia from the public
API "https://api-colombia.com/api/v1/Airport" and returns a data frame
containing selected information about each airport, ordered by airport
name in alphabetical order.

## Usage

``` r
get_airports_list()
```

## Value

A data frame with the following columns:

- `id`: The unique identifier of the airport.

- `name`: The name of the airport.

- `iataCode`: The IATA code of the airport (if available).

- `oaciCode`: The OACI code of the airport (if available).

- `type`: The type of airport (e.g., commercial, private).

- `longitude`: The geographical longitude of the airport.

- `latitude`: The geographical latitude of the airport.

## Details

This function sends a GET request to the API, processes the JSON
response, and converts it into a structured data frame. The data is
filtered and formatted to include only relevant columns, and it is
ordered by the `name` column in alphabetical order (A to Z).

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
# Retrieve the list of airports
airports <- get_airports_list()

# Print the data frame
print(airports)

# View the data in a spreadsheet-like interface
View(airports)

# Select airports located in a specific city (e.g., Bogotá)
bogota_airports <- airports %>%
  filter(grepl("Bogotá", name))
print(bogota_airports)
} # }
```
