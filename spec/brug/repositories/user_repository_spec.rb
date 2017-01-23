require 'spec_helper'

class TestUserRepository < Minitest::Test
  def setup
    @repo = UserRepository.new
  end

  def test_create_with_hashed_password
    email = 'test@test.test'
    password = 'passw0rd'
    entity = @repo.create_with_hashed_password(email: email, password: password)
    assert_equal email, entity.email
    assert(BCrypt::Password.new(entity.password) == password)
  end
end
