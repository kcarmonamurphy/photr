require 'rails_helper'

RSpec.describe Folder, type: :model do
  let(:folder1) { described_class.new }
  let(:folder2) { described_class.new }

  it_behaves_like 'breadcrumbable'

  describe 'validations' do
    it 'is not valid without a name' do
      expect(folder1).to_not be_valid

      folder1.name = 'Anything'
      expect(folder1).to be_valid
    end

    it 'only one record permitted to have no ancestry' do
      folder1.name = 'Anything'
      folder1.save!

      expect(folder2).to_not be_valid

      folder2.name = 'Anything'
      folder2.ancestry = folder1.id
      expect(folder2).to be_valid
    end
  end
end