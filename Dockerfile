FROM python:3.12.2-alpine3.19 as builder

WORKDIR /app

COPY requirements.txt .

RUN python -m venv venv && \
    venv/bin/pip install --no-cache-dir -U pip && \
    venv/bin/pip install --no-cache-dir -r requirements.txt && \
    rm requirements.txt && \
    find venv -type d -a -name test -o -name tests -exec rm -rf '{}' \+ && \
    find venv -name "*.pyc" -exec rm -f {} \+ && \
    find venv -name "*.pyo" -exec rm -f {} \+ && \
    find venv -type d -name "__pycache__" -exec rm -r {} \+

FROM python:3.12.2-alpine3.19

WORKDIR /app

RUN addgroup -S nonroot && adduser -S nonroot -G nonroot
USER nonroot

COPY --from=builder --chown=nonroot:nonroot /app /app

EXPOSE 8080

CMD ["venv/bin/pypi-server", "-p", "8080", "/data/packages"]
