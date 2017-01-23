require 'spec_helper'
require_relative '../../../../apps/web/views/dashboard/index'

describe Web::Views::Dashboard::Index do
  let(:exposures) { Hash[] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/dashboard/index.html.erb') }
  let(:view)      { Web::Views::Dashboard::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'renders welcome message' do
    rendered.must_include('<h2>Welcome on dashboard!</h1>')
  end
end
