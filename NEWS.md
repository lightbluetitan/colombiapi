# ColombiAPI 0.4.0

## Breaking Changes

- **Removed `get_country_info_co()`** from the package. This function depended on the
  'REST Countries' API v3.1 endpoint, which was deprecated by its provider. The
  replacement v5 endpoint now requires an API key, which is incompatible with CRAN's
  policy that packages using Internet resources must work without user-supplied
  credentials. As a consequence, all associated tests, documentation, and references
  to the 'REST Countries API' have been removed from the package (`DESCRIPTION`,
  `README.md`, vignette, `LICENSE.md`).

- The package now integrates **three** APIs instead of four: **API-Colombia**,
  **World Bank API**, and **Nager.Date API**.

## Notes

- Updated copyright year to 2025-2026 across license files.

---

# ColombiAPI 0.3.2

## CRAN Policy Compliance — Graceful Failure for Internet Resources

This release fixes all functions that use internet resources to comply with the CRAN policy:
*"Packages which use Internet resources should fail gracefully with an informative message
if the resource is not available or has changed."*

### Functions fixed — API Colombia

- `get_colombia_airports()`: Added `tryCatch()`, `httr::timeout(10)`, `is.null()` guard,
  `httr::status_code()`, and `tryCatch()` on `httr::content()` and `jsonlite::fromJSON()`.
  Corrected `is.null()` check order before `length()`.

- `get_colombia_attractions()`: Added `httr::timeout(10)` and `tryCatch()` on
  `httr::content()`. Renamed internal variable `response` to `res` for consistency.

- `get_colombia_cities()`: Added `httr::timeout(10)` and `tryCatch()` on
  `httr::content()`. Renamed internal variable `response` to `res` for consistency.

- `get_colombia_departments()`: Added `tryCatch()`, `httr::timeout(10)`, `is.null()` guard,
  `httr::status_code()`, and `tryCatch()` on `httr::content()` and `jsonlite::fromJSON()`.
  Corrected `is.null()` check order before `length()`.

- `get_colombia_invasive_species()`: Added `httr::timeout(10)` and `tryCatch()` on
  `httr::content()`. Renamed internal variable `response` to `res` for consistency.

- `get_colombia_native_communities()`: Added `httr::timeout(10)` and `tryCatch()` on
  `httr::content()`. Renamed internal variable `response` to `res` for consistency.

- `get_colombia_natural_areas()`: Added `httr::timeout(10)` and `tryCatch()` on
  `httr::content()`. Renamed internal variable `response` to `res` for consistency.

- `get_colombia_presidents()`: Added `tryCatch()`, `httr::timeout(10)`, `is.null()` guard,
  `httr::status_code()`, and `tryCatch()` on `httr::content()` and `jsonlite::fromJSON()`.
  Corrected `is.null()` check order before `length()`.

- `get_colombia_radios()`: Added `httr::timeout(10)` and `tryCatch()` on
  `httr::content()`. Renamed internal variable `response` to `res` for consistency.

- `get_colombia_regions()`: Added `tryCatch()`, `httr::timeout(10)`, `is.null()` guard,
  `httr::status_code()`, and `tryCatch()` on `httr::content()` and `jsonlite::fromJSON()`.
  Corrected `is.null()` check order before `length()`.

- `get_colombia_typical_dishes()`: Added `httr::timeout(10)` and `tryCatch()` on
  `httr::content()`. Renamed internal variable `response` to `res` for consistency.

### Functions fixed — World Bank API

- `get_colombia_child_mortality()`: Added `tryCatch()`, `httr::timeout(10)`, `is.null()`
  guard, `httr::status_code()`, and `tryCatch()` on `httr::content()` and
  `jsonlite::fromJSON()`. Corrected `is.null()` check order before `length()`.
  Removed unnecessary `return(df)`.

- `get_colombia_cpi()`: Added `tryCatch()`, `httr::timeout(10)`, `is.null()` guard,
  `httr::status_code()`, and `tryCatch()` on `httr::content()` and `jsonlite::fromJSON()`.
  Corrected `is.null()` check order before `length()`. Removed unnecessary `return(df)`.

