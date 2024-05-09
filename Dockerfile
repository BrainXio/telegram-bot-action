# Dockerfile for Python Version
FROM python:3.10

COPY telegram.py /telegram.py
RUN pip install requests PyGithub

ENTRYPOINT ["python", "/telegram.py"]