# frozen_string_literal: true

class User < ApplicationRecord
  has_many :messages
  has_many :chatrooms, through: :messages

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
end
