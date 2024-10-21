# Full Stack Angular and Spring Boot Application with Stripe Payment

This project is a full-stack web application built using **Angular** for the frontend and **Spring Boot** for the backend. It also integrates **Stripe** for handling online payments.

## Project Overview

- **Frontend**: Angular 10+
- **Backend**: Spring Boot 2.5+
- **Database**: MySQL
- **Payment Integration**: Stripe
- **Authentication**: Okta OAuth 2.0

## Prerequisites

Before you begin, ensure you have the following installed on your machine:

- **Java 17** or later
- **Maven** (for managing Spring Boot dependencies)
- **Node.js** (for running Angular)
- **Angular CLI** (globally installed)
- **Docker** (for running MySQL in a container)
- **Stripe Account** (for handling payments)
- **Okta Developer Account** (for OAuth 2.0 authentication)

---

## Getting Started

### 1. Clone the repository

Clone the project to your local machine using the following command:

```bash
git clone https://github.com/zihorotto/O-Shop.git
```

Make a new project directory (e.g., `e-commerce`) and navigate to it:

```bash
cd e-commerce
```

### 2. Database Setup (MySQL)

You can run MySQL using Docker to simplify the setup process.

#### a. Start MySQL with Docker

To run the latest MySQL server using Docker, use the following command:

```bash
docker run --name mysql-ecommerce -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=ecommerce -p 3306:3306 -d mysql:latest
```

- `--name mysql-ecommerce`: Gives the name to the Docker container.
- `-e MYSQL_ROOT_PASSWORD=root`: Sets the password for the MySQL root user.
- `-e MYSQL_DATABASE=ecommerce`: Create a new database named ecommerce.
- `-p 3306:3306`: Maps local port 3306 to container port 3306.
- `-d mysql:latest`: Runs the latest MySQL image in the background.

#### b. Verify MySQL is Running

You can verify if MySQL is running by executing the following command:

```bash
docker ps
```

This command will list the running containers. Look for `mysql-ecommerce` in the list.

#### c. Connect to MySQL

You can connect to the MySQL database from your terminal using:

```bash
docker exec -it mysql-ecommerce mysql -u root -p
```

Enter the password you set earlier (in this case, `root`).

### 3. Backend Setup (Spring Boot)

#### a. Configure the application.properties

The backend uses **MySQL** as the default database. You need to configure the `application.properties` file with your MySQL database credentials.

1. Open the `src/main/resources/application.properties` file.
2. Update the following properties to match your local MySQL setup:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/ecommerce?useSSL=false&serverTimezone=UTC
spring.datasource.username=root
spring.datasource.password=root
```

Make sure your MySQL server is running, either through Docker or locally.

#### b. Install additional dependencies

To enable features like **pagination**, **product management**, **authentication**, and **Stripe integration**, the following dependencies must be added to the `pom.xml` file in the backend if they are not already present:

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-security</artifactId>
</dependency>

<dependency>
    <groupId>org.springframework.security.oauth.boot</groupId>
    <artifactId>spring-security-oauth2-client</artifactId>
</dependency>

<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-jpa</artifactId>
</dependency>

<dependency>
    <groupId>com.stripe</groupId>
    <artifactId>stripe-java</artifactId>
    <version>20.94.0</version>
</dependency>
```

#### c. Configure Stripe API keys

Stripe is used to handle payments in this project. You need to create a **Stripe account** and generate **API keys** (Publishable and Secret keys) from the Stripe dashboard.

1. Open the `application.properties` file and add your Stripe API keys:

```properties
stripe.api.key=your-stripe-secret-key
```

#### d. Configure Okta OAuth 2.0

To enable user authentication, you'll need to set up Okta OAuth 2.0. Follow these steps:

