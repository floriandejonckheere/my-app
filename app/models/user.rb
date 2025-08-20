# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable

  validates :name,
            presence: true

  validates :email,
            presence: true,
            uniqueness: true

  before_validation :downcase_email

  private

  def downcase_email
    email&.downcase!
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
