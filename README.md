
## Project Title: Analysis of Paintings Data

### Project Description:
This project involves the analysis of a dataset on famous paintings, which was sourced from Kaggle.
The dataset includes information about artists, canvas sizes, image links, museums, museum hours, product sizes, subjects, and works.

### Data Loading:
The data was loaded into a MySQL database using a Python script. 
The script uses the `pandas` library to read the CSV files and the `sqlalchemy` library to connect to the MySQL database and load the data.

### Data Analysis:
The analysis was performed using SQL queries to answer the following questions:

1. **Identify the museums which are open on both Sunday and Monday.**
   This was achieved by joining the `museum` and `museum_hours` tables and filtering for museums that are open on both days.

2. **Which museum is open for the longest during a day?**
  This was determined by calculating the time difference between the opening and closing times for each museum and ranking them in descending order.
  The museum with the highest rank (i.e., the longest opening hours) was selected.

3. **Display the country and the city with the most number of museums.**
   This was done by grouping the `museum` table by country and city, counting the number of museums in each group, and ranking them in descending order.
   The country and city with the highest rank (i.e., the most museums) were selected.

### Tools Used:
- Python
- pandas
- sqlalchemy
- MySQL

### Data Source:
- [Kaggle: Famous Paintings](https://www.kaggle.com/datasets/mexwell/famous-paintings/data)
