// app/assets/javascripts/notifications.js

import consumer from "./consumer";

consumer.subscriptions.create("ReminderChannel", {
  received(data) {
    // Handle the received notification data
    console.log(data);
    // Add your custom logic to display the notification in the page
    // For example, you can update a DOM element to show the notification content
    const notificationElement = document.getElementById("notification");
    notificationElement.textContent = data.content;
  },
});
