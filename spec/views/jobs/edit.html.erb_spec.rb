require 'spec_helper'

describe "jobs/edit.html.erb" do
  before(:each) do
    @job = assign(:job, stub_model(Job,
      :title => "MyString",
      :company => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit job form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => jobs_path(@job), :method => "post" do
      assert_select "input#job_title", :name => "job[title]"
      assert_select "input#job_company", :name => "job[company]"
      assert_select "input#job_user_id", :name => "job[user_id]"
    end
  end
end
