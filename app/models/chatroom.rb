# frozen_string_literal: true

class Chatroom < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages

  validates :topic, presence: true, uniqueness: { case_sensitive: false }
end
