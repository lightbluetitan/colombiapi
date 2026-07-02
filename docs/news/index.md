# Changelog

## ColombiAPI 0.4.0

### Breaking Changes

- **Removed `get_country_info_co()`** from the package. This function
  depended on the ‘REST Countries’ API v3.1 endpoint, which was
  deprecated by its provider. The replacement v5 endpoint now requires
  an API key, which is incompatible with CRAN’s policy that packages
  using Internet resources must work without user-supplied credentials.
  As a consequence, all associated tests, documentation, and references
  to the ‘REST Countries API’ have been removed from the package
  (`DESCRIPTION`, `README.md`, vignette, `LICENSE.md`).

- The package now integrates **three** APIs instead of four:
  **API-Colombia**, **World Bank API**, and **Nager.Date API**.

### Notes

- Updated copyright year to 2025-2026 across license files.

------------------------------------------------------------------------

## ColombiAPI 0.3.2

CRAN release: 2026-05-06

### CRAN Policy Compliance — Graceful Failure for Internet Resources

This release fixes all functions that use internet resources to comply
with the CRAN policy: *“Packages which use Internet resources should
fail gracefully with an informative message if the resource is not
available or has changed.”*

#### Functions fixed — API Colombia

- [`get_colombia_airports()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_airports.md):
  Added [`tryCatch()`](https://rdrr.io/r/base/conditions.html),
  `httr::timeout(10)`, [`is.null()`](https://rdrr.io/r/base/NULL.html)
  guard,
  [`httr::status_code()`](https://httr.r-lib.org/reference/status_code.html),
  and [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html) and
  [`jsonlite::fromJSON()`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html).
  Corrected [`is.null()`](https://rdrr.io/r/base/NULL.html) check order
  before [`length()`](https://rdrr.io/r/base/length.html).

- [`get_colombia_attractions()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_attractions.md):
  Added `httr::timeout(10)` and
  [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html).
  Renamed internal variable `response` to `res` for consistency.

