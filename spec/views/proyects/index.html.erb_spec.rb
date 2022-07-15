require 'rails_helper'

RSpec.describe 'proyects/index', type: :view do
  before do
    assign(:proyects, [
      Proyect.create!(
        name: 'Name',
        description: 'Description',
        content: 'my content is awesome!',
        repo: 'https://github.com/gaizkaurd/my-website',
        active: false,
        start_time: '2022-07-15 11:41:04'
      ),
      Proyect.create!(
        name: 'Name',
        description: 'Description',
        content: 'my content is awesome!',
        repo: 'https://github.com/gaizkaurd/my-website',
        active: false,
        start_time: '2022-07-15 11:41:04'
      )
    ])
  end

  it 'renders a list of proyects' do
    render
  end
end
