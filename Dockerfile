FROM node:22-alpine

WORKDIR /app

COPY package.json pnpm-lock.yaml ./

RUN npm install -g pnpm && pnpm install --frozen-lockfile

COPY . .

RUN pnpm run build

ENV TRANSPORT=http
ENV PORT=3000

EXPOSE 3000

CMD ["node", "dist/index.js"]
