class Developer < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:linkedin]

	def self.from_omniauth(auth)
	  # puts auth.inspect
	  where(auth.slice(:provider, :uid)).first_or_create do |developer|
	  	# byebug
	    developer.email = auth.info.email
	    developer.password = Devise.friendly_token[0,20]
	    developer.name = auth.extra.raw_info.formattedName
	    developer.avatarUrl = auth.extra.raw_info.pictureUrl 
	    developer.linkedinPublicUrl = auth.extra.raw_info.publicProfileUrl
	    developer.address = auth.extra.raw_info.mainAddress
	    developer.dob = auth.extra.raw_info.dateOfBirth
	    # developer.languages = auth.extra.raw_info.languages 
	    # developer.skills = auth.extra.raw_info.skills
	    # developer.phone = auth.info.phone-numbers   ## don't uncomment without finding currect source - this one is buggy and will crash the app
	    developer.twitter = auth.extra.raw_info.primaryTwitterAccount
	    # developer.certifications = auth.info.certifications
	    # developer.educations = auth.info.educations
	    # developer.courses = auth.info.courses
	  end
	end
end

     
