# Utilizza l'immagine base di Node.js
FROM node:16

# Imposta la directory di lavoro
WORKDIR /app

# Copia il package.json e installa le dipendenze
COPY package.json .
RUN npm install

# Copia tutto il codice dell'applicazione
COPY . .

# Espone la porta 8080
EXPOSE 8080

# Comando per avviare l'applicazione
CMD ["npm", "start"]
