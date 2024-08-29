# Usar una imagen base de Python
FROM python:3.9-slim

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar el archivo Python al contenedor
COPY tryopenvoice.py /app/

# Copiar el archivo de configuración y cualquier otro recurso necesario
COPY config.json /app/
COPY checkpoint.pth /app/
COPY resources/ /app/resources/

# Instalar las dependencias necesarias
# Si usas un archivo requirements.txt, inclúyelo y úsalo para instalar las dependencias
RUN pip install fastapi torch uvicorn melo openvoice

# Crear directorio para los archivos de audio
RUN mkdir -p /app/audio_files

# Exponer el puerto en el que se ejecutará la aplicación
EXPOSE 8000

# Comando para ejecutar la aplicación con Uvicorn
CMD ["uvicorn", "tryopenvoice:app", "--host", "0.0.0.0", "--port", "8000"]
