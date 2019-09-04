module Api
  module V1
    class PathsController < ApplicationController

      # before_action :set_image, only: [:edit, :update, :show, :destroy]

      def index
        path_array = params[:path].split('/')

        first_record = Folder.find_by(name: path_array.shift)
        last_record = get_path_record(first_record, path_array)

        response = { folder: last_record }
        response.merge!({ images: last_record.images }) if last_record.present?

        render json: response
      end

      private

      # method for recursively loading children records
      def get_path_record(record, path_array)
        return record if path_array.empty?

        child_record = record.children.find_by(name: path_array.shift)
        get_path_record(child_record, path_array)
      end

      def set_image
        @image = Image.find(params[:path])
      end

      # def image_params
      #   params.require(:image).permit(:name, :file)
      # end
    end

  end

end