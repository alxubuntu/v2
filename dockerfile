FROM python:3.10-slim

# Instalar git (necesario para instalar desde GitHub)
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Crear carpeta de trabajo
WORKDIR /app

# Instalar pip y faster-whisper desde GitHub
RUN pip install --upgrade pip && \
    pip install git+https://github.com/SYSTRAN/faster-whisper.git

# Ejecutar el servidor con el modelo small
CMD ["python3", "-m", "faster_whisper.transcribe_server", "--model-size", "small"]
