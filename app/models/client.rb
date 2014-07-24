class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :projects

	# def self.from_omniauth(auth)
	#   # puts auth.inspect
	#   where(auth.slice(:provider, :uid)).first_or_create do |client|
	#   	# byebug
	#     client.email = auth.info.email
	#     client.password = Devise.friendly_token[0,20]
	#     client.name = auth.extra.raw_info.formattedName
	#     client.avatarUrl = auth.extra.raw_info.pictureUrl 
	#     client.linkedinPublicUrl = auth.extra.raw_info.publicProfileUrl
	#     client.address = auth.extra.raw_info.mainAddress
	#     client.twitter = auth.extra.raw_info.primaryTwitterAccount
	#     # client.phone = auth.info.phone-numbers   ## don't uncomment without finding currect source - this one is buggy and will crash the app
	#   end
	# end
end
