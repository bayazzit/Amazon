# Set the base image
FROM  python:3.9

# Set the working directory
WORKDIR  /app

# Copy the Robot Framework code to the container
COPY  . /app

# Install the dependencies
RUN pip install -r requirements.txt

# Set the entrypoint
ENTRYPOINT ["robot"]