# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Paths', type: :request do

  describe 'GET /api/v1/*path' do

    before do
      @folder1 = Folder.create(name: 'folder1')
      @folder2 = Folder.create(name: 'folder2', parent: @folder1)
      @image = Image.create(name: 'image', folder: @folder2)
      @image2 = Image.create(name: 'image2', folder: @folder2)
    end
    
    it 'returns image json' do
      get '/api/v1/folder1/folder2/image'
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to have_key('image')
    end

    it 'returns folder and image json' do
      get "/api/v1/folder1/folder2"
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to have_key('folder')
    end

    it 'returns empty json ' do
      get "/api/v1/folder1/folder2/nonexistentfolder"
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to be_empty
    end
  end
end