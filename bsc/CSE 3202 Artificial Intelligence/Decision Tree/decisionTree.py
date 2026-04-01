# Import modules:
import pandas
from sklearn import tree
from sklearn.tree import DecisionTreeClassifier
import matplotlib.pyplot as plt
# Read input file:
df = pandas.read_csv("data.csv")
# Map input file string to numerical:
d = {'UK': 0, 'USA': 1, 'BD': 2}
df['Nationality'] = df['Nationality'].map(d)
d = {'YES': 1, 'NO': 0}
df['Go'] = df['Go'].map(d)
# Make list of features:
features = ['Age', 'Experience', 'Rank', 'Nationality']
# Assign features and condition into axis:
X = df[features]
y = df['Go']
# Call function for classification:
dtree = DecisionTreeClassifier()
# Plot result into X and Y:
dtree = dtree.fit(X, y)
# Plot tree and show output:
tree.plot_tree(dtree, feature_names=features)
plt.show()
