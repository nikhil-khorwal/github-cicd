import logging

from fastapi import FastAPI


log = logging.getLogger(__name__)
log.level = logging.INFO


app = FastAPI(docs_url="/docs", openapi_url="/openapi.json")
