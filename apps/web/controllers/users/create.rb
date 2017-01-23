module Web::Controllers::Users
  class Create
    include Web::Action

    expose :user

    def call(params)
      @user = UserRepository.new.create_with_hashed_password(params[:user])

      redirect_to '/'
    end
  end
end
