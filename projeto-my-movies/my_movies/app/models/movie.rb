class Movie < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness:
    {scope: :release_date,
      message: "Should not have two movies with same name and release date"}
end
