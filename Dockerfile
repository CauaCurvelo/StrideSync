# Usa uma imagem leve do Node LTS
FROM node:20-alpine

# Define o diretório de trabalho
WORKDIR /app

# Copia apenas os arquivos de dependência primeiro (otimiza o cache do Docker)
COPY package.json package-lock.json ./

# Instala as dependências
RUN npm install

# Copia o resto do código
COPY . .

# Expõe as portas que o Expo/Metro Bundler usam
EXPOSE 8081

# Comando para iniciar o projeto no modo desenvolvedor
CMD ["npm", "run", "start"]
