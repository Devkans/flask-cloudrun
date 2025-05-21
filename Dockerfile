# builder
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt ./
RUN pip install --prefix=/install -r requirements.txt

# Sruntime
FROM python:3.12-slim
WORKDIR /app

# Hpull only the installed packages from the “builder” 
COPY --from=builder /install /usr/local
COPY app.py ./

CMD ["python", "app.py"]
