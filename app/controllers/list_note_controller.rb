class ListNoteController < ApplicationController
    before_filter :authenticate_user!

    # GET /listnote
    # GET /listnote.json
    def index
      @listnote = Listnote.all
      @mylistnote = Listnote.where('user_id' => current_user.id)
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @listnote }
      end
    end
  
    # GET /listnote/1
    # GET /listnote/1.json
    def show
      @Listnote = Listnote.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @Listnote }
      end
    end
  
    # GET /listnote/new
    # GET /listnote/new.json
    def new
      @Listnote = Listnote.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @Listnote }
      end
    end
  
    # GET /listnote/1/edit
    def edit
      @Listnote = Listnote.find(params[:id])
    end
  
    # POST /listnote
    # POST /listnote.json
    def create
      @Listnote = Listnote.new(params[:Listnote])
  
      respond_to do |format|
        if @Listnote.save
          format.html { redirect_to @Listnote, notice: 'Listnote was successfully created.' }
          format.json { render json: @Listnote, status: :created, location: @Listnote }
        else
          format.html { render action: "new" }
          format.json { render json: @Listnote.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /listnote/1
    # PUT /listnote/1.json
    def update
      @Listnote = Listnote.find(params[:id])
  
      respond_to do |format|
        if @Listnote.update_attributes(params[:Listnote])
          format.html { redirect_to @Listnote, notice: 'Listnote was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @Listnote.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /listnote/1
    # DELETE /listnote/1.json
    def destroy
      @Listnote = Listnote.find(params[:id])
      @Listnote.destroy
  
      respond_to do |format|
        format.html { redirect_to listnote_url }
        format.json { head :no_content }
      end
    end


end
