import numpy as np
from sklearn.decomposition import TruncatedSVD
from sklearn.feature_extraction.text import CountVectorizer

# Sample text data
documents = [
    "baseball soccer basketball",
    "soccer basketball tennis",
    "tennis cricket",
    "cricket soccer"
]

# Create a CountVectorizer to convert text data into a matrix of token counts
vectorizer = CountVectorizer()
X = vectorizer.fit_transform(documents)

# Apply Latent Semantic Analysis (LSA)
lsa = TruncatedSVD(n_components=2)  # You can adjust the number of components/topics
lsa.fit(X)

# Extract the components/topics
terms = vectorizer.get_feature_names()
topic_matrix = np.array([lsa.components_[i] / np.linalg.norm(lsa.components_[i]) for i in range(lsa.components_.shape[0])])

# Print the topics
print("Top terms for each topic:")
for i, topic in enumerate(topic_matrix):
    top_indices = topic.argsort()[-5:][::-1]  # Get the top 5 terms for each topic
    top_terms = [terms[index] for index in top_indices]
    print(f"Topic {i + 1}: {' '.join(top_terms)}")
