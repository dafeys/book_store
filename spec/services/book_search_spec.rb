RSpec.describe BookSearch do
  let!(:book1) { create :book, title: "Ruby on Rails" }
  let!(:book2) { create :book, title: "Ruby for Beginners" }
  let!(:book3) { create :book, title: "JavaScript for Beginners" }
  let(:search_result) { BookSearch.search(query) }

  before(:each) do
    BooksIndex.reset!
    BooksIndex.import!
  end

  describe ".search" do
    context "when there are matches" do
      let(:query) { "Ruby" }

      it "returns the matching books" do
        expect(search_result).to match_array([book1, book2])
      end

      it "returns the number of matches" do
        expect(search_result.count).to eq(2)
      end
    end

    context "when there are no matches" do
      let(:query) { "Python" }

      it "returns an empty array" do
        expect(search_result).to be_empty
      end
    end
  end
end
