module Api
  module V1
    class PathController < ApplicationController
      skip_before_action :doorkeeper_authorize!

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

        root_folder = Folder.find_by(name: first_segment)

        get_last_record(root_folder, path_array)
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
    end

  end

end