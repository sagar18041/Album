class FoldersController < ApplicationController
  # GET /folders
  # GET /folders.json

  def index
    #binding.pry
    if params[:search]
      @folders = current_user.folder.find_by_name(params[:search])
    else
      @folders = current_user.folder.all
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @folders }
    end
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
    @folder = current_user.folder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @folder }
    end
  end

  # GET /folders/new
  # GET /folders/new.json
  def new
    @folder = current_user.folder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @folder }
    end
  end

  # GET /folders/1/edit
  def edit
    @folder = current_user.folder.find(params[:id])
  end

  # POST /folders
  # POST /folders.json
  def create
    @folder = current_user.folder.new(params[:folder])

    respond_to do |format|
      if @folder.save
        format.html { redirect_to new_folder_picture_path(@folder), notice: 'Folder was successfully created.' }
        format.json { render json: @folder, status: :created, location: @folder }
      else
        format.html { render action: "new" }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /folders/1
  # PUT /folders/1.json
  def update
    @folder = current_user.folder.find(params[:id])

    respond_to do |format|
      if @folder.update_attributes(params[:folder])
        format.html { redirect_to folder_pictures_path(@folder), notice: 'Folder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @folder = current_user.folder.find(params[:id])
    @folder.destroy

    respond_to do |format|
      format.html { redirect_to folders_url }
      format.json { head :no_content }
    end
  end
end
