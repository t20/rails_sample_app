require 'spec_helper'

describe "jobs/new.html.erb" do
  before(:each) do
    assign(:job, stub_model(Job,
      :title => "MyString",
      :company => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new job form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => jobs_path, :method => "post" do
      assert_select "input#job_title", :name => "job[title]"
      assert_select "input#job_company", :name => "job[company]"
      assert_select "input#job_user_id", :name => "job[user_id]"
    end
  end
end
