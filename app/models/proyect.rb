class Proyect < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  validates :start_time, presence: true

  validates :active, inclusion: { in: [true, false] }


  validates :content, presence: true
  validates :content, length: { minimum: 10 }
  validates :content, length: { maximum: 500 }

  validates :repo, presence: true
  validates :repo, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
  has_rich_text :content
end
