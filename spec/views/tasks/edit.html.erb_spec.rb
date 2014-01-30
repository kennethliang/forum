require 'spec_helper'

describe "tasks/edit" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :name => "MyString",
      :sort_order => 1
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", task_path(@task), "post" do
      assert_select "input#task_name[name=?]", "task[name]"
      assert_select "input#task_sort_order[name=?]", "task[sort_order]"
    end
  end
end
