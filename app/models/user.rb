class User < ActiveRecord::Base
    validates :user_id , uniqueness: true
        
    def self.create_user(user_params)
        session_token = SecureRandom.base64
        ActiveRecord.create(user_params,session_token)
    end
end
