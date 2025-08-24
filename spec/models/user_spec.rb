# frozen_string_literal: true

RSpec.describe User do
  subject(:user) { build(:user) }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

  it "downcases the email before saving" do
    user.email = "ADMIN@EXAMPLE.COM"

    user.save!

    expect(user.email).to eq "admin@example.com"
  end
end
