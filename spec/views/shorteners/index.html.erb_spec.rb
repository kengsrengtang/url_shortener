require 'spec_helper'

describe "shorteners/index" do
  before(:each) do
    assign(:shorteners, [
      stub_model(Shortener,
        :orig_url => "Orig Url",
        :uniuqe_path => "Uniuqe Path"
      ),
      stub_model(Shortener,
        :orig_url => "Orig Url",
        :uniuqe_path => "Uniuqe Path"
      )
    ])
  end

  it "renders a list of shorteners" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Orig Url".to_s, :count => 2
    assert_select "tr>td", :text => "Uniuqe Path".to_s, :count => 2
  end
end
