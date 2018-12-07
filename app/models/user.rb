class User < ApplicationRecord
    #necessary for authenticate
    has_secure_password

    #password validation
    validates_length_of         :password, maximum: 72, minimum: 8, allow_nil: true, allow_blank: false
    validates_confirmation_of   :password, allow_nil: true, allow_blank: false
    
    before_validation {
        (self.email = self.email.to_s.downcase)
    }

    validates_presence_of       :email
    validates_presence_of       :name
    validates_uniqueness_of     :email

    def can_modify_user?(user_id)
        role == 'admin' || id.to_s == user_id.to_s
    end

    def is_admin?
        role =='admin'
    end

    def generate_password_token!
        self.reset_password_token = generate_token
        self.reset_password_sent_at = Time.now.utc
        save!
    end

    def password_token_valid?
        (self.reset_password_sent_at.to_date + 4.hours) < Time.now.utc
    end

    def reset_password!(password)
        self.reset_password_token = nil
        self.password = password
        save!
    end

    private
    def generate_token
        SecureRandom.hex(10)
    end

end
