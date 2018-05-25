
# Source https://www.springboard.com/blog/linear-regression-in-python-a-tutorial/


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

data = pd.read_csv('lsd.csv')

print(data)

X = data['Tissue Concentration'].values[:,np.newaxis]
y = data['Test Score'].values

print(X)
print(np.newaxis)


model = LinearRegression()
model.fit(X, y)

print(model.predict(X))

plt.scatter(X, y, color='r')
plt.plot(X, model.predict(X),color='k')
plt.show()





