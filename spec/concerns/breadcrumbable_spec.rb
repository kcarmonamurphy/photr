require 'spec_helper'

shared_examples_for 'breadcrumbable' do
  let(:model) { described_class }

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

        is_folder_model = model.to_s.underscore.to_sym == :folder
        containing_folder = is_folder_model ? record.parent : record.folder
        url = "#{containing_folder.name}/#{record.name}"

        expect(record.breadcrumbs.last[:url]).to eq(url)
      end
    end
  end
end