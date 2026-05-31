# Hospital Management System

A Java web application for managing hospital users, doctors, appointments, and admin workflows. The project is built with Spring MVC, Hibernate, JSP, Maven, and PostgreSQL.

## Features

- User registration and login
- Admin login and dashboard
- Doctor login and dashboard
- Add, edit, and view doctors
- Manage specialists
- Book appointments
- View appointment details
- Doctor profile editing
- Patient management views

## Tech Stack

- Java
- Spring MVC
- Hibernate ORM
- PostgreSQL
- JSP and JSTL
- Maven
- Apache Tomcat

## Project Structure

```text
src/main/java/hospital
  controller/   Spring MVC controllers
  dao/          Data access layer
  entity/       Hibernate entity classes
  service/      Service layer

src/main/webapp/WEB-INF
  views/        JSP pages
  resources/    CSS, JavaScript, and images
  spring-servlet.xml
  web.xml
```

## Requirements

- JDK 8 or later
- Maven
- PostgreSQL
- Apache Tomcat 8 or later
- Eclipse IDE or any Java IDE

## Database Setup

Create a PostgreSQL database:

```sql
CREATE DATABASE hospital_management;
```

Update the database username and password in:

```text
src/main/webapp/WEB-INF/spring-servlet.xml
```

Current datasource configuration:

```xml
jdbc:postgresql://localhost:5432/hospital_management
```

Hibernate is configured with:

```xml
hibernate.hbm2ddl.auto=update
```

So the required tables are created or updated automatically when the application runs.

## How to Run

1. Clone the repository:

   ```bash
   git clone https://github.com/sachin008p/Hospital-management.git
   ```

2. Open the project in Eclipse.

3. Configure PostgreSQL database credentials in `spring-servlet.xml`.

4. Build the project:

   ```bash
   mvn clean package
   ```

5. Deploy the generated WAR file from the `target` folder to Apache Tomcat.

6. Open the application in browser:

   ```text
   http://localhost:8080/project-lecture/
   ```

## Author

Sachin Kadam

