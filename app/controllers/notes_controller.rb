class NotesController < ApplicationController
  
  before_action :set_note, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  
require 'openai'

  # GET /notes or /notes.json
  def index
    @notes = current_user.notes.all
  end

  # GET /notes/1 or /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = current_user.notes.build
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes or /notes.json
  def create
    @note = Note.new(note_params)
    tags = Array(params[:note][:tags]).map(&:strip).reject(&:empty?)
    @note.tags = tags
  
    # Check if reminder is provided
    if params[:note][:reminder].present?
      # Parse the provided reminder datetime string
      reminder_datetime = DateTime.parse(params[:note][:reminder])
  
      # Set the reminder for the note
      @note.reminder = reminder_datetime
    end
  
    respond_to do |format|
      if @note.save
        # Enqueue the reminder job if a reminder is set
        if @note.reminder.present?
          ReminderJob.perform_later(@note.id)
        end
  
        format.html { redirect_to note_url(@note), notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /notes/1 or /notes/1.json
  def update   
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to note_url(@note), notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    if params[:search].present?
      @notes = current_user.notes.search(params[:search])
    else
      @notes = []
    end
  end

# app/controllers/notes_controller.rb


def share
  @note = Note.find(params[:id])
  @recipient_email = params[:recipient_email]

  if @note && @recipient_email.present?
    NoteMailer.share_note_email(@note, @recipient_email).deliver_now
    flash[:notice] = 'Note shared successfully!'
  else
    flash[:alert] = 'Unable to share note. Please provide a valid recipient email.'
  end

  redirect_to @note
end


# app/controllers/notes_controller.rb

def summarize
  @note = Note.find(params[:id])
  summarizer = NoteSummarizer.new
  @summary = summarizer.generate_summary(@note.title, @note.body)

  respond_to do |format|
    format.js
  end
end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:title, :body, :user_id, :search,:reminder,:recipient_email ,tags: [], attachments: [])
    end
end
