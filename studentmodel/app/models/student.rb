class Student < ActiveRecord::Base
	# validates_uniqueness_of :last_name
	# validates_length_of :first_name, :minimum => 4
	# validates_length_of :last_name, :minimum => 4
	# validates_length_of :first_name, :allow_blank => false
	# validates_length_of :last_name, :allow_blank => false


	validates :first_name, :presence => true,
		:length => {:minimum => 4},
		:allow_blank => false

	validates :last_name, :presence => true,
		:length => {:minimum =>4},
		:allow_blank => false,
		:uniqueness => true
end

