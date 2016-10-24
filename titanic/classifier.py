import time
import numpy as np

import tensorflow as tf
from tensorflow.contrib import learn

import logging

from sklearn import svm
from sklearn.metrics import classification_report, accuracy_score
from sklearn import datasets, metrics
from sklearn.cross_validation import train_test_split

logging.getLogger().setLevel(logging.INFO)

train_csv = np.loadtxt("filtered_train.csv", skiprows=1, delimiter=',', dtype=float)
feature_size = train_csv.shape[1]

labels   = np.array(train_csv[:, 0:1]).astype(np.int32)
features = np.array(train_csv[:, 1:feature_size])

train_features, test_features, train_labels, test_labels = train_test_split(features, labels.ravel(), test_size=0.2, random_state=42)

optimizer = tf.train.AdagradOptimizer(learning_rate=0.066)
config = learn.python.learn.estimators.run_config.RunConfig()

units = [64, 128, 64]
classifier = learn.DNNClassifier(
  hidden_units=units,
  n_classes=2,
  optimizer=optimizer,
  config=config
)

started_time = time.time()
classifier.fit(train_features, train_labels, steps=1000, batch_size=32)
finished_time = time.time()

test_pred = classifier.predict(test_features)
print(classification_report(test_labels, test_pred))
print(accuracy_score(test_labels, test_pred))
print("elapsed_time:{0} [sec]".format(finished_time - started_time))

submit_test_csv = np.loadtxt("filtered_test.csv", skiprows=1, delimiter=',', dtype=float)
submit_test_features = submit_test_csv[:,1:]
submit_test_passenger_ids = submit_test_csv[:,0:1]
submit_test_pred = classifier.predict(submit_test_features)

submit_test_data = np.hstack((submit_test_passenger_ids[:, 0:1], np.transpose([submit_test_pred])))
submit_test_data = np.array(submit_test_data, dtype=None)
np.savetxt("submit.csv", submit_test_data, delimiter=",", fmt="%.0f", header="PassengerId,Survived")

#
#              precision    recall  f1-score   support
#
#           0       0.85      0.87      0.86       105
#           1       0.81      0.78      0.79        74
#
# avg / total       0.83      0.83      0.83       179
#
# 0.832402234637
# elapsed_time:3.8553130626678467 [sec]
