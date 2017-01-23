module Web::Controllers::Sessions
  class Create
    include Web::Action

    def call(params)
      user = UserRepository.new.find_and_authenticate(params)

      if user.nil?
        redirect_to '/sign_in'
      else
        session[:user_id] = user.id
        redirect_to '/'
      end
    end
  end
end
