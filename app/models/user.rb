class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   # acts_as_mappable
   # geocoded_by :current_sign_in_ip
   # after_validation :geocode

  has_attached_file :avatar, 
  :styles => { :medium => "300x300>", :thumb => "30x30#" }, :default_url => "/images/:style/missing.png",
    :storage => :s3,
    :bucket => 'demomap123',
    :s3_region =>'us-east-1',
    :s3_credentials => { :access_key_id => 'AKIAIBY72MONQDPWRAHQ',
    :secret_access_key => '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' },
    :url => ':s3_domain_url',
    :path=> ":attachment/:id/:style/:filename"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/ 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

