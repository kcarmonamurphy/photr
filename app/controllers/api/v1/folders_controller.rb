module Api
  module V1
    class FoldersController < ApplicationController
      include JSONAPI::ActsAsResourceController

      def upload_image
        folder = Folder.find(params[:id])

        filename = params[:file].original_filename

        image = Image.create(name: filename, folder: folder)
        file = image.file.attach(params[:file])

        # serializer = JSONAPI::ResourceSerializer.new(ImageResource)
        # render json: serializer.serialize_to_hash(ImageResource.new(file, nil))
      end

    end
  end
end