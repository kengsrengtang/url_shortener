require 'spec_helper'

describe "shorteners/edit" do
  before(:each) do
    @shortener = assign(:shortener, stub_model(Shortener,
      :orig_url => "MyString",
      :uniuqe_path => "MyString"
    ))
  end

  it "renders the edit shortener form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", shortener_path(@shortener), "post" do
      assert_select "input#shortener_orig_url[name=?]", "shortener[orig_url]"
      assert_select "input#shortener_uniuqe_path[name=?]", "shortener[uniuqe_path]"
    end
  end
end
