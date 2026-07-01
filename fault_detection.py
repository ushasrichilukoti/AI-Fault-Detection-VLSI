import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

data = pd.read_csv("dataset.csv")

X = data[["A", "B", "Faulty_Sum"]]
y = data["Fault"]

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

model = DecisionTreeClassifier()
model.fit(X_train, y_train)

y_pred = model.predict(X_test)

print("Accuracy:", accuracy_score(y_test, y_pred))
print(model.predict([[3,2,6]]))
print(model.predict([[3,2,5]]))
print(model.predict([[7,5,13]]))
print(model.predict([[7,5,12]]))
prediction = model.predict([[3, 2, 6]])
print("Prediction:", prediction)