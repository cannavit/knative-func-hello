# Usa la imagen base de Python 3.10 slim
FROM python:3.10-slim

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia los archivos de la función en el directorio de trabajo
COPY . /app

# Establece permisos de ejecución para app.sh
RUN chmod +x app.sh

# Instala las dependencias necesarias
RUN pip install --no-cache-dir -r requirements.txt

# Usa app.sh como el comando por defecto para ejecutar la función
CMD ["./app.sh"]
