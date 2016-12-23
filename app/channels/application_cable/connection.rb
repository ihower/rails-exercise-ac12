module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :current_user

    def connect
      self.current_user = find_verified_user

      if current_user
        logger.add_tags 'ActionCable', "current_user: #{current_user.id}"
      end
    end

    protected

    def find_verified_user
      if verified_user = env['warden'].try(:user)
        verified_user
      else
        nil # reject_unauthorized_connection
      end
    end

  end
end
