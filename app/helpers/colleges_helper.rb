module CollegesHelper



	DEFAULT_SEAL = '/assets/seal/black-chalkboard.jpg'
	def show_seal(college)
		image_tag(DEFAULT_SEAL, alt: college.shortName)
	end


end
