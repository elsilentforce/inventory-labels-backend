class Storage < ApplicationRecord
  has_many :items, dependent: :destroy
end
