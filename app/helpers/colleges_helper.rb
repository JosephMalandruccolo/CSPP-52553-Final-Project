module CollegesHelper



	DEFAULT_SEAL = '/assets/seal/black-chalkboard.jpg'
	def show_seal(college)

		if @college.logo.nil?
			image_tag(DEFAULT_SEAL, alt: college.shortName)
		else
			image_tag("/assets/seal/#{@college.logo}", alt: college.shortName, size: { height: "50%", width: "50%" })
		end
	end


end