- `get_colombia_energy_use()`: Added `tryCatch()`, `httr::timeout(10)`, `is.null()` guard,
  `httr::status_code()`, and `tryCatch()` on `httr::content()` and `jsonlite::fromJSON()`.
  Corrected `is.null()` check order before `length()`. Removed unnecessary `return(df)`.

- `get_colombia_gdp()`: Added `timeout` and `status_code` to `@importFrom httr` directive.
  All other graceful failure handling was already correctly implemented.

- `get_colombia_hospital_beds()`: Added `tryCatch()`, `httr::timeout(10)`, `is.null()`
  guard, `httr::status_code()`, and `tryCatch()` on `httr::content()` and
  `jsonlite::fromJSON()`. Corrected `is.null()` check order before `length()`.
  Removed unnecessary `return(df)`.

- `get_colombia_life_expectancy()`: Removed incorrect `empty_df` fallback pattern and
  `User-Agent` header. Standardized to return `NULL` with an informative message on failure.
  Removed `if (interactive())` guards on `message()` calls. Added `tryCatch()` on
  `httr::content()` as a separate guard. Replaced `\donttest{}` with `if (interactive())`
  in examples.

- `get_colombia_literacy_rate()`: Added `tryCatch()`, `httr::timeout(10)`, `is.null()`
  guard, `httr::status_code()`, and `tryCatch()` on `httr::content()` and
  `jsonlite::fromJSON()`. Corrected `is.null()` check order before `length()`.
  Replaced `\donttest{}` with `if (interactive())` in examples.
  Removed unnecessary `return(df)`.

- `get_colombia_population()`: Added `tryCatch()`, `httr::timeout(10)`, `is.null()` guard,
  `httr::status_code()`, and `tryCatch()` on `httr::content()` and `jsonlite::fromJSON()`.
  Corrected `is.null()` check order before `length()`. Removed unnecessary `return(df)`.

- `get_colombia_unemployment()`: Added `tryCatch()`, `httr::timeout(10)`, `is.null()`
  guard, `httr::status_code()`, and `tryCatch()` on `httr::content()` and
  `jsonlite::fromJSON()`. Corrected `is.null()` check order before `length()`.
  Removed unnecessary `return(df)`.

### Functions fixed — Nager.Date API

- `get_colombia_holidays()`: Added `@details`, `@note`, and `@seealso` roxygen tags for
  consistency with the rest of the package. Removed internal comments for cleaner code.
  All graceful failure handling was already correctly implemented.

### Functions fixed — REST Countries API

- `get_country_info_co()`: Added `httr::timeout(10)`, `tryCatch()` on `httr::content()`,
  `nchar(txt) == 0` validation for empty responses, and defensive field extraction with
  `NA_character_` / `NA_real_` fallbacks for all fields. Removed Spanish-language error
  messages for consistency. Renamed internal variable `response` to `res`.
  Replaced `\donttest{}` with `if (interactive())` in examples. Expanded `@return`,
  `@description`, `@details`, and `@note` roxygen tags for consistency.

### Additional improvements across all fixed functions

- Replaced `res$status_code` with `httr::status_code(res)` (correct httr idiom).
- Corrected `is.null()` check order — always evaluated before `length()` to prevent
  errors when object is NULL.
- Replaced `\donttest{}` with `if (interactive())` in all examples for consistency.
- Removed unnecessary `return(df)` at end of functions (idiomatic R style).
- Updated `@importFrom httr` directives to include `timeout` and `status_code`
  where missing.
- Updated copyright year from 2025 to 2025-2026.

---

# ColombiAPI 0.3.1

## Bug Fixes

### Test Corrections for CRAN Compliance

- **Fixed `get_colombia_literacy_rate()` tests**: Corrected data type expectations for
  the `value` column from `integer` to `numeric`. The World Bank API returns literacy
  rates as decimal percentages (e.g., 95.68%), which are naturally of type
  `numeric`/`double`, not `integer`.

