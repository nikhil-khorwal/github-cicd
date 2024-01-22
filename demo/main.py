import logging

from ddtrace import config, patch_all
from ddtrace.contrib.asgi import TraceMiddleware
from fastapi import FastAPI


log = logging.getLogger(__name__)
log.level = logging.INFO



app = FastAPI(docs_url="/docs", openapi_url="/openapi.json")

