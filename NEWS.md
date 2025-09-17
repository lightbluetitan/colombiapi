# ColombiAPI 0.2.0

## Breaking Changes

- `view_datasets()` was renamed to `view_datasets_ColombiAPI()` to avoid naming conflicts with other packages and improve function identification.

- `get_airports_list()` was renamed to  `get_colombia_airports()` to avoid naming conflicts with other packages and improve function identification.

- `get_Colombia_info()` was renamed to `get_country_info_co()` to avoid naming conflicts with other packages and improve function identification.

- `get_country_info_co()` Not only was the function name changed, but its data source also shifted from `API-Colombia` to the `REST Countries` API.

- `get_departments_list()` was renamed to  `get_colombia_departments()` to avoid naming conflicts with other packages and improve function identification.

- `get_presidents_list()` was renamed to `get_colombia_presidents()` to avoid naming conflicts with other packages and improve function identification.

- `get_regions_list()` was renamed to `get_colombia_regions()` to avoid naming conflicts with other packages and improve function identification.


The following APIs were added to the `ColombiAPI` package:

- **Nager.Date** <https://date.nager.at/Api>.

- **World Bank API** <https://datahelpdesk.worldbank.org/knowledgebase/articles/889392>

- **REST Countries API** <https://restcountries.com/>


The following functions were added to the `ColombiAPI` package powered by API-Colombia:

- `get_colombia_cities()` 

- `get_colombia_attractions()` 

- `get_colombia_natural_areas()` 

- `get_colombia_invasive_species()` 

- `get_colombia_native_communities()` 

- `get_colombia_radios()` 

- `get_colombia_typical_dishes()` 


The following function was added to the `ColombiAPI` package powered by `Nager.Date`:

- `get_colombia_holidays()`


The following functions were added to the `ColombiAPI` package powered by `World Bank API`:

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

- Fix `get_airports_list()` latitud and longitud error, now that function is named `get_colombia_airports()`

---

# ColombiAPI 0.1.0

## Initial Release

- First release of `ColombiAPI` package.
- Added `view_datasets()` function to explore available datasets.
- Collection of datasets that cover diverse aspects of Colombian society.
- Initial API *API Colombia* – Added functions powered by **API-Colombia**
