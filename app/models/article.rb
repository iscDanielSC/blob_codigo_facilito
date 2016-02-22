class Article < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true, length: { minimum: 20 }

	belongs_to :user
	has_many :comments
	
	# has_many :paragraphs, through: :sections
	# has_many :user, through: :comments

	before_save :set_visits_count

	def update_visits_count
		self.update(visits_count: self.visits_count + 1)
	end

	private

	def set_visits_count		
		self.visits_count ||= 0
	end
end
