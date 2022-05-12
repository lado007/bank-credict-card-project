# Bank-credict-card-project :credit_card: :bank: :euro:
## Classification case study
![card](https://github.com/lado007/bank-credict-card-project/blob/main/README%20files/card.jpg)
### Objective - Building a model that will predict if a bank customer will accept a new credit card offer or not and provide insight into why some bank customers accept credit card offers and some do not

## Table of contents
- [project summary](https://github.com/lado007/bank-credict-card-project/edit/main/README.md#project-summary)
- [data processing](https://github.com/lado007/bank-credict-card-project/edit/main/README.md#data-processing)
- [applying best machine learning model](https://github.com/lado007/bank-credict-card-project/edit/main/README.md#applying-best-machine-learning-model)
- [data queries]
- data visualisation
- insights

## Project summary 📖
**Background**: working as a risk analyst with a bank. Apart from the other banking and loan services, the bank also provides credit card services which is a very important source of revenue for the bank. The bank wants to understand the demographics and other characteristics of its customers that accept a credit card offer and that do not accept a credit card.
Usually the observational data for these kinds of problems is somewhat limited in that often the company sees only those who respond to an offer. To get around this, the bank designs a focused marketing study, with 18,000 current bank customers. This focused approach allows the bank to know who does and does not respond to the offer, and to use existing demographic data that is already available on each customer.

**Objective**: The task is to build a model that will provide insight into why some bank customers accept credit card offers. There are also other potential areas of opportunities that the bank wants to understand from the data that will help them better understand their customers.

**Data**: The data set consists of information on 18,000 current bank customers in the study.

## Data processing :gear:

To explore the data, first several techniques data cleaning and exploring techniques was applied. Some of them include checking null values and duplicates, using _matplotlib_ and _seaborn_ for developing visualizations and understanding the correlations between the variables.
The data also has a number of categorical and numerical variables, both variables was explored seperately. The Chi-square test was used to examine the differences between the categorical variables in relation to the target variable. then we scaled the numerical variables and categorical variables encoded.
For the target variable (Offer accepted – Yes/No), it was also important to check the data imbalance ie the number of people who responded with a yes vs the number of people who responded with a no and apply an efficient data imbalanace technique.

## Applying best machine learning model :robot:
After the first step of thoroughly understanding the data and taking the necessary steps to prepare the data for modeling before building predictive models. The logistic regression for classification was used as a benchmark to build the predictive model without any data imbalance for the target model. Then we applied an imbalance technique of SMOTETomek. After the application of the data imbalance technique we then proceed again to rebuild the logistic regression and other classification models like the KNN classifiers, decision trees and we compared their accuracies. the comparison of the their accuracies and more details regarding the concepts of the ML models can be found in [jupyter notebook](https://github.com/lado007/bank-credict-card-project/blob/main/codes/credit_card_project.ipynb)

## Data queries :question:
In the scenerio of working as a risk analyst with a bank the senior management has also posted other questions that will help them better understand their customers.
this queries can be found in the [sql workbench] 