- **Fixed `get_colombia_life_expectancy()` tests**:
  - Added `skip_on_cran()` to all tests to properly handle offline environments
    during CRAN checks
  - Improved error handling by adding `User-Agent` headers to HTTP requests
  - Added explicit `NULL` checks before structure validation to prevent test failures
  - Enhanced robustness of API error handling with better `tryCatch()` implementation

---

# ColombiAPI 0.3.0

## Breaking Changes

This release significantly expands the scope of `ColombiAPI` with **12 new curated datasets**.

These additions cover diverse domains such as **indigenous languages, education, biodiversity,
digital transformation, mobility, tourism, connectivity, and economic projections**.

### Newly Added Datasets

- `indigenous_vocabulary_df`: Comparative Vocabulary for Colombia's Indigenous Languages
- `admitted_students_df`: Admitted Students to the Science Faculty, UNAL (2013-I)
- `school_levels_df`: Departments by Levels of Schools in Colombia
- `dead_lianas_df`: Mortality of lianas (vines) in tropical forests
- `municipalities_tbl_df`: Municipalities of Colombia
- `Bucaramanga_wifi_tbl_df`: WiFi Connectivity Zones in Bucaramanga
- `Cartagena_wifi_tbl_df`: Connected Devices in WiFi Zones of Cartagena
- `digital_graduates_tbl_df`: "Advancing in Digital" Program Graduates
- `vehicle_count_tbl_df`: Vehicle Count: Cars and Motorcycles
- `foreign_visitors_tbl_df`: Non-Resident Foreign Visitors to Colombia
- `digital_centers_tbl_df`: Digital Centers in Sucre
- `gdp_departments_tbl_df`: Departmental GDP Projection

---

# ColombiAPI 0.2.0

## Breaking Changes

- `view_datasets()` was renamed to `view_datasets_ColombiAPI()` to avoid naming conflicts
  with other packages and improve function identification.

- `get_airports_list()` was renamed to `get_colombia_airports()` to avoid naming conflicts
  with other packages and improve function identification.

- `get_Colombia_info()` was renamed to `get_country_info_co()` to avoid naming conflicts
  with other packages and improve function identification.

- `get_country_info_co()` Not only was the function name changed, but its data source also
  shifted from `API-Colombia` to the `REST Countries` API.

- `get_departments_list()` was renamed to `get_colombia_departments()` to avoid naming
  conflicts with other packages and improve function identification.

- `get_presidents_list()` was renamed to `get_colombia_presidents()` to avoid naming
  conflicts with other packages and improve function identification.

- `get_regions_list()` was renamed to `get_colombia_regions()` to avoid naming conflicts
  with other packages and improve function identification.

### New APIs added

- **Nager.Date** <https://date.nager.at/Api>
- **World Bank API** <https://datahelpdesk.worldbank.org/knowledgebase/articles/889392>
- **REST Countries API** <https://restcountries.com/>

### New functions — API Colombia

- `get_colombia_cities()`
- `get_colombia_attractions()`
- `get_colombia_natural_areas()`
- `get_colombia_invasive_species()`
- `get_colombia_native_communities()`
- `get_colombia_radios()`
- `get_colombia_typical_dishes()`

### New function — Nager.Date

- `get_colombia_holidays()`

### New functions — World Bank API

- `get_colombia_child_mortality()`
- `get_colombia_cpi()`
- `get_colombia_energy_use()`
- `get_colombia_gdp()`
- `get_colombia_hospital_beds()`
- `get_colombia_life_expectancy()`
- `get_colombia_literacy_rate()`
- `get_colombia_population()`
- `get_colombia_unemployment()`

---

# ColombiAPI 0.1.1

## Fixed function

- Fix `get_airports_list()` latitud and longitud error, now that function is named
  `get_colombia_airports()`

---

# ColombiAPI 0.1.0

## Initial Release

- First release of `ColombiAPI` package.
- Added `view_datasets()` function to explore available datasets.
- Collection of datasets that cover diverse aspects of Colombian society.
- Initial API *API Colombia* – Added functions powered by **API-Colombia**
