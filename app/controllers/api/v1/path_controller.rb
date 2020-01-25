module Api
  module V1
    class PathController < ApplicationController
      # before_action :set_image, only: [:edit, :update, :show, :destroy]

      def index
        path = params[:path] || ""
        path_array = path.split('/')

        path_array.unshift(ROOT_FOLDER)

        record = get_record(path_array)

        if record.is_a? Folder
          render json: JSONAPI::ResourceSerializer.new(FolderResource)
            .serialize_to_hash(FolderResource.new(record, nil))
        elsif record.is_a? Image
          render json: JSONAPI::ResourceSerializer.new(ImageResource)
            .serialize_to_hash(ImageResource.new(record, nil))
        else
          render json: {
            errors: [
              {
                status: '404',
                title: 'Record not found',
                detail: 'Path doesn\'t exist'
              }
            ]
          }, :status => 404
        end
      end

      private

      def get_record(path_array)
        first_segment = path_array.shift

        first_folder = Folder.find_by(name: first_segment)
        if first_folder.present?
          get_last_record(first_folder, path_array)
        else
          Image.find_by(name: first_segment, folder: nil)
        end
      end

      # method for recursively loading children records
      def get_last_record(record, path_array)
        return record if path_array.empty?

        segment = path_array.shift

        # get either the child folder or an image
        folder = record.children.find_by(name: segment)
        if folder.present?
          get_last_record(folder, path_array)
        else
          Image.find_by(name: segment, folder: record)
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