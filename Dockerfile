FROM python:3.8.6-buster

# write some code to build your image.
COPY model.joblib /model.joblib
COPY requirements.txt /requirements.txt
COPY api /api
COPY TaxiFareModel /TaxiFareModel

# install requirements and upgrade pip
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Run uvicorn server for API
CMD uvicorn api.fast:app --host 0.0.0.0 --port $PORT
