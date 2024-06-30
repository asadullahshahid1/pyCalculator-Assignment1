# Use official Python 3.10 image as base
FROM python:3.10.12

# Add PyCalculator.py to the root directory of the container
ADD PyCalculator.py /

# Set the command to run when the container starts
CMD ["python", "PyCalculator.py"]
