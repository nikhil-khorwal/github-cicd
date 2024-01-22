FROM python:3.10-alpine

COPY pyproject.toml .
COPY poetry.lock .

RUN apk add --no-cache zlib-dev libffi-dev curl


WORKDIR /code

COPY /demo ./demo
COPY /tests ./tests

RUN pip3 install poetry==1.3.1
RUN poetry install --only main

EXPOSE 8000

CMD ["poetry", "run", "uvicorn", "demo.main:app", "--host", "0.0.0.0", "--port", "8000"]
