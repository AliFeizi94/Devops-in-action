```
docker run -d -p 8080:8080 -p 50000:50000 --name jenkins -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts    
docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword 
```
