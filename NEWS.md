# ColombiAPI 0.3.0

## Breaking Changes

This release significantly expands the scope of `ColombiAPI` with **12 new curated datasets**.  

These additions cover diverse domains such as **indigenous languages, education, biodiversity, digital transformation, mobility, tourism, connectivity, and economic projections**.  

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
