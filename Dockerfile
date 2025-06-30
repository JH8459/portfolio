FROM node:lts

WORKDIR /app

# Yarn Berry 설정 및 의존성 파일들 복사
COPY .yarn ./.yarn
COPY .pnp.cjs .pnp.loader.mjs ./
COPY package.json yarn.lock ./

# TypeScript 및 Next.js 설정 파일들 복사
COPY tsconfig.json ./
COPY next.config.ts ./

RUN corepack enable
RUN yarn install --immutable

EXPOSE 3000
CMD ["yarn", "dev"]