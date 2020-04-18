module Api
  module V1
    class ImagesController < ApplicationController
      def upload_attachment
        # binding.pry
        image = Image.find(params[:id])

        file = image.file.attach(params[:file])

        # serializer = JSONAPI::ResourceSerializer.new(ImageResource)
        # render json: serializer.serialize_to_hash(ImageResource.new(file, nil))
      end
    end
  end
end