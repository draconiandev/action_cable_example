# frozen_string_literal: true

class Chatroom < ApplicationRecord
  validates :topic, presence: true, uniqueness: { case_sensitive: false }
end
