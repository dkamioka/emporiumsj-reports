class User

  include DataMapper::Resource
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  property :id, Serial
  #property :email, String, :length => 255
  #property :password, String, :length => 255
  #property :password_confirmation, String, :length => 255
  property :login, String, :length => 255

end
