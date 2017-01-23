class UserRepository < Hanami::Repository
  def create_with_hashed_password(data)
    with_hashed_password = data.merge(password: BCrypt::Password.create(data[:password]))
    self.create(with_hashed_password)
  end
end
