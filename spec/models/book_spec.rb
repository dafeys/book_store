require 'rails_helper'

RSpec.describe Book, type: :model do
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
  end
end
