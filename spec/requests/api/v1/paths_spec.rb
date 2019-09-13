# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Paths', type: :request do

  describe 'GET /api/v1/path/*path' do

    before do
      @folder1 = Folder.create(name: 'folder1')
      @folder2 = Folder.create(name: 'folder2', parent: @folder1)
      @folder3 = Folder.create(name: 'folder3', parent: @folder2)

      @image1 = Image.create(name: 'image1')
      @image2 = Image.create(name: 'image2', folder: @folder1)
      @image3 = Image.create(name: 'image3', folder: @folder2)
      @image4 = Image.create(name: 'image4', folder: @folder2)
    end

    context 'root level folder' do
      before do
        get '/api/v1/path/folder1'
      end

      let(:root_images) { Image.where(folder: @folder1) }

      it 'returns folder json' do
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)['folder']['name']).to eq(@folder1.name)
      end

      it 'returns images json' do
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)['images'].count).to equal(root_images.count)
      end
    end

    context 'root level image' do
      before do
        get '/api/v1/path/image1'
      end

      it 'returns image json' do
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)['image']['name']).to eq(@image1.name)
      end
    end

    context '3rd level folder' do
      before do
        get '/api/v1/path/folder1/folder2/folder3'
      end

      let(:l3_images) { Image.where(folder: @folder3) }

      it 'returns folder json' do
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)['folder']['name']).to eq(@folder3.name)
      end

      it 'returns images json' do
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)['images'].count).to equal(l3_images.count)
      end

    end

    context '3rd level image' do
      before do
        get '/api/v1/path/folder1/folder2/image3'
      end

      it 'returns image json' do
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)['image']['name']).to eq(@image3.name)
      end
    end

    context 'cannot find resource' do
      it 'returns empty json ' do
        get "/api/v1/path/folder1/folder2/nonexistentfolder"
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)).to be_empty
      end
    end
  end
end