require 'spec_helper'

describe "shorteners/new" do
  before(:each) do
    assign(:shortener, stub_model(Shortener,
      :orig_url => "MyString",
      :uniuqe_path => "MyString"
    ).as_new_record)
  end

  it "renders new shortener form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", shorteners_path, "post" do
      assert_select "input#shortener_orig_url[name=?]", "shortener[orig_url]"
      assert_select "input#shortener_uniuqe_path[name=?]", "shortener[uniuqe_path]"
    end
  end
end
