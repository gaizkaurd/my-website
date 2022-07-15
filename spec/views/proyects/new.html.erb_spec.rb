require 'rails_helper'

RSpec.describe 'proyects/new', type: :view do
  before do
    assign(:proyect, Proyect.new(
      name: 'MyString',
      description: 'MyString',
      content: nil,
      repo: 'MyString',
      active: false
    ))
  end

  it 'renders new proyect form' do
    render

    assert_select 'form[action=?][method=?]', proyects_path, 'post' do

      assert_select 'input[name=?]', 'proyect[name]'

      assert_select 'input[name=?]', 'proyect[description]'

      assert_select 'input[name=?]', 'proyect[content]'

      assert_select 'input[name=?]', 'proyect[repo]'

      assert_select 'input[name=?]', 'proyect[active]'
    end
  end
end
