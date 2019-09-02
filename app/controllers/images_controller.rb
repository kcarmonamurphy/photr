class ImagesController < ApplicationController

  before_action :set_image, only: [:edit, :update, :show, :destroy]

  def new
    @image = Image.new
  end

  def create
    folder = Folder.first
    @image = Image.new(image_params.merge({ folder: folder }))
    if @image.save
      flash[:notice] = "image was created successfully"
      redirect_to image_path(@image)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @image.update(image_params)
      flash[:notice] = "image was successfully updated"
      redirect_to image_path(@image)
    else
      render :edit
    end
  end

  def index
    @images = Image.all
  end

  def destroy
    @image.destroy
    flash[:notice] = "image was deleted succcesfully"
    redirect_to images_path
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:name, :file)
  end

end