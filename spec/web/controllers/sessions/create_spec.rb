require 'spec_helper'
require_relative '../../../../apps/web/controllers/sessions/create'

describe Web::Controllers::Sessions::Create do
  let(:action) { Web::Controllers::Sessions::Create.new }
  let(:repository) { UserRepository.new }


  it 'signs in user and redirects to root when data is correct' do
    repository.clear
    params = Hash[user: { email: 'qwe@qwe.qwe', password: 'password' }]
    user = repository.create_with_hashed_password(params[:user])

    response = action.call(params)

    action.session[:user_id].wont_be_nil
    response[0].must_equal 302
    response[1]['Location'].must_equal '/'
  end

  it 'signs in user and redirects to root when data is correct' do
    repository.clear
    params = Hash[user: { email: 'qwe@qwe.qwe', password: 'password' }]

    response = action.call(params)

    action.session[:user_id].must_equal nil
    response[0].must_equal 302
    response[1]['Location'].must_equal '/sign_in'
  end

end
