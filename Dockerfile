# For more information, please refer to https://aka.ms/vscode-docker-python
## BASE image
FROM python:3.8-slim-buster AS base

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1
# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt requirements.txt
RUN python -m pip install --no-cache-dir -r requirements.txt

WORKDIR /app


## DEBUG image
FROM base AS debug

RUN pip install --no-cache-dir debugpy==1.3.0


## PROD image
FROM base AS prod

RUN pip install --no-cache-dir gunicorn==20.0.4
COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
