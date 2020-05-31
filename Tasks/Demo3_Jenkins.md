# Tasks for Demo 3

- [Practice after Training 1 Jenkins](#Practice-after-Training-1-Jenkins)
- [Practice after Training 2 Jenkins](#Practice-after-Training-2-Jenkins)
- [Practice after Training 3 Jenkins](#Practice-after-Training-3-Jenkins)
- [Practice after Training 4 Jenkins](#Practice-after-Training-4-Jenkins)
- [Demo Session Requirements](#Demo-Session-Requirements)


Below you will find a list of tasks to play with after each lecture as well as the list of requirements for the demo.


## Practice after Training 1 Jenkins

- Work in folder DEMO3 of your repo.
- Create instance/VM for Jenkins.
- Install and configure latest version of Jenkins
    - during the installation, at the "Customize Jenkins" stage choose "Select plugins to install" >> None
- Create three simple jobs for understanding Jenkins variables and how to use them:
     1. Create a simple job  that lists all environment variables from the host machine
     2. Create a simple job using Shell that outputs system uptime, OS version, Kernel version etc
     3. Create a simple job that triggers after previous job runs successfully. And prints build number variable

## Practice after Training 2 Jenkins

- Install the following plugins:
    - [Folders]()
    - [Workspace cleanup](https://plugins.jenkins.io/ws-cleanup)
    - [Build timeout](https://plugins.jenkins.io/build-timeout)
    - [Git](https://plugins.jenkins.io/git/)
    - [Maven integration](https://plugins.jenkins.io/maven-plugin/)
    - [Artifactory](https://plugins.jenkins.io/artifactory/)
    - [Credentials Binding](https://plugins.jenkins.io/credentials-binding/)
- __(Job A)__ Create Jenkins job that clones PetClinic and runs unit tests.
- Create three jobs:
    * __(Job B)__ Build this job and push artifact into Artifactory using Maven (The same artifactory as you used before).
    * __(Job C)__ Build this job and push artifact into Artifactory using curl.
        * <details><summary>Optional task</summary><br>Do the same with  the <a href="https://plugins.jenkins.io/http_request/">HTTP Request</a> plugin<br><br></details>
    - __(Job D)__ Build this job and push artifact into Artifactory using Jenkins plugin.
- <details><summary>Optional task</summary><br>Create a  "training_2" folder and move jobs A,B,C,D inside <br>Create a user "builder" and allow them to Read, Build, Cancel jobs inside the folder<br> Required plugins are <a href="https://plugins.jenkins.io/cloudbees-folder">Folders</a> and <a href="https://plugins.jenkins.io/matrix-auth/">Matrix Authorization Strategy</a> </details>

## Practice after Training 3 Jenkins

- Clone Petclinic to your _master_ branch 
- In your repo create three branches: qa, stage, dev. You will need them to work in different environments
- In each created branch update artifactid in pom.xml with branch name
- Create parameterized __Job E__ that builds Petclinic project from branches: _qa, stage, dev_ that should be used as parameters.
    - <details><summary>Optional task</summary><br>Do the same with the <a href="https://plugins.jenkins.io/git-parameter/" >Git Parameter </a> plugin <br><br> </details>
- Create Jenkins agent and update jobs A, B, C and D created previously to run on this Jenkins agent.
    - <details><summary>Optional task</summary><br>Try another option to connect an agent to the master (either SSH or JNLP) <br><br> <details><summary>Very optional task</summary><br><details><summary>We're serious, it's really very optional</summary><br> Create a dynamic agent (either for AWS or Vagrant+VirtualBox)  <br><br> </details> </details> </details>



## Practice after Training 4 Jenkins

- Create __Job F__ as declarative pipeline that contains the steps from __Job A__ and __Job D__. Use Petclinic source from _master_ branch of your repo.
- Create _Jenkinsfile_ from __Job F__ pipeline and push it to _master_ branch in your repo.
- Update __Job F__ to use Jenkinsfile from your repo.
- Update __Job F__ to poll SCM every 5 minutes to run job if changes appers. Make test commit to _master_ branch and check if __Job F__ started automatically.
- Create __Job G__ as multi-branch pipeline based on __Job F__.

## Demo Session Requirements
- Show the output and configuration of all created jobs (A,B,C,D,E,F).
    * start with showing each job's configuration;
    * show the last successful output;
    * show that __Job E__ is parametrized;
    * show that jobs A, B, C and D run on a Jenkins agent;
    * make a test commit to 'master' branch of your SCM and show that __Job F__ starts automatically (change timer to 1 minute for the demo).
    * make a test commit to branch 'dev' to show that __Job G__ runs as a multi-branch pipeline and builds 'dev' branch.




