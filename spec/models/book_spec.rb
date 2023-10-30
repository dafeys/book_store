require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { FactoryBot.create :book }
  let(:valid_attributes) { FactoryBot.attributes_for(:book) }
  let(:invalid_attributes) { FactoryBot.attributes_for(:book, :without_title) }
  let(:long_title_attributes) { FactoryBot.attributes_for(:book, :long_title) }

  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(1) }
    it { is_expected.to validate_length_of(:title).is_at_most(50) }

    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_length_of(:author).is_at_least(1) }
    it { is_expected.to validate_length_of(:author).is_at_most(50) }

    it { is_expected.to validate_presence_of(:isbn) }
    it { is_expected.to validate_length_of(:isbn).is_equal_to(13) }
    it { is_expected.to allow_value("1234567890123").for(:isbn) }
    it { is_expected.not_to allow_value("12345678901234").for(:isbn) }

    it { is_expected.to validate_length_of(:description).is_at_most(1000).allow_nil }

    it "is valid with valid attributes" do
      book.attributes = valid_attributes
      expect(book).to be_valid
    end

    it "is not valid without a title" do
      book.attributes = invalid_attributes
      expect(book).not_to be_valid
    end

    it "is not valid with a long title" do
      book.attributes = long_title_attributes
      expect(book).not_to be_valid
    end
  end
end
