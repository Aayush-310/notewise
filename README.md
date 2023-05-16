Notewise
Notewise is a web application that allows users to create and organize notes. It is built using Ruby on Rails and PostgreSQL.

Installation
To run this application, you will need to have Ruby and PostgreSQL installed on your machine. You can download Ruby from the official website: https://www.ruby-lang.org/en/downloads/ and PostgreSQL from: https://www.postgresql.org/download/

Once you have Ruby and PostgreSQL installed, you can clone this repository to your local machine using the following command:

Copy codegit clone https://github.com/Aayush-310/notewise.git
After cloning the repository, navigate to the root directory of the project and install the required dependencies using the following command:

Copy codebundle install
Next, you will need to create the database and run the migrations. To do this, run the following commands:

Copy coderails db:create
rails db:migrate
To start the application, navigate to the root directory of the project and run the following command:

Copy coderails s
This will start the Rails development server and the application will be accessible at http://localhost:3000.

Usage
To create a new note, click on the "New Note" button on the home page and fill in the note details. Once the note is created, it will be displayed on the home page.

To view a note, simply click on the note title on the home page. This will take you to a page where you can view the note details and make any necessary edits.

The application also uses Sidekiq for background processing. To start Sidekiq as a service in the server, run the following commands:

Copy codesudo apt install redis-server
sudo service redis-server start
sudo service redis-server stop
To configure Redis as the pub-sub backend, follow these steps:

Make sure Redis is installed and running on your system.

Add the redis gem to your Gemfile:
gem 'redis'
.

Install the gem by running
bundle install
.

Create a new file
config/initializers/redis.rb
and add the following code:

Copy codeRedis.current = Redis.new(url: ENV['REDIS_URL'])
Open the
config/cable.yml
file and uncomment the redis section. Update it to use the Redis URL:
Copy codedevelopment:
adapter: redis
url: <%= ENV['REDIS_URL'] %>
Set the
REDIS_URL
environment variable to point to your Redis server.

Generate a new channel by running the command
rails generate channel Reminder
.

Modify the generated channel file
app/channels/reminder_channel.rb
to specify the stream you want to subscribe to.

Create a JavaScript file
reminder_channel.js
in the
app/javascript/channels
directory and add the following code:

Copy codeimport consumer from './consumer';

consumer.subscriptions.create('ReminderChannel', {
received(data) {
console.log(data); // Output received data to the browser console
}
});
Include the Action Cable JavaScript library in your application's layout file by adding the following line inside the

<head>
 section:
Copy code<%= action_cable_meta_tag %>
Start the Action Cable server by running the command 
bin/cable
 or 
rails cable
.
Sending Emails
To send emails, change the email and password field in 
development.rb
 file after generating an app password for the website.

Contributing
If you would like to contribute to the project, please follow these steps:

Fork the repository to your own GitHub account.

Clone the repository to your local machine:

Copy codegit clone https://github.com/your-username/notewise.git
Create a new branch for your changes:
Copy codegit checkout -b my-new-feature
Make your changes and commit them:
Copy codegit commit -am 'Add some feature'
Push your changes to your fork:
Copy codegit push origin my-new-feature
Create a pull request on the original repository.
License
This project is licensed under the MIT License. See the
LICENSE
file for details.

Notewise
Notewise is a web application that allows users to create and organize notes. It is built using Ruby on Rails and PostgreSQL.

Installation
To run this application, you will need to have Ruby and PostgreSQL installed on your machine. You can download Ruby from the official website: https://www.ruby-lang.org/en/downloads/ and PostgreSQL from: https://www.postgresql.org/download/

Once you have Ruby and PostgreSQL installed, you can clone this repository to your local machine using the following command:

Copy codegit clone https://github.com/Aayush-310/notewise.git
After cloning the repository, navigate to the root directory of the project and install the required dependencies using the following command:

Copy codebundle install
Next, you will need to create the database and run the migrations. To do this, run the following commands:

Copy coderails db:create
rails db:migrate
To start the application, navigate to the root directory of the project and run the following command:

Copy coderails s
This will start the Rails development server and the application will be accessible at http://localhost:3000.

Usage
To create a new note, click on the "New Note" button on the home page and fill in the note details. Once the note is created, it will be displayed on the home page.

To view a note, simply click on the note title on the home page. This will take you to a page where you can view the note details and make any necessary edits.

The application also uses Sidekiq for background processing. To start Sidekiq as a service in the server, run the following commands:

Copy codesudo apt install redis-server
sudo service redis-server start
sudo service redis-server stop
To configure Redis as the pub-sub backend, follow these steps:

Make sure Redis is installed and running on your system.

Add the redis gem to your Gemfile:
gem 'redis'
.

Install the gem by running
bundle install
.

Create a new file
config/initializers/redis.rb
and add the following code:

Copy codeRedis.current = Redis.new(url: ENV['REDIS_URL'])
Open the
config/cable.yml
file and uncomment the redis section. Update it to use the Redis URL:
Copy codedevelopment:
adapter: redis
url: <%= ENV['REDIS_URL'] %>
Set the
REDIS_URL
environment variable to point to your Redis server.

Generate a new channel by running the command
rails generate channel Reminder
.

Modify the generated channel file
app/channels/reminder_channel.rb
to specify the stream you want to subscribe to.

Create a JavaScript file
reminder_channel.js
in the
app/javascript/channels
directory and add the following code:

Copy codeimport consumer from './consumer';

consumer.subscriptions.create('ReminderChannel', {
received(data) {
console.log(data); // Output received data to the browser console
}
});
Include the Action Cable JavaScript library in your application's layout file by adding the following line inside the

<head>
 section:
Copy code<%= action_cable_meta_tag %>
Start the Action Cable server by running the command 
bin/cable
 or 
rails cable
.
Sending Emails
To send emails, change the email and password field in 
development.rb
 file after generating an app password for the website.

Contributing
If you would like to contribute to the project, please follow these steps:

Fork the repository to your own GitHub account.

Clone the repository to your local machine:

Copy codegit clone https://github.com/your-username/notewise.git
Create a new branch for your changes:
Copy codegit checkout -b my-new-feature
Make your changes and commit them:
Copy codegit commit -am 'Add some feature'
Push your changes to your fork:
Copy codegit push origin my-new-feature
Create a pull request on the original repository.
License
This project is licensed under the MIT License. See the
LICENSE
file for details.
![Screenshot](/images/homepage.png)

![Screenshot](/images/edit_user.png)
![Screenshot](/images/edit_note.png)
![Screenshot](/images/new_note.png)
![Screenshot](/images/basic-page.png)
![Screenshot](/images/login.png)
![Screenshot](/images/signup page.png)
