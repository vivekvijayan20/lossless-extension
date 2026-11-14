FROM node:20-alpine
WORKDIR /app

# Install all deps (typescript is needed to build)
COPY package*.json ./
RUN npm ci

# Copy source and build, then drop dev dependencies
COPY . .
RUN npm run build && npm prune --omit=dev

ENV NODE_ENV=production
EXPOSE 3000

CMD ["npm", "start"]
