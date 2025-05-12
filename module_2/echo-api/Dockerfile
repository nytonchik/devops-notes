FROM python:3.12-slim AS builder
WORKDIR /app
COPY app.py .
RUN pip install flask



FROM python:3.12-alpine
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.12/ /usr/local/lib/python3.12/
COPY --from=builder /app/app.py .
EXPOSE 5000
CMD ["python", "app.py"]

