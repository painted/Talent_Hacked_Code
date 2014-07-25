class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :projects

	has_attached_file :image, 
	    styles: { :medium => "300x300>", :thumb => "100x100>" },
	    # :default_url => "/assets/images/:style/github_avatar.png",
	    storage: :s3,
	    s3_credentials: {
	      bucket: 'talenthackeds3',
	      access_key_id: Rails.application.secrets.s3_access_key,
	      secret_access_key: Rails.application.secrets.s3_secret_key
	 }

 	# has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/images/:style/missing.png"

	validates_attachment_size :image, :in => 0.megabytes..1.megabytes

  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]

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
