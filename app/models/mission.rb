class Mission < ApplicationRecord
    belongs_to :planet
    belongs_to :scientist 

    validates :name, presence: true
    validates :scientist, presence: true
    validates :planet, presence: true
    validates :scientist, uniqueness: true
end
