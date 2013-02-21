class PicturesController < ApplicationController
  # GET /pictures
  # GET /pictures.json
  before_filter :load_folder
  def index
    @pictures = @folder.pictures.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = @folder.pictures.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @picture = @folder.pictures.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    @picture = @folder.pictures.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    binding.pry
    @picture = @folder.pictures.new(params[:picture])

    respond_to do |format|
      if @picture.save
        format.html { redirect_to folder_picture_path(@folder,@picture), notice: 'Picture was successfully created.' }
        format.json { render json: @picture, status: :created, location: @picture }
      else
        format.html { render action: "new" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update
    @picture = @folder.pictures.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = @folder.pictures.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to folder_pictures_path }
      format.json { head :no_content }
    end
  end
  protected
  def load_folder
    @folder=Folder.find(params[:folder_id])
  end

end
