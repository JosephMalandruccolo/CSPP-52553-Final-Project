module UsersHelper

	DEFAULT_AVATAR = '/assets/avatar/200-default-avatar.png'
	def avatar_for(user)
		image_tag(DEFAULT_AVATAR, alt: user.name)
	end
end
