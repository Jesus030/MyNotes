class CollectionsController < ApplicationController
  before_action :set_collection, only: %i[ show edit update destroy ]

  # GET /collections or /collections.json
  def index
    @collections = Collection.all
    
  end
  def add
    @collections = Collection.all
    @notes = Note.all
  end

  def add_note
    @collection = Collection.find(params[:id])
    @note = Note.find(params[:note_id])
    @collection.notes << @note
    
    redirect_to edit_collection_path(@collection)
    end

    def remove_from_collection
      @collection = Collection.find(params[:id])
      @note = Note.find(params[:note_id])
      @collection.notes.delete(@note)
      
      redirect_to edit_collection_path(@collection)
    end    

  # GET /collections/1 or /collections/1.json
  def show
   
    @notes = Note.all
  end

  # GET /collections/new
  def new
    @collection = Collection.new
  end

  # GET /collections/1/edit
  def edit
    @collections = Collection.all
    @notes = Note.all
  end

  # POST /collections or /collections.json
  def create
    @collection = Collection.new(collection_params)

    respond_to do |format|
      if @collection.save
        format.html { redirect_to collection_url(@collection), notice: "Collection was successfully created." }
        format.json { render :show, status: :created, location: @collection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collections/1 or /collections/1.json
  def update
    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to collection_url(@collection), notice: "Collection was successfully updated." }
        format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1 or /collections/1.json
  def destroy
    @coleccion = Coleccion.find(params[:id])
    @coleccion.notas.destroy_all 
    @coleccion.destroy


    respond_to do |format|
      format.html { redirect_to collections_url, notice: "Collection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collection_params
      params.require(:collection).permit(:user_id, :title, :topic, :notes)
    end

    def add_note_collection_path(collection, note_id)
      "/collections/#{collection.id}/add_note/#{note_id}"
    end

end
