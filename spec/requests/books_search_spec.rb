require "rails_helper"

RSpec.describe BookSearch, type: :request do
  let!(:book) { create :book }

  describe "GET #search" do
    context "when query is not blank" do
      before do
        get search_books_path, params: { search: { query: book.title } }
      end

      it "returns a successful response" do
        expect(response).to be_successful
      end

      it "returns the books in the response body" do
        expect(response.body).to include(CGI.escapeHTML(book.title))
      end

      it "has a flash message for 1 book" do
        expect(flash[:notice]).to eq("We found 1 books")
      end
    end

    context "when query is blank" do
      before do
        get search_books_path, params: { search: { query: "" } }
      end

      it "returns a redirect response" do
        expect(response).to be_redirect
      end

      it "has a flash message" do
        expect(flash[:alert]).to eq("Search field cannot be empty.")
      end
    end

    context "when query does not match any books" do
      before do
        get search_books_path, params: { search: { query: "Nonexistent" } }
      end

      it "returns a successful response" do
        expect(response).to be_successful
      end

      it "does not return book that not match" do
        expect(response.body).not_to include("Nonexistent")
      end
    end
  end
end
