# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
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
