# Specify the base image to use. Here, it is a lightweight Python 3.9 image.
FROM python:3.9-slim

# Set /app as the working directory, in the container, for subsequent instructions.
WORKDIR /app  

# Copy the app.py file from the host to the container.
ADD app.py app.py  

# Install the Flask library required for the application.
RUN pip install flask  

# Expose the application port
EXPOSE 5000  

# Define the default command to start the application.
CMD ["python", "app.py"]