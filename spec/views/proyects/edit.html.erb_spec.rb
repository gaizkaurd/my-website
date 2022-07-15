require 'rails_helper'

RSpec.describe 'proyects/edit', type: :view do


  it 'renders the edit proyect form' do
    proyect = assign(:proyect, Proyect.create!(
      name: 'MyString',
      description: 'MyString',
      content: 'My content hello!',
      repo: 'https://github.com/gaizkaurd/my-website',
      active: false,
      start_time: '2022-07-15 11:41:04'
    ))

    render

    assert_select 'form[action=?][method=?]', proyect_path(proyect), 'post' do

      assert_select 'input[name=?]', 'proyect[name]'

      assert_select 'input[name=?]', 'proyect[description]'

      assert_select 'input[name=?]', 'proyect[content]'

      assert_select 'input[name=?]', 'proyect[repo]'

      assert_select 'input[name=?]', 'proyect[active]'
    end
  end
end
