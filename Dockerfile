# Setting the base to docker-node-unoconv
FROM telemark/docker-node-unoconv:8.9.4

# Clone the repo
ADD https://api.github.com/repos/iDisclose/tfk-api-unoconv/git/refs/heads/master version.json
RUN git clone -bmaster https://github.com/iDisclose/tfk-api-unoconv.git unoconvservice

# Change working directory
WORKDIR /unoconvservice

# Install dependencies
RUN npm install --production

# Env variables
ENV SERVER_PORT 3000
ENV PAYLOAD_MAX_SIZE 1048576
ENV TIMEOUT_SERVER 120000
ENV TIMEOUT_SOCKET 140000

# Expose 3000
EXPOSE 3000

# Startup
ENTRYPOINT ["node"]
CMD ["standalone.js"]
