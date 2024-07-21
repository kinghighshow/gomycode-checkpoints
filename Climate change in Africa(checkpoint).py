#!/usr/bin/env python
# coding: utf-8

# #### In this checkpoint, we are going to work on the 'Climate change in Africa' dataset that was provided by the U.S global change research program.
# 
# ##### Dataset description : This dataset contains historical data about the daily min, max and average temperature fluctuation in 5 African countries (Egypt, Tunisia, Cameroon, Senegal, Angola) between 1980 and 2023.

# #### Instructions
# 
# - Load the dataset into a data frame using Python.
# - Clean the data as needed.
# - Plot a line chart to show the average temperature fluctuations in Tunisia and Cameroon. Interpret the results.
# - Zoom in to only include data between 1980 and 2005, try to customize the axes labels.
# - Create Histograms to show temperature distribution in Senegal between [1980,2000] and [2000,2023] (in the same figure). Describe the obtained results.
# - Select the best chart to show the Average temperature per country.
# - Make your own questions about the dataset and try to answer them using the appropriate visuals.

# In[12]:


import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import plotly.express as px
import plotly.graph_objects as go


# In[69]:


climate_change_df = pd.read_csv("Africa_climate_change.csv")
climate_change_df


# In[65]:


climate_change_df.info()


# In[67]:


climate_change_df.isnull().count()


# ### Cleaning the data as needed.

# In[70]:


climate_change_df['DATE'] = climate_change_df['DATE'].str.replace(r'\d{6}$', '', regex=True)
climate_change_df


# In[ ]:


climate_change_df['DATE'] = climate_change_df['DATE'].str.strip()


# In[73]:


climate_change_df['DATE'] = pd.to_datetime(climate_change_df['DATE'], format='%Y%m%d')


# In[82]:


climate_change_df


# In[81]:





# ### Plot a line chart to show the average temperature fluctuations in Tunisia and Cameroon. Interpret the results.

# In[87]:


selected_countries = ['Tunisia']
fig = px.line(climate_change_df[climate_change_df['COUNTRY'].isin(selected_countries)], x='DATE', y='TAVG', color='COUNTRY', title='The Average Temperature Fluctuations in Tunisia', height = 700, width = 1000)
fig.show()


# In[88]:


selected_countries = ['Cameroon']
fig = px.line(climate_change_df[climate_change_df['COUNTRY'].isin(selected_countries)], x='DATE', y='TAVG', color='COUNTRY', title='The Average Temperature Fluctuations in Cameroon', height = 700, width = 1000)
fig.show()


# ### Zoom in to only include data between 1980 and 2005, try to customize the axes labels.

# In[90]:


start_date = '1980-01-01'
end_date = '2005-12-31'
zoomed_df = climate_change_df[(climate_change_df['DATE'] >= start_date) & (climate_change_df['DATE'] <= end_date)]


# In[91]:


zoomed_df


# In[92]:


selected_countries = ['Tunisia']
fig = px.line(zoomed_df[zoomed_df['COUNTRY'].isin(selected_countries)], x='DATE', y='TAVG', color='COUNTRY', title='The Average Temperature Fluctuations in Tunisia', height = 700, width = 1000)
fig.show()


# In[93]:


selected_countries = ['Cameroon']
fig = px.line(zoomed_df[zoomed_df['COUNTRY'].isin(selected_countries)], x='DATE', y='TAVG', color='COUNTRY', title='The Average Temperature Fluctuations in Cameroon', height = 700, width = 1000)
fig.show()


# ### Create Histograms to show temperature distribution in Senegal between [1980,2000] and [2000,2023] (in the same figure). Describe the obtained results.

# In[95]:


df_1980_2000 = climate_change_df[(climate_change_df['DATE'] >= '1980-01-01') & (climate_change_df['DATE'] <= '2000-12-31')]
df_2000_2023 = climate_change_df[(climate_change_df['DATE'] >= '2000-01-01') & (climate_change_df['DATE'] <= '2023-12-31')]


# In[99]:


fig = go.Figure()

fig.add_trace(go.Histogram(x=df_1980_2000['TAVG'], name='1980-2000', opacity=0.75))

fig.add_trace(go.Histogram(x=df_2000_2023['TAVG'], name='2000-2023', opacity=0.75))

fig.update_layout(title='Temperature Distribution in Senegal', xaxis_title='Temperature (°C)',yaxis_title='Frequency',barmode='overlay', height = 700, width = 1000)

fig.show()


# ### Select the best chart to show the Average temperature per country.

# In[98]:


fig = px.box(climate_change_df, x='COUNTRY', y='TAVG', title='Average temperature per country', height = 700, width = 1000)
fig.show()


# ## Make your own questions about the dataset and try to answer them using the appropriate visuals.

# ### 1. How do two variables relate to each other?

# In[118]:


fig = px.scatter(climate_change_df, x='TMAX', y='PRCP', trendline='ols', title='Max Temperature against Precipitation')

fig.show()


# In[ ]:


# SHOWS NO CORRELATION


# ### 2. How does a variable change over time in Cameroon?

# In[119]:


climate_change_df['DATE'] = pd.to_datetime(climate_change_df['DATE'])
climate_change_df['YEAR'] = climate_change_df['DATE'].dt.year

country = 'Cameroon'
avg_tmax_per_year = climate_change_df[climate_change_df['COUNTRY'] == country].groupby('YEAR')['TMAX'].mean().reset_index()

# Create a line chart
fig = px.line(avg_tmax_per_year, x='YEAR', y='TMAX', title=f'Average TMAX Over Years in {country}', labels={'TMAX': 'Average TMAX', 'YEAR': 'Year'})

fig.show()


# In[121]:


# dataset shows no significant pattern or trend in cameroon

