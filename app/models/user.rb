# frozen_string_literal: true

# Class
class User < ApplicationRecord
  validates :username, presence: true
  validates_length_of :username, :in => (4..12)
  validates :email, presence: true
  validates :password, presence: true
end
