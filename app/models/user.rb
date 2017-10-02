class User < ActiveRecord::Base
    validates :user_id , uniqueness: true
        
    def self.create_user(user_params)
        token = SecureRandom.base64
        user_params.merge(session_token: token)
        self.create(user_params)
    end
end
