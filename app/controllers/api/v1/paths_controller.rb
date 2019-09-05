module Api
  module V1
    class PathsController < ApplicationController

      # before_action :set_image, only: [:edit, :update, :show, :destroy]

      def index
        path_array = params[:path].split('/')

        first_record = Folder.find_by(name: path_array.shift)
        last_record = get_last_record(first_record, path_array)

        if last_record.is_a? Folder
          response = { folder: last_record, images: last_record.images }
        elsif last_record.is_a? Image
          response = { image: last_record }
        else
          response = {}
        end

        render json: response
      end

      private

      # method for recursively loading children records
      def get_last_record(record, path_array)
        return record if path_array.empty?

        segment = path_array.shift

        # get either the child folder or an image
        folder = record.children.find_by(name: segment)
        if folder.present?
          get_last_record(folder, path_array)
        else
          return Image.find_by(name: segment, folder: record)
        end
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