- [`get_colombia_cities()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_cities.md):
  Added `httr::timeout(10)` and
  [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html).
  Renamed internal variable `response` to `res` for consistency.

- [`get_colombia_departments()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_departments.md):
  Added [`tryCatch()`](https://rdrr.io/r/base/conditions.html),
  `httr::timeout(10)`, [`is.null()`](https://rdrr.io/r/base/NULL.html)
  guard,
  [`httr::status_code()`](https://httr.r-lib.org/reference/status_code.html),
  and [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html) and
  [`jsonlite::fromJSON()`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html).
  Corrected [`is.null()`](https://rdrr.io/r/base/NULL.html) check order
  before [`length()`](https://rdrr.io/r/base/length.html).

- [`get_colombia_invasive_species()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_invasive_species.md):
  Added `httr::timeout(10)` and
  [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html).
  Renamed internal variable `response` to `res` for consistency.

- [`get_colombia_native_communities()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_native_communities.md):
  Added `httr::timeout(10)` and
  [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html).
  Renamed internal variable `response` to `res` for consistency.

- [`get_colombia_natural_areas()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_natural_areas.md):
  Added `httr::timeout(10)` and
  [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html).
  Renamed internal variable `response` to `res` for consistency.

- [`get_colombia_presidents()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_presidents.md):
  Added [`tryCatch()`](https://rdrr.io/r/base/conditions.html),
  `httr::timeout(10)`, [`is.null()`](https://rdrr.io/r/base/NULL.html)
  guard,
  [`httr::status_code()`](https://httr.r-lib.org/reference/status_code.html),
  and [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html) and
  [`jsonlite::fromJSON()`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html).
  Corrected [`is.null()`](https://rdrr.io/r/base/NULL.html) check order
  before [`length()`](https://rdrr.io/r/base/length.html).

- [`get_colombia_radios()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_radios.md):
  Added `httr::timeout(10)` and
  [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html).
  Renamed internal variable `response` to `res` for consistency.

- [`get_colombia_regions()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_regions.md):
  Added [`tryCatch()`](https://rdrr.io/r/base/conditions.html),
  `httr::timeout(10)`, [`is.null()`](https://rdrr.io/r/base/NULL.html)
  guard,
  [`httr::status_code()`](https://httr.r-lib.org/reference/status_code.html),
  and [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html) and
  [`jsonlite::fromJSON()`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html).
  Corrected [`is.null()`](https://rdrr.io/r/base/NULL.html) check order
  before [`length()`](https://rdrr.io/r/base/length.html).

- [`get_colombia_typical_dishes()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_typical_dishes.md):
  Added `httr::timeout(10)` and
  [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html).
  Renamed internal variable `response` to `res` for consistency.

#### Functions fixed — World Bank API

- [`get_colombia_child_mortality()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_child_mortality.md):
  Added [`tryCatch()`](https://rdrr.io/r/base/conditions.html),
  `httr::timeout(10)`, [`is.null()`](https://rdrr.io/r/base/NULL.html)
  guard,
  [`httr::status_code()`](https://httr.r-lib.org/reference/status_code.html),
  and [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html) and
  [`jsonlite::fromJSON()`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html).
  Corrected [`is.null()`](https://rdrr.io/r/base/NULL.html) check order
  before [`length()`](https://rdrr.io/r/base/length.html). Removed
  unnecessary `return(df)`.

- [`get_colombia_cpi()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_cpi.md):
  Added [`tryCatch()`](https://rdrr.io/r/base/conditions.html),
  `httr::timeout(10)`, [`is.null()`](https://rdrr.io/r/base/NULL.html)
  guard,
  [`httr::status_code()`](https://httr.r-lib.org/reference/status_code.html),
  and [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html) and
  [`jsonlite::fromJSON()`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html).
  Corrected [`is.null()`](https://rdrr.io/r/base/NULL.html) check order
  before [`length()`](https://rdrr.io/r/base/length.html). Removed
  unnecessary `return(df)`.

- [`get_colombia_energy_use()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_energy_use.md):
  Added [`tryCatch()`](https://rdrr.io/r/base/conditions.html),
  `httr::timeout(10)`, [`is.null()`](https://rdrr.io/r/base/NULL.html)
  guard,
  [`httr::status_code()`](https://httr.r-lib.org/reference/status_code.html),
  and [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html) and
  [`jsonlite::fromJSON()`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html).
  Corrected [`is.null()`](https://rdrr.io/r/base/NULL.html) check order
  before [`length()`](https://rdrr.io/r/base/length.html). Removed
  unnecessary `return(df)`.

- [`get_colombia_gdp()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_gdp.md):
  Added `timeout` and `status_code` to `@importFrom httr` directive. All
  other graceful failure handling was already correctly implemented.

- [`get_colombia_hospital_beds()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_hospital_beds.md):
  Added [`tryCatch()`](https://rdrr.io/r/base/conditions.html),
  `httr::timeout(10)`, [`is.null()`](https://rdrr.io/r/base/NULL.html)
  guard,
  [`httr::status_code()`](https://httr.r-lib.org/reference/status_code.html),
  and [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html) and
  [`jsonlite::fromJSON()`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html).
  Corrected [`is.null()`](https://rdrr.io/r/base/NULL.html) check order
  before [`length()`](https://rdrr.io/r/base/length.html). Removed
  unnecessary `return(df)`.

- [`get_colombia_life_expectancy()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_life_expectancy.md):
  Removed incorrect `empty_df` fallback pattern and `User-Agent` header.
  Standardized to return `NULL` with an informative message on failure.
  Removed `if (interactive())` guards on
  [`message()`](https://rdrr.io/r/base/message.html) calls. Added
  [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html) as
  a separate guard. Replaced `\donttest{}` with `if (interactive())` in
  examples.

- [`get_colombia_literacy_rate()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_literacy_rate.md):
  Added [`tryCatch()`](https://rdrr.io/r/base/conditions.html),
  `httr::timeout(10)`, [`is.null()`](https://rdrr.io/r/base/NULL.html)
  guard,
  [`httr::status_code()`](https://httr.r-lib.org/reference/status_code.html),
  and [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html) and
  [`jsonlite::fromJSON()`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html).
  Corrected [`is.null()`](https://rdrr.io/r/base/NULL.html) check order
  before [`length()`](https://rdrr.io/r/base/length.html). Replaced
  `\donttest{}` with `if (interactive())` in examples. Removed
  unnecessary `return(df)`.

- [`get_colombia_population()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_population.md):
  Added [`tryCatch()`](https://rdrr.io/r/base/conditions.html),
  `httr::timeout(10)`, [`is.null()`](https://rdrr.io/r/base/NULL.html)
  guard,
  [`httr::status_code()`](https://httr.r-lib.org/reference/status_code.html),
  and [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html) and
  [`jsonlite::fromJSON()`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html).
  Corrected [`is.null()`](https://rdrr.io/r/base/NULL.html) check order
  before [`length()`](https://rdrr.io/r/base/length.html). Removed
  unnecessary `return(df)`.

- [`get_colombia_unemployment()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_unemployment.md):
  Added [`tryCatch()`](https://rdrr.io/r/base/conditions.html),
  `httr::timeout(10)`, [`is.null()`](https://rdrr.io/r/base/NULL.html)
  guard,
  [`httr::status_code()`](https://httr.r-lib.org/reference/status_code.html),
  and [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html) and
  [`jsonlite::fromJSON()`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html).
  Corrected [`is.null()`](https://rdrr.io/r/base/NULL.html) check order
  before [`length()`](https://rdrr.io/r/base/length.html). Removed
  unnecessary `return(df)`.

#### Functions fixed — Nager.Date API

- [`get_colombia_holidays()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_holidays.md):
  Added `@details`, `@note`, and `@seealso` roxygen tags for consistency
  with the rest of the package. Removed internal comments for cleaner
  code. All graceful failure handling was already correctly implemented.

#### Functions fixed — REST Countries API

- `get_country_info_co()`: Added `httr::timeout(10)`,
  [`tryCatch()`](https://rdrr.io/r/base/conditions.html) on
  [`httr::content()`](https://httr.r-lib.org/reference/content.html),
  `nchar(txt) == 0` validation for empty responses, and defensive field
  extraction with `NA_character_` / `NA_real_` fallbacks for all fields.
  Removed Spanish-language error messages for consistency. Renamed
  internal variable `response` to `res`. Replaced `\donttest{}` with
  `if (interactive())` in examples. Expanded `@return`, `@description`,
  `@details`, and `@note` roxygen tags for consistency.

#### Additional improvements across all fixed functions

- Replaced `res$status_code` with `httr::status_code(res)` (correct httr
  idiom).
- Corrected [`is.null()`](https://rdrr.io/r/base/NULL.html) check order
  — always evaluated before
  [`length()`](https://rdrr.io/r/base/length.html) to prevent errors
  when object is NULL.
- Replaced `\donttest{}` with `if (interactive())` in all examples for
  consistency.
- Removed unnecessary `return(df)` at end of functions (idiomatic R
  style).
- Updated `@importFrom httr` directives to include `timeout` and
  `status_code` where missing.
- Updated copyright year from 2025 to 2025-2026.

------------------------------------------------------------------------

## ColombiAPI 0.3.1

CRAN release: 2025-10-12

### Bug Fixes

#### Test Corrections for CRAN Compliance

- **Fixed
  [`get_colombia_literacy_rate()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_literacy_rate.md)
  tests**: Corrected data type expectations for the `value` column from
  `integer` to `numeric`. The World Bank API returns literacy rates as
  decimal percentages (e.g., 95.68%), which are naturally of type
  `numeric`/`double`, not `integer`.

- **Fixed
  [`get_colombia_life_expectancy()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_life_expectancy.md)
  tests**:

  - Added `skip_on_cran()` to all tests to properly handle offline
    environments during CRAN checks
  - Improved error handling by adding `User-Agent` headers to HTTP
    requests
  - Added explicit `NULL` checks before structure validation to prevent
    test failures
  - Enhanced robustness of API error handling with better
    [`tryCatch()`](https://rdrr.io/r/base/conditions.html)
    implementation

------------------------------------------------------------------------

## ColombiAPI 0.3.0

CRAN release: 2025-09-29

### Breaking Changes

This release significantly expands the scope of `ColombiAPI` with **12
new curated datasets**.

These additions cover diverse domains such as **indigenous languages,
education, biodiversity, digital transformation, mobility, tourism,
connectivity, and economic projections**.

#### Newly Added Datasets

- `indigenous_vocabulary_df`: Comparative Vocabulary for Colombia’s
  Indigenous Languages
- `admitted_students_df`: Admitted Students to the Science Faculty, UNAL
  (2013-I)
- `school_levels_df`: Departments by Levels of Schools in Colombia
- `dead_lianas_df`: Mortality of lianas (vines) in tropical forests
- `municipalities_tbl_df`: Municipalities of Colombia
- `Bucaramanga_wifi_tbl_df`: WiFi Connectivity Zones in Bucaramanga
- `Cartagena_wifi_tbl_df`: Connected Devices in WiFi Zones of Cartagena
- `digital_graduates_tbl_df`: “Advancing in Digital” Program Graduates
- `vehicle_count_tbl_df`: Vehicle Count: Cars and Motorcycles
- `foreign_visitors_tbl_df`: Non-Resident Foreign Visitors to Colombia
- `digital_centers_tbl_df`: Digital Centers in Sucre
- `gdp_departments_tbl_df`: Departmental GDP Projection

------------------------------------------------------------------------

## ColombiAPI 0.2.0

CRAN release: 2025-09-17

### Breaking Changes

- `view_datasets()` was renamed to
  [`view_datasets_ColombiAPI()`](https://lightbluetitan.github.io/colombiapi/reference/view_datasets_ColombiAPI.md)
  to avoid naming conflicts with other packages and improve function
  identification.

- `get_airports_list()` was renamed to
  [`get_colombia_airports()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_airports.md)
  to avoid naming conflicts with other packages and improve function
  identification.

- `get_Colombia_info()` was renamed to `get_country_info_co()` to avoid
  naming conflicts with other packages and improve function
  identification.

- `get_country_info_co()` Not only was the function name changed, but
  its data source also shifted from `API-Colombia` to the
  `REST Countries` API.

- `get_departments_list()` was renamed to
  [`get_colombia_departments()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_departments.md)
  to avoid naming conflicts with other packages and improve function
  identification.

- `get_presidents_list()` was renamed to
  [`get_colombia_presidents()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_presidents.md)
  to avoid naming conflicts with other packages and improve function
  identification.

- `get_regions_list()` was renamed to
  [`get_colombia_regions()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_regions.md)
  to avoid naming conflicts with other packages and improve function
  identification.

#### New APIs added

- **Nager.Date** <https://date.nager.at/Api>
- **World Bank API**
  <https://datahelpdesk.worldbank.org/knowledgebase/articles/889392>
- **REST Countries API** <https://restcountries.com/>

#### New functions — API Colombia

- [`get_colombia_cities()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_cities.md)
- [`get_colombia_attractions()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_attractions.md)
- [`get_colombia_natural_areas()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_natural_areas.md)
- [`get_colombia_invasive_species()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_invasive_species.md)
- [`get_colombia_native_communities()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_native_communities.md)
- [`get_colombia_radios()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_radios.md)
- [`get_colombia_typical_dishes()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_typical_dishes.md)

#### New function — Nager.Date

- [`get_colombia_holidays()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_holidays.md)

#### New functions — World Bank API

- [`get_colombia_child_mortality()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_child_mortality.md)
- [`get_colombia_cpi()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_cpi.md)
- [`get_colombia_energy_use()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_energy_use.md)
- [`get_colombia_gdp()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_gdp.md)
- [`get_colombia_hospital_beds()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_hospital_beds.md)
- [`get_colombia_life_expectancy()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_life_expectancy.md)
- [`get_colombia_literacy_rate()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_literacy_rate.md)
- [`get_colombia_population()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_population.md)
- [`get_colombia_unemployment()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_unemployment.md)

------------------------------------------------------------------------

## ColombiAPI 0.1.1

CRAN release: 2025-02-16

### Fixed function

- Fix `get_airports_list()` latitud and longitud error, now that
  function is named
  [`get_colombia_airports()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_airports.md)

------------------------------------------------------------------------

## ColombiAPI 0.1.0

CRAN release: 2025-01-09

### Initial Release

- First release of `ColombiAPI` package.
- Added `view_datasets()` function to explore available datasets.
- Collection of datasets that cover diverse aspects of Colombian
  society.
- Initial API *API Colombia* – Added functions powered by
  **API-Colombia**
