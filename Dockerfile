# Base: Node.js LTS
FROM node:20-bullseye-slim

# Diretório da aplicação
WORKDIR /app

# Clonar Evolution API
RUN apt-get update && apt-get install -y git curl && \
    git clone https://github.com/EvolutionAPI/evolution-api.git . && \
    npm install

# Variáveis de ambiente padrão
ENV PORT=8080
ENV WHATSAPP_DRIVER=GO
ENV WAHA_LOG_LEVEL=info
ENV EVOLUTION_API_KEY=supersecretkey
ENV EVOLUTION_DASHBOARD_ENABLED=true

# Expor porta
EXPOSE 8080

# Iniciar o servidor
CMD ["node", "dist/main.js"]
