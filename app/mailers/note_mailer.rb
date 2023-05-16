class NoteMailer < ApplicationMailer
  def share_note_email(note, recipient_email)
    @note = note
    @recipient_email = recipient_email
    attachments.attach(note.attachments.blob) if note.attachments.attached?
    mail(to: recipient_email, subject: 'Shared Note')
  end
  
end
