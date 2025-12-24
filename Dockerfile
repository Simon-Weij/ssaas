FROM node:24-trixie-slim AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM node:24-trixie-slim AS production

WORKDIR /app

RUN useradd -ms /bin/bash appuser
USER appuser

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package*.json ./

RUN npm install --only=production

CMD ["node", "dist/main.js"]
