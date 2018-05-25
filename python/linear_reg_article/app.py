import statsmodels.api as sm
# import numpy as np
import pandas as pd

from sklearn import linear_model

###############################################################################
# Loading the dataset
###############################################################################

from sklearn import datasets ## imports datasets from scikit-learn
data = datasets.load_boston() ## loads Boston dataset from datasets library

# print(data.feature_names)
# print(data.target)

# define the data/predictors as the pre-set feature names
df = pd.DataFrame(data.data, columns=data.feature_names)

# Put the target (housing value -- MEDV) in another DataFrame
target = pd.DataFrame(data.target, columns=["MEDV"])

# print(df)
# print(target)

###############################################################################

X = df["RM"]
y = target["MEDV"]

lm = linear_model.LinearRegression()
model = lm.fit(X,y)

predictions = lm.predict(X)
print(predictions)

print(df["RM"])