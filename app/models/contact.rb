class Contact < ActiveRecord::Base
	belongs_to :user
	belongs_to :document

	accepts_nested_attributes_for :document

	validates :name, presence: true,
						length: { minimum: 2}

	validates :user_id, presence: true
end
