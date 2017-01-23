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

  def test_success_find_and_authenticate_user
    @repo.clear
    email = 'test@test.test'
    password = 'passw0rd'
    created_user = @repo.create_with_hashed_password(email: email, password: password)

    found_user = @repo.find_and_authenticate({ user: { email: email,
                                                            password: password } })

    assert_equal created_user.id, found_user.id
  end

  def test_find_and_authenticate_user_with_wrong_password
    @repo.clear
    email = 'test@test.test'
    password = 'passw0rd'
    created_user = @repo.create_with_hashed_password(email: email, password: password)

    found_user = @repo.find_and_authenticate({ user: { email: email,
                                                            password: 'invalid' } })
    assert_nil found_user
  end

  def test_find_and_authenticate_user_with_wrong_email
    @repo.clear
    found_user = @repo.find_and_authenticate({ user: { email: 'not@existing.mail',
                                                            password: 'invalid' } })
    assert_nil found_user
  end
end
