# Instructions to run AOAME locally

## Summary
### Docker
- [Installation with Docker](#installation-with-docker)
- [Start AOAME](#start-aoame)
- [Upload Ontologies to Jena Fuseki](#upload-ontologies-to-jena-fuseki)
- [Stop the Services](#stop-the-services)
- [Remove the Services](#remove-the-services)
### Local Installation (source code access)
- [Local Installation](#local-installation)
- [Setup Development Environment](#setup-development-environment)
- [Building the WebService](#building-the-webservice)
- [Running/Debugging the WebService](#runningdebugging-the-webservice)
- [Building the WebApp](#building-the-webapp)
- [Starting AOAME](#starting-aoame)
- [Pushing the artifact to GitHub and AOAME](#pushing-the-artifact-to-github-and-aoame)



# Docker
## Installation with Docker
1. Download Docker Desktop from Docker's official website: https://www.docker.com/products/docker-desktop/
2. Install Docker Desktop as administrator: click **Default Setup**, and skip the creation of an account
3. Run Docker Desktop as administrator

## Setup AOAME
- Prerequisites:
  - Docker Desktop
  - Git: <https://git-scm.com/downloads>
- Run the `setup_local.bat` (Windows) or `setup_local.sh` (MacOs/Linux) file
  - This script will git pull all required repositories: WebApp, WebService, JenaFuseki into **aoame/** directory

## Start AOAME
- Make sure Docker Desktop is running
- For Windows: Run the `docker_start_local.bat` file (run as administrator if access denied).
- For MacOS/Linux: Run the `docker_start_local.sh` file (try to run as administrator if access denied).
  - Open a terminal/console in the **Project Directory**
    - drag the file into the terminal or use `cd path-to-the-project` to navigate to the project directory if needed.
  - Make the script executable with `chmod +x start_local_docker.sh` and run it `./start_local_docker.sh`. [Mac Support](https://support.apple.com/en-vn/guide/terminal/apdd100908f-06b3-4e63-8a87-32e71241bab4/mac) 
- **Alternatively for any OS**
  - Open a terminal in the **Project Directory** and run the following command:
```bash 
docker compose up --build
```

## Upload Ontologies to Jena Fuseki
1. Download triples from [Ontology4ModelingEnvironment repository](https://github.com/BPaaSModelling/Ontology4ModelingEnvironment).
2. Open Jena Fuseki in your browser: http://localhost:3030/
3. Click on "dataset" tab, then click on "upload files" tab
4. Click on "Select files...", upload the downloaded triples

### Open your browser:
#### Access the WebApp at: http://localhost:4200/
#### Access Jena Fuseki Triple Store at: http://localhost:3030/ 

## Stop the services
- Open Docker Desktop, go to Containers tab (the top one), click on the stop button 🟦
- Alternatively, open the running terminal and press Ctrl+C 2 times to stop the services
- Alternatively, run the following command in the terminal:
```bash
docker compose down
```
## Remove the services
- Open Docker Desktop, go to Containers tab (the top one), click on the remove button
- Go to Images tab (the top one), click on the remove button

# Local Installation
## Prerequisites
To run AOAME locally you first need to install the following software:

- Git: <https://git-scm.com/downloads>

- JDK: <https://adoptium.net/temurin/archive/?version=17> Make sure you install the current version of the project: **Temurin 17.0.7+7**

- Either IntelliJ: <https://www.jetbrains.com/idea/download/> (requires academic license)
or Eclipse: <https://www.eclipse.org/downloads/> or only Maven: <https://maven.apache.org/>

- Optionally WebStorm: <https://www.jetbrains.com/webstorm/> (requires academic license)

- Node.js: https://nodejs.org/en/blog/release/v16.4.2  
Important: Install the node version that is required by the WebApp project in package.json. Check it via the link: [WebApp repo package.json](https://github.com/BPaaSModelling/OntologyBasedModellingEnvironment-WebApp/blob/master/package.json)  
- Check the required node version here: `"engines": { "node": "'Node_Version'" }`

To make changes to the source code of the WebService it is recommended to install IntelliJ or Eclipse which comes with its own version of Maven. If you do not plan on making changes to the WebService it is also possible to install Maven on its own.

When installing Eclipse make sure to choose “Eclipse IDE for Enterprise Java and Web Developers”.

WebStorm is not needed for running AOAME locally but it can be used to make changes on the WebApp.

## Setup Development Environment
To contribute to the project, set up the development environment:
- Run `setup_local.bat` (Windows) or `setup_local.sh` (MacOs/Linux) file
- This script will git pull all required repositories: WebApp, WebService, JenaFuseki into **aoame/** directory

After the script has finished, you will need to build the WebService and the WebApp before they can be used.

## Building the WebService

### Using IntelliJ (recommended)

Start IntelliJ, open the WebService project: click *File*, *Open*, provide the path to WebService. The WebService is inside of newly created *aoame* folder *OntologyBasedModellingEnvironment-WebService.*

To build the project, click *Run* and *Edit Configurations*. Then, add the following configuration in IntelliJ and run it.

![b9272fc3f8e3dc466663c5f51b40a981](https://github.com/BPaaSModelling/AOAME/assets/18686110/465f8ac6-a6ef-48d2-b36f-148b14e2f752)

### Using Eclipse

Start Eclipse and click *File* then *Import…*

![ab35623fca096f8ed0f4e7e706deca72](https://github.com/BPaaSModelling/AOAME/assets/18686110/16a654eb-05d7-4901-835e-2970e3c361ad)

Select *Projects from Folder or Archive*. Then click on *Next*.

![6d7c73468e82a5148f7df757566b3fc6](https://github.com/BPaaSModelling/AOAME/assets/18686110/e548a828-f1c5-4946-911a-c51be9e3c4ce)

The *setup_local.bat* script should have created a folder called *aoame* which contains a folder called *OntologyBasedModellingEnvironment-WebService.* Select the *OntologyBasedModellingEnvironment-WebService* folder by clicking *Directory…* and navigating to it.

After you have selected the directory click *Finish*.

![78d72e6861cd432b2df37716aedbace0](https://github.com/BPaaSModelling/AOAME/assets/18686110/e5074011-6d4d-4fae-af8b-02604c78f372)

Now you need to setup a run configuration. To do that click on the down arrow then on *Run As* and the on *Maven build.*

![114b186aea5287f2cc9e110d43eb89a2](https://github.com/BPaaSModelling/AOAME/assets/18686110/851e1864-6e71-4606-8f37-36f6fc7c9253)

In the *Goals* field write *package.* Then click on *Run* to start the Maven build.

![d225d1b3f97fe426dae0ea456557454b](https://github.com/BPaaSModelling/AOAME/assets/18686110/db03a9e9-8f82-46a7-aba0-3e9b6a90225a)

The next time you want to build the WebService you can run Maven by clicking on *OntologyBasedModellingEnvironment-WebService* inside the dropdown menu.

![2bbbec65e82c0473e2809e64a2247031](https://github.com/BPaaSModelling/AOAME/assets/18686110/43a907d6-6a81-439f-a29d-c99d8940991f)

### Using Maven directly

If you use Maven directly you can build the WebService by running *mvn verify.*

## Running/Debugging the WebService

### Using IntelliJ

Open *Run configrations* again, click on the *+* sign to add a new *JAR Application*.

Provide the *Path to JAR* according to your setup.  
Enter *Program arguments*, as shown below.

![0e487bff81b68d77a71b14028bb7e884](https://github.com/BPaaSModelling/AOAME/assets/18686110/2adbca4d-d3e7-44ce-8efe-9663d68e5ae9)
![ec006f24da8950d00e22a034a276a1d2](https://github.com/BPaaSModelling/AOAME/assets/18686110/a3ff8bdf-c35b-4e9d-9730-5e9c12f7e515)

Add Run Maven package to *Before launch,* right below. This will build the project before every launch.

![4e81c2d68899d36f834e0c5b15a9b3cb](https://github.com/BPaaSModelling/AOAME/assets/18686110/0713cfe7-c4d4-4a90-bf7d-8f9f2a465d20)

Finally, press run or debug buttons.

![bb5569cc2e5e796833bca8f3fd9e6931](https://github.com/BPaaSModelling/AOAME/assets/18686110/e09d3fee-de48-430b-92f2-5f4cb026530f)

## Building the WebApp

### Using WebStorm

First open the folder *OntologyBasedModellingEnvironment-WebApp* inside WebStorm. Then click on *Add Configuration…*

![333617297572574caddb4dd8cf3a8054](https://github.com/BPaaSModelling/AOAME/assets/18686110/5381dd19-724d-47d9-8a32-e00b9e996af8)

Click on the plus symbol at the top left of the dialog.

![ac287b0db2ea82aff035e7c6547858f2](https://github.com/BPaaSModelling/AOAME/assets/18686110/99338e66-ba55-4659-8cfc-5c90b07a3835)

Select *npm* on the dropdown.

![742751fe05cfa548562da84f6eb3b658](https://github.com/BPaaSModelling/AOAME/assets/18686110/4dc97aec-2241-4048-aa8f-0e86f86c1c2a)

On the *Scripts* dropdown select *build.* You have now added a configuration to build the WebApp.

![ea92175e2d2513a7e44b8044af182596](https://github.com/BPaaSModelling/AOAME/assets/18686110/75d52221-cdba-46ec-a54c-eb34edf856a4)

To start building the WebApp make sure that *build* is selected on the dropdown then click on the green arrow to the right of the dropdown.

![25c8462c5bca5b372061b62d84930091](https://github.com/BPaaSModelling/AOAME/assets/18686110/73cffc8f-bd60-47ff-bdc0-f17ee17c2c72)

You can also add a second configuration with *heroku-start*. This can be used to start the WebApp through WebStorm.

![1ef3f813a04304340b264a67411c046d](https://github.com/BPaaSModelling/AOAME/assets/18686110/d6df5aa8-0572-4721-ba59-f164dc986432)

### Using the Command line

If you do not want to use WebStorm you can use the command *ng build* to build the WebApp.

## Starting AOAME

To start fuseki, the WebService and the WebApp at the same time you can use the *start_local.bat* script.

To start fuseki on its own run the *fuseki-server.bat* script inside the *fuseki-heroku-test* folder.

To start the WebService on its own run the *start webserver.bat* script inside the *OntologyBasedModellingEnvironment-WebService* folder.

To start the WebApp on its own run *node server.js* in a command prompt inside the *OntologyBasedModellingEnvironment-WebApp* folder.

## Pushing the artifact to GitHub and AOAME

To push your version to GitHub follow the steps below:

1. Ensure you have access to the required repositories for your project. Depending on the scope, it might be 1-3 repos:

<https://github.com/BPaaSModelling/OntologyBasedModellingEnvironment-WebApp>

<https://github.com/BPaaSModelling/OntologyBasedModellingEnvironment-WebService>

To push a new ontology you will need access to:  
<https://github.com/BPaaSModelling/Ontology4ModelingEnvironment>

2. Create a personal access token to push it from Intellij/WebStorm/Eclipse, unless you have another authentication method like the ssh key. Usually, the GitHub account password doesn’t work.

Open GitHub -\> Settings -\> Developer Settings -\>Personal access tokens -\> Tokens (classic) -\> Create one token with default repo access -\> copy the token, you will need it later.

3. Open Intellij/WebStorm/Eclipse. Go to Git -\> Connect to the respective repository -\> Use your token as a password when connecting.

4. Create a new branch for your version, commit all your changes, and push.

![6d9de8b321c5a6833363c129b4a5df26](https://github.com/BPaaSModelling/AOAME/assets/18686110/df6198b2-eafb-4ea9-aa97-2deaeae21535)

5. Now, merge your branch into the master branch.

In Intellij or WebStorm, right-click the master branch and click "checkout the master". Now, you can merge your branch into the master branch (screenshot below). Once it is done, please test that everything works as expected. If testing is successful, push the new master branch.

![60242dbde1711737379b10c948a1f4ca](https://github.com/BPaaSModelling/AOAME/assets/18686110/dc1aa283-441a-4a33-8a37-2dc85895e178)

If you need to push to the Ontology4ModelingEnvironment repo, first you need to merge the master into your own branch.

Create a Pull request directly from GitHub that will be merged when approved (see screenshots).

![868da44782ed4f759a2e5894f22d6d61](https://github.com/BPaaSModelling/AOAME/assets/18686110/b220ca26-7824-4dbe-8fb5-d98bd995a3c7)

![457cdc90f5c3e9580e15afd8f21c46d2](https://github.com/BPaaSModelling/AOAME/assets/18686110/d4382e2b-7559-4887-867a-83bb1af63d4e)