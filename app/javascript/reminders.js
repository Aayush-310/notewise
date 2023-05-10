document.addEventListener("DOMContentLoaded", function () {
  const reminders = document.querySelectorAll(".reminder");

  reminders.forEach(function (reminder) {
    const time = reminder.dataset.reminderTime;
    const noteId = reminder.dataset.noteId;

    const now = new Date();
    const reminderTime = new Date(time);

    if (reminderTime > now) {
      const timeDiff = reminderTime.getTime() - now.getTime();

      setTimeout(function () {
        alert(`Reminder for Note #${noteId}: ${reminderTime.toLocaleString()}`);
      }, timeDiff);
    }
  });
});
