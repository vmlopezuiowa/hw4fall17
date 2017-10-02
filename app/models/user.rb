class User < ActiveRecord::Base
    validates :user_id , uniqueness: true
        
    def self.create_user(user_params)
        session_token = SecureRandom.base64
        params.require(:user).permit(:user_id, :email).merge(session_token)
        self.create(user_params)
    end
end
