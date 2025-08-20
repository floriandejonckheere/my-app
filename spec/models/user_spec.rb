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

# == Schema Information
#
# Table name: users
#
#  id                 :uuid             not null, primary key
#  email              :string           default(""), not null, uniquely indexed
#  encrypted_password :string           default(""), not null
#  name               :string           default(""), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
