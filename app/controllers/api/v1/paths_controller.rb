module Api
  module V1
    class PathsController < ApplicationController

      # before_action :set_image, only: [:edit, :update, :show, :destroy]

      def index
        path_array = params[:path].split('/')

        records = path_array.map { |segment| Folder.find_by(name: segment) }
        render json: records
      end

      private

      def set_image
        @image = Image.find(params[:path])
      end

      # def image_params
      #   params.require(:image).permit(:name, :file)
      # end
    end

  end

end