#!/usr/bin/env python
# coding: utf-8

# Create a numpy array called "grades" that contains the following grades: [85, 90, 88, 92, 95, 80, 75, 98, 89, 83]
# 
# #### Follow These Steps
# 
# - Create a new file called "grades_analysis.py"- 
# Import the numpy library and create the "grades" array as specified above.- 
# Use numpy functions to calculate the mean, median, and standard deviation of the grades- .
# Use numpy function to find the maximum and minimum of the grade- s.
# Use numpy function to sort the grades in ascending ord- er.
# Use numpy function to find the index of the highest grade in the ar- ray.
# Use numpy function to count the number of students who scored abov- e 90.
# Use numpy function to calculate the percentage of students who scored abo- ve 90.
# Use numpy function to calculate the percentage of students who scored be- low 75.
# Use numpy function to extract all the grades above 90 and put them in a new array called "high_perf- ormers".
# Create a new array called "passing_grades" that contains all the grades - above 75.
# Print the result of all the above steps.hat can be done.

# In[24]:


import numpy as np 


# In[ ]:


grades = np.array([85, 90, 88, 92, 95, 80, 75, 98, 89, 83])


# In[84]:


grades_mean = np.mean(grades)
print(grades_mean)

grades_median = np.median(grades)
print(grades_median)

grades_std_dev = np.std(grades)
print(grades_std_dev)

min_grades = np.min(grades)
print(min_grades)

max_grades = np.max(grades)
print(max_grades)

sorted_grades = np.sort(grades)
print(sorted_grades)

index_grades = np.argmax(grades)
print(index_grades)

above_90_count = np.sum(grades > 90)
print(above_90_count)

percentage_above_90 = (above_90_count/sum(grades)) * 100
print(f"{percentage_above_90: 2}%")

percentage_below_75 = (np.sum(grades < 75)/sum(grades)) * 100
print(f"{percentage_below_75}%")

high_performers = grades[grades > 90]
print(high_performers)

passing_grades = grades[grades > 75]
print(passing_grades)

