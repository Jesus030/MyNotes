class NotesController < ApplicationController
  before_action :set_note, only: %i[ show edit update destroy ]

  # GET /notes or /notes.json
  def index
    @notes = Note.all
   
  end

  def own_notes
    @notes = Note.all
  end

  def friends_notes
    @notes = Note.all
  end

  
  # GET /notes/1 or /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
    #@note.user_id = @user.id
  end

  # GET /notes/1/edit
  def edit
    @users=User.all
  end

  def ver_notas
    @topic = params[:topic]  # lee el parámetro 'tema' pasado por el usuario
    @notes = Note.where(topic: @topic)  # filtra las notas por el tema especificado

  end

  def ver_notas_title
    @title = params[:title]  # lee el parámetro 'tema' pasado por el usuario
    @notes = Note.where(title: @title)  # filtra las notas por el tema especificado

  end
def share_user  
  @share_notes = ShareNote.new
  @share_notes.save
  @user = User.find(params[:user_id])
  @note = Note.find(params[:note_id])
  @share_notes.users_id << @user
  @share_notes.notes_id << @note
  
  redirect_to edit_note_path(@note)
end
  def  remove_from_sharing 
  
  @user = User.find(params[:user_id])
  @note = Note.find(params[:note_id])
  @share_notes.notes_id.delete(@note)
  @share_notes.users_id.delete(@user)
    
    redirect_to edit_note_path(@note)
  end    


  # POST /notes or /notes.json
  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
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
        @note.image_will_change!
        format.html { redirect_to note_url(@note), notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        @note.image_will_change!
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:user_id, :title, :topic, :image, :description, :share_id)
    end
end
