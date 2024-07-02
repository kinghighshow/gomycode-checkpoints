#!/usr/bin/env python
# coding: utf-8

# ### What You're Aiming For
# 
# This dataset contains loan information, including loan ID, customer gender, location, region, total price for each loan etc.
# 
# 
# #### Instructions
# 
#  
# 
# Begin by importing the necessary libraries, numpy.
# Use the open() function to open csv file and assign the result to a variable.
# Use the numpy array to perform some basic statistical analysis on the data, such as finding the mean, median, and standard deviation of the loan amounts.
# Note:
# 
# Be sure to close the file after you have finished reading it in with the open() function.
# Use the delimiter parameter in the genfromtxt() function to specify that the values in the file are separated by commas.
# You can use the numpy functions mean(), median(), and std() to find the mean, median, and standard deviation of the loan amounts.

# In[ ]:


import numpy as np 


# In[ ]:


file_name = 'Loan_prediction_dataset.csv'


# In[ ]:


with open(file_name, 'r') as file:
    content = file.read()
print(content)


# In[ ]:


data = np.genfromtxt('Loan_prediction_dataset.csv', delimiter=',', names=True)
loan_amount_column = data['LoanAmount']


# In[ ]:


column_mean = np.nanmean(loan_amount_column)
print(column_mean)

column_median = np.nanmedian(loan_amount_column)
print(column_median)

column_stdev = np.nanstd(loan_amount_column)
print(column_stdev)

