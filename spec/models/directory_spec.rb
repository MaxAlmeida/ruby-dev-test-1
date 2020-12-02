require 'rails_helper'

RSpec.describe Directory, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:directory).optional }
    it { is_expected.to have_many(:directories) }
  end

  describe '#path' do
    context 'when folder is root' do
      let!(:directory){create(:directory)}
      let!(:storage){"spec/support/storage/"}
      it "expect return directory root path" do
        expect(directory.path).to eq(Rails.root.join(storage+directory.name).to_s)
      end
    end

    context "when folder inside another folder" do
      let(:parent){create(:directory)}
      let!(:directory){create(:directory, directory: parent)}
      let!(:storage){"spec/support/storage/"}
      it "expect return path with parent folder path" do
        expected_directory =  Rails.root.join(storage+parent.name+"/"+directory.name).to_s
        expect(directory.path).to eq(expected_directory)
      end
    end
  end

  describe '#ordered_items' do
    let!(:parent){create(:directory, :with_file)}
    let!(:directory_a){create(:directory, name: 'a_folder', directory: parent)}
    let!(:directory_z){create(:directory, name: 'z_folder', directory: parent)}

    it "expect return orderd itens" do
      expect(parent.ordered_itens.pluck(:item_name)).to match_array(["a_folder", "test_file.txt", "z_folder"])
    end
  end
end