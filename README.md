# State registry analysis
This analysis supports the investigation, [The Blacklist](https://www.buzzfeednews.com/article/scottpham/child-abuse-and-neglect-registries-punish-parents-of-color) published on April 27, 2022. It contains notebooks analyzing datasets requested from state child protective services agencies and related administrative hearings agencies. This repository calculates descriptive statistics about the racial makeup of people on state-run child abuse and neglect registries along with population-based risk ratios for those included. Other notebooks analyze appeals data to show how often parents appeal their inclusion on the list, how often they win, and whether they had legal representation.

BuzzFeed News requested and obtained datasets on registries from these six states.

- Arizona
- California
- Michigan
- New Jersey
- Pennsylvania
- Texas

Separately, appeals datasets were obtained from these states:

- Arizona
- Michigan
- New Jersey
- Pennsylvania

## A note on Substantiations

Substantiation is the legal term child protective services uses to denote a finding of statutory child abuse or neglect. States are heterogeneous in the way they populate and manage their registries, but most simply add all people with child abuse and neglect substantiations to the registry. 

California and Michigan were able to provide data specifically on individuals on registries, so it was not necessary to filter based on allegation or disposition. In Arizona, New Jersey, Texas and Pennsylvania, substantiations are used as a strong proxy for registry inclusions. The actual number of people on the registry may be somewhat larger or smaller depending on how the state counts the number of substantiations.

The Michigan data contained personally identifying information and so the raw data could not be released. A PDF of the code for analyzing the Michigan data is in `notebooks/substantiations`.

## A note on Appeals

Almost all states offer some kind of appeal process for people who dispute the agency's account. Typically an appeal starts with a written request to the child protective services agency and may be resolved based on this request alone. After this step, the agency may forward the request to a hearing officer, typically an administrative law judge.

New Jersey provided information on appeals that were resolved before being sent to an administrative law judge for a hearing, as well as the results of those hearings when they occured. Arizona and Pennsylvania provided only data on requests forwarded to their respective administrative hearing departments. Michigan could provide only limited data on hearings which did not include the hearing outcomes. They also provided limited statistics on written requests filed between 2019 and 2021.

## Risk Ratios

The notebooks in the `substantiations` folder calculate "risk ratios" or ["odds ratios"](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2938757/), which compare one population's risk of a certain outcome compared to another population's risk. The universe used for this analysis is the state population according to the census population data (American Community Survey 5-Year estimates) for that year and place. The populations being compared are the populations of Black, White and Hispanic people in the state population versus the populations of Black, White and Hispanic people on a child abuse registry.

The year 2019 is used as a baseline for most of the reported figures in the story to avoid COVID-19-related disruptions in government agencies that could distort the results. All risk ratios in the story are compared to outcomes for white populations. 

|              | 2019 Risk Ratio, Black vs. White |
|--------------|-----------------------------|
| Arizona      | 5.6                         |
| California   | 3.0                         |
| Michigan     | 1.9                         |
| New Jersey   | 4.1                         |
| Texas        | 1.9                         |
| Pennsylvania | NA                          |


## Census

Two census tables are used heavily in these analyses. One is table `S0901` from the [5-year American Community Survey](https://www.census.gov/data/developers/data-sets/acs-5year.html) (ACS). This table provides racial characteristics of children.

The other table used is `B03002` from the 5-year ACS. It provides racial characteristics of both adults and children.

New Jersey could provide only substantiation data counted by child, so for these analyses `S0901` is used for comparison. The rest of the datasets are counts of adult "perpetrators" or individuals on registries, and so `B03002` is used.

## NCANDS Methodology

The story includes a national count of people on child abuse and neglect registries. That count uses a federal dataset called the National Child Abuse and Neglect Data System. The methodology for that count is described in `NCANDS.pdf`.


## Folder structure

The `data/national` directory contains census population files and `table-5-1.csv`, a table scraped from the [Children's Bureau Annual Maltreatment Reports](https://www.acf.hhs.gov/cb/data-research/child-maltreatment) that contains yearly substantiation and perpetrator figures by state. The `data/states` directory contains copies of the data provided to BuzzFeed News by state agencies.

The `notebooks/substantions` directory contains state-by-state registry or substantiation analysis. The `notebooks/appeals` directory contains state-by-state analysis of appeals data. In both directories, the notebooks only exist for those states for which we received the appropriate data to conduct the analysis.

The `outputs` directory contains intermediary files, usually just a short table of substantiations per year for use when comparing appeals figures to substantiations from that year.

`notebooks/state_pop_calculation.ipynb` simply sums the 2020 population counts for our six target states.


## To reproduce

Install the required packages and then run `make reproduce` to run the notebooks in order, or simply run the substantiations notebooks before the appeals notebooks.

## Technical Notes

All of the analyses above are coded in Python 3, using the libraries listed in `requirements.txt`.

## Licensing

All code in this repository is available under the MIT License. All data files are available under the Creative Commons Attribution 4.0 International (CC BY 4.0) license.

## Questions / Feedback

Contact Scott Pham at scott.pham@buzzfeed.com.

Looking for more from BuzzFeed News? [Click here for a list of our open-sourced projects, data, and code.](https://github.com/BuzzFeedNews/everything)
