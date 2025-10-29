# Etapa 1 — Build
FROM node:20-bullseye-slim AS build

WORKDIR /app

# Instalar dependências
RUN apt-get update && apt-get install -y git curl && \
    git clone https://github.com/EvolutionAPI/evolution-api.git . && \
    npm install

# Compilar o projeto (gera a pasta /dist)
RUN npm run build

# Etapa 2 — Execução
FROM node:20-bullseye-slim

WORKDIR /app

# Copiar arquivos compilados da etapa anterior
COPY --from=build /app /app

# Variáveis de ambiente padrão
ENV PORT=8080
ENV AUTHENTICATION_API_KEY=supersecretkey
ENV LOGGER_LEVEL=info

# Expor porta
EXPOSE 8080

# Iniciar servidor
CMD ["node", "dist/main.js"]
