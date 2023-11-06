require 'rails_helper'

RSpec.describe Book, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(1).is_at_most(50)}
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_length_of(:author).is_at_least(1).is_at_most(50)  }
    it { is_expected.to validate_presence_of(:isbn) }
    it { is_expected.to validate_length_of(:isbn).is_equal_to(13) }
    it { is_expected.to validate_length_of(:description).is_at_most(1000).allow_nil }
  end

  context "associations" do
    it { is_expected.to have_one_attached(:book_cover) }
    it { is_expected.to have_one_attached(:book_content) }
  end

  context "book with cover" do
    let(:book) { create(:book, :with_cover) }

    it "has a cover attached" do
      expect(book.book_cover).to be_attached
    end
  end

  context "book with pdf" do
    let(:book) { create(:book, :with_pdf) }

    it "has a pdf attached" do
      expect(book.book_content).to be_attached
    end
  end

  context "adding cover to existing book" do
    let(:book) { create(:book) }

    it "can have a cover to be attached" do
      file = fixture_file_upload(Rails.root.join("spec", "fixtures", "test_cover.jpg"), "image/jpg")
      book.book_cover.attach(file)
      expect(book.book_cover).to be_attached
    end
  end

  context "adding pdf to existing book" do
    let(:book) { create(:book) }

    it "can have a pdf to be attached" do
      file = fixture_file_upload(Rails.root.join("spec", "fixtures", "dummy.pdf"), "application/pdf")
      book.book_cover.attach(file)
      expect(book.book_cover).to be_attached
    end
  end
end
