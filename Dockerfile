FROM evolutionapi/evolution-api:latest

ENV PORT=8080
ENV AUTHENTICATION_API_KEY=supersecretkey
ENV LOGGER_LEVEL=info

EXPOSE 8080
CMD ["npm", "run", "start:migrate:prod"]
