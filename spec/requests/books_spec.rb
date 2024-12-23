require "rails_helper"

RSpec.describe BooksController, type: :request do
  let!(:book) { create(:book, :with_pdf) }
  let(:valid_attributes) { attributes_for(:book) }
  let(:invalid_attributes) { attributes_for(:book, :without_title) }
  let(:new_attributes) { { book: { title: "Updated title" }} }
  let!(:user) { create :user }

  describe "GET #index" do
    it "is successful" do
      get books_path

      expect(response).to be_successful
      expect(response.body).to include(CGI.escapeHTML(book.title))
    end
  end

  describe "GET #show" do
    it "is successful" do
      get book_path(book)

      expect(response).to be_successful
      expect(response.body).to include(CGI.escapeHTML(book.title))
    end

    it "renders Adobe viewer when book content is attached" do
      sign_in user

      get book_path(book)

      expect(response).to be_successful
      expect(response.body).to include("adobe-dc-view")
      expect(response.body).to include("adobe-viewer")
    end

    it "does not render Adobe viewer when user is not signed in" do
      get book_path(book)

      expect(response).to be_successful
      expect(response.body).not_to include("adobe-dc-view")
      expect(response.body).not_to include("adobe-viewer")
    end
  end

  describe "GET #new" do
    it "is successful" do
      get new_book_path

      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "is successful" do
      get edit_book_url(book)

      expect(response).to be_successful
      expect(response.body).to include(CGI.escapeHTML(book.title))
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new book and redirects" do
        expect do
          post books_path, params: { book: valid_attributes }
        end.to change(Book, :count).by(1)

        expect(response).to be_redirect
        expect(flash[:notice]).to eq("Book was successfully created.")
      end
    end

    context "with invalid parameters" do
      it "is not successful" do
        expect do
          post books_path, params: { book: invalid_attributes }
        end.not_to change(Book, :count)

        expect(response).to be_unprocessable
      end
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      it "is successful" do
        expect do
          patch book_path(book), params: new_attributes

          book.reload
        end.to change(book, :title).to(new_attributes[:book][:title])

        expect(response).to redirect_to(book_path(book))
        expect(flash[:notice]).to eq("Book was successfully updated.")
      end
    end

    context "with invalid parameters" do
      it "is unprocessable" do
        expect do
          patch book_url(book), params: { book: invalid_attributes }
        end.not_to change(book, :title)

        expect(response).to be_unprocessable
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the book and redirects to the books page" do
      expect do
        delete book_path(book)
      end.to change(Book, :count).by(-1)

      expect(response).to redirect_to(books_path)
      expect(flash[:notice]).to eq("Book was successfully destroyed.")
    end
  end
end
