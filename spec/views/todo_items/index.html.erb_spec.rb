require 'spec_helper'

describe "todo_items/index" do
  before(:each) do
    assign(:todo_items, [
      stub_model(TodoItem,
        :title => "Title",
        :completed => false
      ),
      stub_model(TodoItem,
        :title => "Title",
        :completed => false
      )
    ])
  end

  it "renders a list of todo_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
