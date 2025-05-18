FROM python:3.12-slim as builder
WORKDIR /app
COPY app.py .
RUN pip install flask



FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY . .
CMD ["python","app.py"]
EXPOSE 5000
