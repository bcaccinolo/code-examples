class WebTokenService
    class << self
        def encode(username)
            secret = Rails.application.secrets.secret_key_base
            data = { username: username }
            JWT.encode data, secret, 'HS256'
        end

        def decode(token)
            secret = Rails.application.secrets.secret_key_base
            res = JWT.decode token, secret, true, { :algorithm => 'HS256' }
            res[0]['username']
        rescue
            nil
        end
    end
end