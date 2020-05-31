# Tasks for Demo 2

- [Practice after Training 1 Build&Publish](#Practice-after-Training-1-Build&Publish)
- [Practice after Training 2 Build&Publish](#Practice-after-Training-2-Build&Publish)
- [Demo Session Requirements](#Demo-Session-Requirements)

Below you will find a list of tasks to play with after each lecture as well as the list of requirements for the demo.

## Practice after Training 1 Build&Publish

- Install Java 8 and Maven on your local machine.
- Build a sample Maven project: https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html.
- Use the following parameters for building this artifact:  -DgroupId=com.epam_labs.$lastname -DartifactId=LessonOne.
- Run compiled artifact to check if it works.
- Update the version of the artifact to '2.0-RELEASE'.
- Configure Maven to upload artifacts to Artifactory.
- Upload created artifact (jar) into Artifactory.


## Practice after Training 2 Build&Publish

- Work in folder DEMO2 of your repo.
- Clone PetClinic project repo: https://github.com/olko123/spring-petclinic.
- Set up MySQL (anywhere).
- Update application properties to init a database and set up its configurations.
- Update Maven settings to use MySQL profile instead of hsqldb.
- Update group id to com.epam_labs.$lastname and artifact Id to LessonTwoPetClinic.
- Deploy PetClinic jar to Artifactory.
- Check if it is running.

## Demo Session Requirements

- Show that Pet Clinic is build based on MySQL and that Artifact is uploaded to Artifactory
