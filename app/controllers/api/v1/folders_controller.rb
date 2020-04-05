module Api
  module V1
    class FoldersController < ApplicationController
      include JSONAPI::ActsAsResourceController
      include ErrorSerializer

      def upload_image
        folder = Folder.find(params[:id])

        filename = params[:file].original_filename

        image = Image.new(name: filename, folder: folder)
        if image.save
          file = image.file.attach(params[:file])
          render json: serialize_image(image), status: 201
        else
          render json: ErrorSerializer.serialize(image.errors), status: 409
        end
      end

      def serialize_image(image)
        JSONAPI::ResourceSerializer
          .new(ImageResource)
          .serialize_to_hash(ImageResource.new(image, nil))
      end
    end
  end
end
