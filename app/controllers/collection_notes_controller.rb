class CollectionNotesController < ApplicationController
  before_action :set_collection_note, only: %i[ show edit update destroy ]
  before_filter :authenticate_user!
  # GET /collection_notes or /collection_notes.json
  def index
    @collection_notes = CollectionNote.all
    @collection_notes = CollectionNote.where('user_id' => current_user.id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @Collection_notes }
    end
  end

  # GET /collection_notes/1 or /collection_notes/1.json
  def show
    @Collection_note = CollectionNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @Collection_note }
    end
  end

  # GET /collection_notes/new
  def new
    @collection_note = CollectionNote.new
  end

  # GET /collection_notes/1/edit
  def edit
    @Collection_note = CollectionNote.find(params[:id])
  end

  # POST /collection_notes or /collection_notes.json
  def create
    @collection_note = CollectionNote.new(collection_note_params)

    respond_to do |format|
      if @collection_note.save
        format.html { redirect_to collection_note_url(@collection_note), notice: "Collection note was successfully created." }
        format.json { render :show, status: :created, location: @collection_note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collection_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collection_notes/1 or /collection_notes/1.json
  def update
    respond_to do |format|
      if @collection_note.update(collection_note_params)
        format.html { redirect_to collection_note_url(@collection_note), notice: "Collection note was successfully updated." }
        format.json { render :show, status: :ok, location: @collection_note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @collection_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collection_notes/1 or /collection_notes/1.json
  def destroy
    @collection_note.destroy

    respond_to do |format|
      format.html { redirect_to collection_notes_url, notice: "Collection note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection_note
      @collection_note = CollectionNote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collection_note_params
      params.fetch(:collection_note, {})
    end
end