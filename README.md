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

![Screenshot](/images/homepage.png)

![Screenshot](/images/edit_user.png)
![Screenshot](/images/edit_note.png)
![Screenshot](/images/new_note.png)

sidekiq has been used. So it needs to be started as a service in the server. sudo apt install redis-server
sudo service redis-server start
sudo service redis-server stop

Configure Redis as the pub-sub backend:

Make sure Redis is installed and running on your system.

Add the redis gem to your Gemfile: gem 'redis'.

Install the gem by running bundle install.

Configure Redis in your Rails application by creating a Redis initializer file:

Create a new file config/initializers/redis.rb.
Add the following code to the file:
ruby
Copy code

# config/initializers/redis.rb

Redis.current = Redis.new(url: ENV['REDIS_URL'])
Configure Action Cable:

Open the config/cable.yml file.

Uncomment the redis section and update it to use the Redis URL:

yaml
Copy code

# config/cable.yml

development:
adapter: redis
url: <%= ENV['REDIS_URL'] %>

# ... rest of the configuration ...

Set the REDIS_URL environment variable to point to your Redis server. You can either set it in your shell environment or use a tool like dotenv to manage environment variables in a .env file.

Generate a new channel:

Run the following command in your terminal: rails generate channel Reminder.
This will create a reminder_channel.rb file inside the app/channels directory.
Modify the generated channel file:

Open the app/channels/reminder_channel.rb file.

Modify the subscribed method to specify the stream you want to subscribe to. For example:

ruby
Copy code

# app/channels/reminder_channel.rb

class ReminderChannel < ApplicationCable::Channel
def subscribed
stream_from 'reminder_channel'
end

# ... rest of the code ...

end
Create a JavaScript file for the channel:

Create a new JavaScript file reminder_channel.js in the app/javascript/channels directory.

Add the following code to the file:

javascript
Copy code
// app/javascript/channels/reminder_channel.js
import consumer from './consumer';

consumer.subscriptions.create('ReminderChannel', {
received(data) {
console.log(data); // Output received data to the browser console
}
});
Include the Action Cable JavaScript library:

Open your application's layout file (e.g., app/views/layouts/application.html.erb).

Include the Action Cable JavaScript library by adding the following line inside the <head> section:

html
Copy code
<%= action_cable_meta_tag %>
Start the Action Cable server:

In your terminal, start the Action Cable server by running the command bin/cable or rails cable.
This will start the Action Cable server, which will handle WebSocket connections and pub-sub functionality.
That's it! You've now set up Action Cable in your Rails application with Redis as the pub-sub backend. You can now use the ReminderChannel to send and receive messages between the server and clients. Remember to adjust the code according to your specific application's needs and business logic.

Rails g channel Reminder

to send emails change the email and password field in development.rb file after geenrating a app password for the website.
