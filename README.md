Notewise
Notewise is a web application that allows users to create and organize notes. It is built using Ruby on Rails and PostgreSQL.

Installation
To run this application, you will need to have Ruby and PostgreSQL installed on your machine. You can download Ruby from the official website: https://www.ruby-lang.org/en/downloads/ and PostgreSQL from: https://www.postgresql.org/download/

Once you have Ruby and PostgreSQL installed, you can clone this repository to your local machine using the following command:
https://github.com/Aayush-310/notewise.git

After cloning the repository, navigate to the root directory of the project and install the required dependencies using the following command:

bundle install

Next, you will need to create the database and run the migrations. To do this, run the following commands:

rails db:create
rails db:migrate

Usage
To start the application, navigate to the root directory of the project and run the following command:
rails s

This will start the Rails development server and the application will be accessible at http://localhost:3000.

To create a new note, click on the "New Note" button on the home page and fill in the note details. Once the note is created, it will be displayed on the home page.

To view a note, simply click on the note title on the home page. This will take you to a page where you can view the note details and make any necessary edits.

![alt text](https://github.com/Aayush-310/notewise/blob/tags/images/Screenshot 2023-05-10 094242.png?raw=true)
