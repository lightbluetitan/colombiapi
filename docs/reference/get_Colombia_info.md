# Get Information About Colombia

This function makes an API call
https://api-colombia.com/api/v1/Country/Colombia to retrieve information
about Colombia, such as its name, surface area, population, time zone,
currency, and region. It processes the API response and returns the data
in a structured data.frame.

## Usage

``` r
get_Colombia_info()
```

## Value

A \`data.frame\` with the following columns:

- `name`: Name of the country.

- `surface`: The surface area of the country in square kilometers.

- `population`: The population of the country.

- `timeZone`: The time zone of the country.

- `currency`: The currency used in the country.

- `currencySymbol`: The currency symbol.

- `region`: The region of the country in the world.

## Details

The function sends a GET request to the API at
<https://api-colombia.com/api/v1/Country/Colombia>. If the API returns a
successful response (status code 200), the data is parsed and returned.
If the response is unsuccessful or the structure is not as expected, the
function will return `NULL`.

## Note

Ensure you have an active internet connection to access the API. If the
API structure changes or the API becomes unavailable, the function may
need modifications.

This function relies on the following packages: `httr` and `jsonlite`.
These packages are used for making HTTP requests and processing JSON
responses, respectively.

## Examples

``` r
if (FALSE) { # \dontrun{
  # Call the function to get Colombia information
  colombia_info <- get_Colombia_info()

  # Print the result
  print(colombia_info)
} # }
```
