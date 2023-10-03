# Use an official Python runtime as a parent image
FROM python:3.10

RUN apt-get update && apt-get install -y libsqlite3-mod-spatialite
# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt
RUN python3 -m pip install --upgrade pip
# Make port 8501 available to the world outside this container
EXPOSE 8501

# Run Streamlit when the container launches
CMD ["streamlit", "run", "streamlit_app.py"]