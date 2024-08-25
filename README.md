# MyApp

MyApp is a simple web application built with [Mojolicious](https://mojolicious.org/), a real-time web framework for Perl. This app provides user registration and the ability to search for users by email, utilizing a MySQL database.

## Features

- **User Registration**: Allows users to register by providing their details.
- **Email Search**: Provides a search functionality to find users by their email address.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Perl](https://www.perl.org/)
- [Mojolicious](https://mojolicious.org/)
- [MySQL](https://www.mysql.com/)
- `DBI` and `DBD::mysql` Perl modules

## Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/rofhiwatshivhenga/Perl-Mojolicious.git
   cd Perl-Mojolicious

2. **Install Perl dependencies**:

    Make sure you have CPAN (Comprehensive Perl Archive Network) installed. Then, install the necessary Perl modules:

   ```bash
   cpan Mojolicious DBI DBD::mysql


3. **Set up MySQL Database**:

    Start your MySQL server.
    Create a new database and a user for the application:

   ```bash
   CREATE DATABASE user_registration;
   CREATE USER 'yourusername'@'localhost' IDENTIFIED BY 'yourpassword';
   GRANT ALL PRIVILEGES ON user_registration.* TO 'yourusername'@'localhost';
   FLUSH PRIVILEGES;

    Run the provided SQL script to set up the required tables:
   
    ```bash
   mysql -u yourusername -p user_registration < db/schema.sql

   
4. **Configure the Application**:

    Update the db helper in the MyApp.pm file to match your database credentials:

   ```bash
   $self->helper(db => sub {
    state $dbh = DBI->connect("dbi:mysql:dbname=user_registration", "yourusername", "yourpassword", {RaiseError => 1, AutoCommit => 1, mysql_enable_utf8 => 1});
});

   
5. **Start the application**:

   ```bash
   morbo script/my_app


Register a user:

Visit http://127.0.0.1:3000/register to create a new user.

Search for a user by email:

Go to http://127.0.0.1:3000/search and enter an email address to find a user.

Troubleshooting
DBD::mysql module installation issues: Ensure that MySQL client libraries are installed and accessible. You may need to install MySQL Connector/C if mysql_config is not found.
MySQL server connection issues: Verify that the MySQL server is running and accessible with the correct credentials.
Contributing
Feel free to submit a pull request or open an issue if you find any bugs or have suggestions for improvements.

License
This project is licensed under the MIT License. See the LICENSE file for details.