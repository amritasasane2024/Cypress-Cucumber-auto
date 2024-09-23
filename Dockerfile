FROM cypress/browsers:latest
# Display Node.js and npm versions
#RUN node --version && npm --version

#RUN mkdir /cucumberproject
#We make it our workdirectory
#WORKDIR /cucumberproject
#Let's copy the essential files that we MUST use to run our scripts.
COPY ./package.json .
#COPY ./jsconfig.json .
#COPY ./.cypress-cucumber-preprocessorrc.json .
COPY ./cypress.config.js .
COPY ./cypress ./cypress
#Install the cypress dependencies in the work directory
RUN npm install
#Executable commands the container will use[Exec Form]
ENTRYPOINT ["npx","cypress","run"]
#With CMD in this case, we can specify more parameters to the last entrypoint.
CMD [""]  

#To build this image just use the following command line(just as an example, use your tag name:version as prefered.):
#docker build -t cucumberproject:1.0 .

#To run an example:
#TAG INSTANCE:docker run -ti pickles:1.2 --spec cypress/e2e/bdd-cucumber/features/*  --env tags=@mobile
#CHROME INSTANCE: docker run -ti pickles:1.2 --spec cypress/e2e/bdd-cucumber/features/Streaming.feature  --browser chrome
#FIREFOX INSTANCE: docker run -ti pickles:1.2 --spec cypress/e2e/bdd-cucumber/features/* --browser firefox
# Volume config sample for Windows: -v "%cd%":/cucumberproject