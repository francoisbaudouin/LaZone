# AREA aka LaZone
## _Epitech Tek3 Project_
The project "Area", allow you to have an environement automatic and linked.
Some services will be linked between each other.

To have more information: https://alluring-bayberry-f8d.notion.site/LaZone-dff705753e1045cca387ecfd20736632
## PROJECT INITIALISATION
At the root of the repository, you need to create "db_password.txt" and "db_root_password" that contains this paramater:
```txt
PUT YOUR PASSWORD HERE
```

## PREREQUISITE
 - [DOCKER](https://docs.docker.com/engine/install/ubuntu/)
 - [FLUTTER](https://docs.flutter.dev/get-started/install/linux)

## BUILD PROJECT
```sh
docker-compose up --build
```

_____________________________________
# API


##### USER:
- get("/users/"); -> get all users

- get("/users/:id") -> get user by id

- get("/users/:id/tokens") -> get user by id and retrieve his tokens

- get("/users/:id/tokens/:serviceName") -> get user by id and retrieve all his tokens related to the specified service

##### AREAS:
- et("/") -> get all areas

- get("/:id") -> get area by id

- get("/enabled") -> get all enabled areas 

- get("/:id/user") -> get the user related to the specified area

##### TOKENS:
- get("/") -> get all tokens

- get("/user/:userId") -> get tokens of specified user

- get("/service/:serviceName") -> get tokens of specified serviceName

##### ACTIONS:
- get("/") -> get all actions

- get("/:id") -> get action by id

- get("/areas") -> get all areas that have actions

- get(":id/areas") -> get all areas that have specified action

- get(":id/relatedService") -> get the related service of the specified action

##### REACTIONS:
- get("/") -> get all reaction

- get("/:id") -> get reaction by id

- get("/areas") -> get all areas that have reaction

- get(":id/areas") -> get all areas that have specified reaction

- get(":id/relatedService") -> get the related service of the specified reaction

##### SERVICES:
- get("/") -> get all services

- get("/:name") -> get service by name

- get("/:name/actions") -> get all actions of specified service

- get("/:name/reactions") -> get all reactions of specified service

- get("/:name/tokens") -> get all tokens related to the specified service