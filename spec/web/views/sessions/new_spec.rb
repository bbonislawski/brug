require 'spec_helper'
require_relative '../../../../apps/web/views/sessions/new'

describe Web::Views::Sessions::New do
  let(:params) { Hash[] }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/sessions/new.html.erb') }
  let(:view)      { Web::Views::Sessions::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'renders sign in message' do
    rendered.must_include('<h2>Sign In</h2>')
  end
end
