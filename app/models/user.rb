# frozen_string_literal: true

class User < ApplicationRecord
  # Returns the name of the user
  def name
    # this should probably just be a single field
    # there's been a big move to use full name instead
    # @see https://blog.prototypr.io/full-name-vs-first-last-name-ux-best-practice-8c2db7178fd1
    "#{first_name} #{last_name}"
  end
end
