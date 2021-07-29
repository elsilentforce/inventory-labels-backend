class Storage < ApplicationRecord
  include Filterable
  has_many :items, dependent: :destroy
  scope :by_description, -> (description) { where("description ILIKE '#{ description }%'") }
end
