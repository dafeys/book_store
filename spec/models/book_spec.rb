require 'rails_helper'

RSpec.describe Book, type: :model do
  context "validations" do
    before { FactoryBot.build(:book) }

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:isbn) }
    it { should validate_length_of(:isbn).is_equal_to(13) }
    it { should allow_value("").for(:description) }
  end
end
