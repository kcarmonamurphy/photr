# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Path', type: :request do

  ROOT_FOLDER = 'root_folder'

  shared_examples "a successful api call" do
    it 'should return a 200 response' do
      expect(@response).to have_http_status(200)
    end
  end

  shared_examples "an unsuccessful api call" do
    it 'should return a 404 response' do
      expect(response).to have_http_status(404)
    end
  end
  
  describe 'GET /api/v1/path/*path' do

    before do
      @root_folder = Folder.create(name: ROOT_FOLDER)

      @folder1 = Folder.create(name: 'folder1', parent: @root_folder)
      @folder2 = Folder.create(name: 'folder2', parent: @folder1)
      @folder3 = Folder.create(name: 'folder3', parent: @folder2)

      @image1 = Image.create(name: 'image1', folder: @root_folder)
      @image2 = Image.create(name: 'image2', folder: @folder1)
      @image3 = Image.create(name: 'image3', folder: @folder2)
      @image4 = Image.create(name: 'image4', folder: @folder3)
    end

    context 'root level folder' do
      before do
        get '/api/v1/path/folder1'
        @response = response
      end

      it_behaves_like "a successful api call"

      it 'returns folder json' do
        expect(JSON.parse(response.body)['data']['type']).to eq(@folder1.model_name.plural)
      end
    end

    context 'root level image' do
      before do
        get '/api/v1/path/image1'
        @response = response
      end

      it_behaves_like "a successful api call"

      it 'returns image json' do
        expect(JSON.parse(response.body)['data']['type']).to eq(@image1.model_name.plural)
      end
    end

    context '3rd level folder' do
      before do
        get '/api/v1/path/folder1/folder2/folder3'
      end

      it_behaves_like "a successful api call"

      it 'returns folder json' do
        expect(JSON.parse(response.body)['data']['type']).to eq(@folder3.model_name.plural)
      end

      it 'returns correct parent json' do
        expect(JSON.parse(response.body)['data']['relationships']['parent']['data']['type']).to eq(@folder2.model_name.plural)
      end

      it 'returns correct url' do
        expect(JSON.parse(response.body)['data']['attributes']['url']).to eq('folder1/folder2/folder3')
      end
    end

    context '3rd level image' do

      before do
        get '/api/v1/path/folder1/folder2/image3'
        @response = response
      end

      it_behaves_like "a successful api call"

      it 'returns image json' do
        expect(JSON.parse(response.body)['data']['type']).to eq(@image3.model_name.plural)
      end

      it 'returns correct associated folder resource json' do
        expect(JSON.parse(response.body)['data']['relationships']['folder']['links']['related']).to eq("/api/v1/images/#{@image3.id}/folder")
      end
    end

    context 'cannot find resource' do

      before do
        get "/api/v1/path/folder1/folder2/nonexistentfolder"
        @response = response
      end

      it_behaves_like "an unsuccessful api call"

      it 'returns 404 error json ' do
        expect(JSON.parse(response.body)['errors'].first['title']).to eq('Record not found')
      end
    end
  end
end