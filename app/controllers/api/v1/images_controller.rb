module Api
  module V1
    class ImagesController < ApplicationController
      include ErrorSerializer

      def upload_attachment
        image = policy_scope(Image).find(params[:id])
        authorize image

        image.file.attach(params[:file])

        if image.file.attached?
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