# Get the List of Departments in Colombia

This function retrieves a list of departments in Colombia from the
public API "https://api-colombia.com/api/v1/Department" and returns a
data frame containing selected information about each department,
ordered by department name in alphabetical order.

## Usage

``` r
get_departments_list()
```

## Value

A data frame with the following columns:

- `id`: The unique identifier of the department.

- `name`: The name of the department.

- `surface`: The surface area of the department in square kilometers.

- `population`: The population of the department.

## Details

This function sends a GET request to the API, processes the JSON
response, and converts it into a structured data frame. The data is
filtered and formatted to include only relevant columns (`id`, `name`,
`surface`, `population`), and it is ordered by the `name` column in
alphabetical order (A to Z).

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
# Retrieve the list of departments
departments <- get_departments_list()

# Print the data frame
print(departments)

# View the data in a spreadsheet-like interface
View(departments)

# Select departments with a specific population range
large_departments <- departments %>%
  filter(population > 1000000)
print(large_departments)
} # }
```
