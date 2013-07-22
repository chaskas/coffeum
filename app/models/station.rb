class Station < ActiveRecord::Base
	# validates :id, presence: true
	validates :name, presence: true,
                    length: { minimum: 4 }
end
