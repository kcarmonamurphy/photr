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

    it 'returns an array' do
      create(model.to_s.underscore.to_sym, parent: root_folder)

      binding.pry

      expect(true).to eq(false)
    end
  end
end