#!/usr/bin/env python
# coding: utf-8

# #### In this exercise, you will work with a dataset called "employee info" that contains information about employees in a company. The dataset includes columns such as Name, Department, Age, Gender, Salary, and Experience.
# 
# #### Follow These Steps
# 
# - 
# Create a dataframe called "employee_df" with the following data:- 
# 
# import pandas as p- d
# 
# data = {'Name': ['John', 'Mary', 'Bob', 'Sarah', 'Tom', 'Lisa'], 'Department': ['IT', 'Marketing', 'Sales', 'IT', 'Finance', 'Marketing'], 'Age': [30, 40, 25, 35, 45, 28], 'Gender': ['Male', 'Female', 'Male', 'Female', 'Male', 'Female'], 'Salary': [50000, 60000, 45000, 55000, 70000, 55000], 'Experience': [3, 7, 2, 5, 10, - ]}
# 
#  employee_df = pd.DataFrame(dat- a)
# 
#  
# 
# Use the iloc method to select the first 3 rows of the - dataframe.
# Use the loc method to select all rows where the Department is "- Marketing".
# Use the iloc method to select the Age and Gender columns for the first 4 rows of th- e dataframe.
# Use the loc method to select the Salary and Experience columns for all rows where the Gendlection by label.
# 

# In[ ]:


import pandas as pd


# In[ ]:


data = {'Name': ['John', 'Mary', 'Bob', 'Sarah', 'Tom', 'Lisa'], 'Department': ['IT', 'Marketing', 'Sales', 'IT', 'Finance', 'Marketing'], 'Age': [30, 40, 25, 35, 45, 28], 'Gender': ['Male', 'Female', 'Male', 'Female', 'Male', 'Female'], 'Salary': [50000, 60000, 45000, 55000, 70000, 55000], 'Experience': [3, 7, 2, 5, 10, 4]}


# In[ ]:


employee_df = pd.DataFrame(data)


# In[ ]:


first_3_rows = employee_df.iloc[:3]
first_3_rows


# In[ ]:


marketing_rows = employee_df.loc[employee_df["Department"] == "Marketing" ]
marketing_rows


# In[ ]:


age_and_gender = employee_df.iloc[:4, [2, 3]]
age_and_gender


# In[ ]:


male_data = employee_df.loc[employee_df['Gender'] == 'Male', ['Gender', 'Salary', 'Experience']]
male_data

