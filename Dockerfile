FROM python:3.10.4-alpine3.15 as builder

WORKDIR /app

RUN python -m venv venv && \
    venv/bin/pip install --no-cache-dir -U pip && \
    venv/bin/pip install --no-cache-dir install pypiserver && \
    find venv -type d -a -name test -o -name tests -exec rm -rf '{}' \+ && \
    find venv -name "*.pyc" -exec rm -f {} \+ && \
    find venv -name "*.pyo" -exec rm -f {} \+ && \
    find venv -type d -name "__pycache__" -exec rm -r {} \+

FROM python:3.10.4-alpine3.15

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 8080

CMD ["pypiserver", "-p", "8080", "/packages"]
