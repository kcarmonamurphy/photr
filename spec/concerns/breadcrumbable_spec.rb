require 'spec_helper'

shared_examples_for 'breadcrumbable' do
  let(:model) { described_class } # the class that includes the concern

  ROOT_FOLDER = 'root_folder'

  # before do
  #   @root_folder = Folder.create(name: ROOT_FOLDER)

  #   @folder1 = Folder.create(name: 'folder1', parent: @root_folder)
  #   @folder2 = Folder.create(name: 'folder2', parent: @folder1)
  #   @folder3 = Folder.create(name: 'folder3', parent: @folder2)

  #   @image1 = Image.create(name: 'image1', folder: @root_folder)
  #   @image2 = Image.create(name: 'image2', folder: @folder1)
  #   @image3 = Image.create(name: 'image3', folder: @folder2)
  #   @image4 = Image.create(name: 'image4', folder: @folder3)
  # end

  describe '#breadcrumbs' do
    let(:root_folder) { create(:root_folder) }
    let(:record) { model.last }

    context 'root folder' do
      it 'returns an empty array' do
        expect(root_folder.breadcrumbs).to eq([])
      end
    end

    context 'one folder in' do
      before do
        if model.to_s.underscore.to_sym == :folder
          create(:folder, parent: root_folder)
        else
          create(:image, folder: root_folder)
        end
      end

      it 'returns an array of length 1' do
        expect(record.breadcrumbs.length).to eq(1)
      end

      it 'name and url attributes are equal to name of folder' do
        expect(record.breadcrumbs.last[:name]).to eq(record.name)
        expect(record.breadcrumbs.last[:url]).to eq(record.name)
      end
    end

    context 'two folders in' do
      before do
        containg_folder = create(:folder, parent: root_folder)

        if model.to_s.underscore.to_sym == :folder
          create(:folder, parent: containg_folder)
        else
          create(:image, folder: containg_folder)
        end
      end

      it 'returns an array of length 2' do
        expect(record.breadcrumbs.length).to eq(2)
      end

      it 'name and url attributes are equal to name of folder' do
        expect(record.breadcrumbs.last[:name]).to eq(record.name)

        url = "#{model.second_to_last.name}/#{record.name}"
        expect(record.breadcrumbs.last[:url]).to eq(url)
      end
    end
  end
end