module UsersHelper

	DEFAULT_URL = '/assets/200-default-avatar.png'
	def avatar_for(user)
		image_tag(DEFAULT_URL, alt: user.name)
	end
end
