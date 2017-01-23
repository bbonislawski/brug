require 'spec_helper'
require_relative '../../../../apps/web/controllers/users/create'

describe Web::Controllers::Users::Create do
  let(:email) { 'test@test.test' }
  let(:password) { 'passw0rd' }
  let(:action) { Web::Controllers::Users::Create.new }
  let(:params) { Hash[user: { email: email, password: password }] }

  before do
    UserRepository.new.clear
  end

  it 'creates user' do
    action.call(params)

    action.user.id.wont_be_nil
    action.user.email.must_equal(email)
  end

  it 'redirects to root' do
    response = action.call(params)

    response[0].must_equal(302)
    response[1]['Location'].must_equal '/'
  end
end
