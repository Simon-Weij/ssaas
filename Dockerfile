# Copyright (c) 2025 Simon-Weij
# 
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

FROM node:24-trixie-slim AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

WORKDIR /app/frontend
RUN npm install
RUN npm run build

RUN mkdir -p /app/public
RUN cp -r /app/frontend/build/* /app/public/

WORKDIR /app
RUN npm run build

FROM node:24-trixie-slim AS production

WORKDIR /app

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/public ./public
COPY --from=builder /app/package*.json ./

RUN npm install --only=production

RUN useradd -ms /bin/bash appuser
USER appuser

EXPOSE 3000

CMD ["node", "dist/src/main.js"]
