require 'spec_helper'
require_relative '../../../../apps/web/views/users/new'

describe Web::Views::Users::New do
  let(:exposures) { Hash[] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/users/new.html.erb') }
  let(:view)      { Web::Views::Users::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'renders welcome message' do
    rendered.must_include('<h2>Create Account</h2>')
  end
end
