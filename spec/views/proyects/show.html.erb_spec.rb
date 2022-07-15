require 'rails_helper'

RSpec.describe 'proyects/show', type: :view do
  before do
    @proyect = assign(:proyect, Proyect.create!(
      name: 'Name',
      description: 'Description',
      content: 'my content is awesome!',
      repo: 'https://github.com/gaizkaurd/my-website',
      active: false,
      start_time: '2022-07-15 11:41:04'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Repo/)
    expect(rendered).to match(/false/)
  end
end
