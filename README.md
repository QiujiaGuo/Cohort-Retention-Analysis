# Cohort Retention Analysis

This project analyzes cohort retention of an online retail store. The aim is to understand customer purchase behavior, identify retention patterns over time and propose strategies to improve customer retention.


## Source Data

The data source is Online Retail dataset on [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Online+Retail). It contains transactional data of a UK-based online retail store from 2010-2011.


## Data Preprocessing in Python

1.    Change data types for invoice date and customer ID columns.
2.    Remove duplicates.
3.    Delete records with null customerID values. Those records are for bad debt adjustment.
2.    Remove negative values in Quantity column. Those are product returns.


## Results

![alt text](https://github.com/QiujiaGuo/Cohort-Retention-Analysis/blob/main/Cohort%20Retention%20Matrix.PNG)

•	The retention rate decreases about 20% in Cohort 1, indicating that 80% of customers did not return in the second month after they made their first purchase.

•	The biggest drop in retention rate is in December 2011 for 2011-02-01 cohort (only 7% of customers placed orders).

•	The retention rate also declines about 20% over product lifetime, meaning our products fail to sustain customer interest over time.

•	For each new cohort till August 2011, they seem to have a lower retention rate than their previous cohort, which indicates that the newer our customers are, the less likely they are to stay engaged.

•	There is a spike in retention rate for customers who joined in August and September 2011, indicating promising changes in product features, user experience or campaign activities.

•	There is a high retention rate (over 40%) for customers who made their first purchase during the holiday season, indicating that these customers were more loyal.


## Actionable Steps

•	Analyze the possible factors that drive up the retention rate in August and September 2011 and see if those strategies can be implemented for February-July 2011 cohorts.

•	Deep dive into customer preferences and create targeted campaigns to engage new customers.

•	Develop a hypothesis on how to improve retention. 
This hypothesis can be informed by factors such as customer demographics, product preferences, and purchasing behavior.
  
•	Test hypothesis and measure how (and if) it boosts retention. 
Once the hypothesis has been developed, it is important to test it and measure its impact on retention. This can be done by conducting A/B testing, where one group of customers is exposed to the new retention strategy, while the other is not. The results of the A/B test can be used to determine if the new strategy has a positive impact on retention. By doing so, the business can refine its retention strategy and continuously improve customer retention and lifetime value.


## Future Improvements

•	Conduct a customer segmentation analysis to understand the behavior of different customer groups.

•	Perform A/B testing to identify the factors that influence customer retention.

•	Analyze the product categories that drive customer retention and create targeted marketing campaigns for these products.
