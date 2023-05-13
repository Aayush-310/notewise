# app/jobs/reminder_job.rb
class ReminderJob < ApplicationJob
    queue_as :default
  
    def perform
      notes = Note.where('reminder <= ?', DateTime.current)
  
      notes.each do |note|
        UserMailer.reminder_notification(note.user, note).deliver_now
      end
    end
  end
  