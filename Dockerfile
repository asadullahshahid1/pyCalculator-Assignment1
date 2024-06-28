# Use official Python 3.10 image as base
FROM python:3.10.12

ADD PyCalculator.py 

CMD ["python" ,"PyCalculator.py"]
