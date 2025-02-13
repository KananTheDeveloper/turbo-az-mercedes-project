# Turbo.az Mercedes Data Analysis Project

This project involves scraping data for Mercedes cars from the Turbo.az website, analyzing the data using Python and Oracle SQL, and visualizing it with Qlik Sense. Below is a detailed breakdown of the project structure, tools used, and the analysis process.

## Project Structure

```
/turbo-az-mercedes-project
│
├── /data
│   ├── scraped_mercedes_data.csv        # Raw scraped data
│   ├── cleaned_mercedes_data.csv        # Cleaned data
│
├── /notebooks
│   ├── scraping_mercedes_data.ipynb     # Data scraping process
│   ├── analyzing_mercedes_data.ipynb    # Python-based analysis
│
├── /sql
│   └── analyzing.sql                    # SQL analysis script
│
├── /visualizations
│   └── Turbo.az - Project.qvf           # Qlik Sense visualization file
│
└── README.md                            # Project documentation
```

## Tools and Technologies Used
- **Python**: Used for web scraping, data cleaning, and analysis.
- **Oracle SQL**: For analyzing the scraped and cleaned data.
- **Qlik Sense**: For creating visualizations and insights from the data.

## Project Steps

1. **Data Collection**:
   - The data for Mercedes cars was scraped from Turbo.az using the `scraping_mercedes_data.ipynb` file.
   - The scraped data is stored in `scraped_mercedes_data.csv`.

2. **Data Cleaning**:
   - Data was cleaned and stored in `cleaned_mercedes_data.csv`.
   - Cleaning steps included removing duplicates, handling missing values, and ensuring data consistency.

3. **Data Analysis**:
   - Python was used for initial analysis (`analyzing_mercedes_data.ipynb`).
   - SQL analysis scripts are available in the `analyzing.sql` file for deeper insights.

4. **Data Visualization**:
   - Qlik Sense was used to create visual reports and dashboards (`Turbo.az - Project.qvf`).


Feel free to contribute to the project by submitting issues or pull requests!
