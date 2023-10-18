require 'rails_helper'

RSpec.describe Book, type: :model do
  context "validations" do
    let(:resource) { FactoryBot.create :book }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(1) }
    it { is_expected.to validate_length_of(:title).is_at_most(50) }

    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_length_of(:author).is_at_least(1) }
    it { is_expected.to validate_length_of(:author).is_at_most(50) }

    it { is_expected.to validate_presence_of(:isbn) }
    it { is_expected.to validate_length_of(:isbn).is_equal_to(13) }

    it { is_expected.to allow_value("").for(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(1000) }
  end
end
