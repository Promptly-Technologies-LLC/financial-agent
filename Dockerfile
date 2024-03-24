FROM python:3.12-bullseye

RUN pip install poetry==1.6.1

WORKDIR /code

COPY . /code/

RUN poetry install --no-interaction --no-ansi

ENV OPENAI_API_KEY=$OPENAI_API_KEY
ENV POLYGON_API_KEY=$POLYGON_API_KEY

EXPOSE 8080
CMD poetry run langchain serve --host 0.0.0.0 --port 8080