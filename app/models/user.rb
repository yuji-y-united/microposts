class User < ActiveRecord::Base
<<<<<<< HEAD
    before_save { self.email = self.email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, 
                      format: { with: VALID_EMAIL_REGEX}, 
                      uniqueness: { case_sensitive: false }
    has_secure_password
    has_many :microposts
=======
>>>>>>> parent of 2bf2fe2... add sign sign up and user detail
end