1. Go to the [Okta Developer Console](https://developer.okta.com).
2. Create a new **Web Application** and configure the following in your `application.properties`:

```properties
okta.oauth2.client-id=your-client-id
okta.oauth2.client-secret=your-client-secret
okta.oauth2.issuer=https://your-okta-domain.okta.com/oauth2/default
```

#### e. Build and run the backend

1. Navigate to the backend folder:

   ```bash
   cd backend
   ```

2. Build the project using Maven:

   ```bash
   mvn clean install
   ```

3. Start the Spring Boot application:

   ```bash
   mvn spring-boot:run
   ```

The backend will be running at [http://localhost:8443](http://localhost:8443).

---

### 4. Frontend Setup (Angular)

#### a. Install dependencies

Navigate to the frontend folder:

```bash
cd frontend
```

Install the Node.js dependencies required for the Angular project:

```bash
npm install
```

#### b. Install additional Angular packages

To handle features such as **pagination**, **HTTP requests**, and **Stripe payments**, you may need the following Angular libraries. Install them with:

```bash
npm install ngx-pagination
npm install @angular/common
npm install @stripe/stripe-js @stripe/angular-stripe-service
npm install @auth0/angular-jwt
```

These packages are essential for:

- **Pagination**: `ngx-pagination`
- **HTTP and REST API handling**: `@angular/common/http`
- **Stripe payments**: `@stripe/stripe-js`, `@stripe/angular-stripe-service`
- **JWT Authentication (if needed for Okta)**: `@auth0/angular-jwt`

#### c. Configure Stripe in the frontend

You need to provide the **Stripe publishable key** in the frontend configuration to handle payments. This key can be found in your Stripe dashboard under the API keys section.

1. Open the Angular environment configuration file (`src/environments/environment.ts`) and add your Stripe publishable key:

   ```typescript
   export const environment = {
     production: false,
     stripeKey: 'your-stripe-publishable-key'
   };
   ```

#### d. Run the Angular development server

Start the Angular development server:

```bash
ng serve
```

By default, the frontend will be running at [http://localhost:4200](http://localhost:4200).

---

### 5. Accessing the Application

Once both the backend and frontend are running:

- **Backend**: [http://localhost:8443](http://localhost:8443)
- **Frontend (User Interface)**: [http://localhost:4200](http://localhost:4200)

You can now interact with the application, including **product management**, **shopping**, **Stripe-based payments**, and **user authentication** via Okta.

### Note on Database

All data in the database has been created using scripts; however, feel free to populate it with any items you wish to sell.

---

## Features

- **Product Management**: Add, view, and manage products in the store.
- **Shopping Cart**: Add products to the cart and proceed to checkout.
- **Stripe Payment Integration**: Secure payment processing with Stripe.
- **REST API**: The Spring Boot backend provides a RESTful API for the frontend.
- **User Authentication**: Secure login using Okta OAuth 2.0.
- **Database Integration**: MySQL is used for storing and retrieving data.
- **Pagination**: Supports paginated display of product data.

---

## Stripe Payment Integration

This project uses **Stripe** for payment processing. When a user proceeds to checkout, the payment is handled using the **Stripe API**. You must set up your **Stripe account** and API keys as mentioned above.

- **Frontend**: The payment form is managed through the Stripe API using the publishable key. The user can enter their payment details, which are securely sent to Stripe.
- **Backend**: The backend handles the payment intent and communicates with Stripe using the secret key to charge the user's card.

### Payment Flow

1. The user selects products and proceeds to the checkout.
2. The frontend sends payment details to Stripe using the publishable key.
3. The backend creates a payment intent and processes the payment using the Stripe secret key.
4. On successful payment, the order is confirmed.

---

## Okta OAuth 2.0 Integration

This project uses **Okta OAuth 2.0** for user authentication. It allows users to log in securely using their Okta credentials.

### Authentication Flow

1. The user clicks on the login button.
2. The frontend redirects the user to the Okta login page.
3. After successful login, Okta redirects the user back to the application with an authentication token.
4. The token is used for secure API requests to the backend.

---

## Troubleshooting

- **Database Connection Errors**: Ensure your MySQL server is running and the credentials in `application.properties` are correct.
- **Docker Issues**: If you have trouble with Docker, make sure it’s installed and running properly.
- **Stripe Payment Errors**: Ensure your Stripe API keys are correct and properly configured both in the backend and frontend.
- **Frontend/Backend Communication**: If the frontend fails to communicate with the backend, make sure both services are running and the **CORS configuration** in the backend allows requests from `http://localhost:4200`.

---

## License

I created this project based on a Udemy course. Feel free to use and modify it according to your needs.
