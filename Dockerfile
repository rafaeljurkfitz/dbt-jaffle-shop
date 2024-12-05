FROM python:3.12.0-slim

WORKDIR /usr/app/jaffle_shop

# Instalar dependências
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

EXPOSE 8081

# Comando para manter o container rodando
CMD tail -f /dev/null
