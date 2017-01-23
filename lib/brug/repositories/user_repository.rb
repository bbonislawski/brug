class UserRepository < Hanami::Repository
  def create_with_hashed_password(form)
    with_hashed_password = form.merge(password: BCrypt::Password.create(form[:password]))
    self.create(with_hashed_password)
  end

  def find_and_authenticate(form)
    user = users.where(email: form[:user][:email]).first
    return nil unless user
    if BCrypt::Password.new(user.password) == form[:user][:password]
      user
    else
      nil
    end
  end
end
