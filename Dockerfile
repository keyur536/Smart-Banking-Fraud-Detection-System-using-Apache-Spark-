# Use the official Jupyter image with PySpark pre-installed
FROM jupyter/pyspark-notebook:latest

# Set the working directory inside the container
WORKDIR /home/jovyan/work

# Copy the requirements file and install additional libraries
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your Jupyter Notebook into the container
COPY Fraud_Detection.ipynb .

# Copy the contents of your dataset folder into the working directory
# (Your notebook code expects the CSVs to be in the same directory as the notebook)
COPY dataset/ .

# Expose Jupyter port
EXPOSE 8888

# Start Jupyter Notebook when the container runs
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]