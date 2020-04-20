require 'rails_helper'

RSpec.describe Image, type: :model do
  let(:image1) { described_class.new }
  let(:image2) { described_class.new }

  it_behaves_like 'breadcrumbable'

  describe 'validations' do
    let(:root_folder) { create(:root_folder) }
    let(:existing_image) { create(:image, name: 'Anything', folder: root_folder) }

    it 'is not valid without a name or a parent folder' do
      expect(image1).to_not be_valid

      image1.name = 'Anything'
      image1.folder = root_folder
      expect(image1).to be_valid
    end

    it 'cannot have same name as existing record' do
      image2.name = existing_image.name
      image2.folder = root_folder
      expect(image2).to_not be_valid
    end
  end
end
