require 'spec_helper'

describe "shorteners/show" do
  before(:each) do
    @shortener = assign(:shortener, stub_model(Shortener,
      :orig_url => "Orig Url",
      :uniuqe_path => "Uniuqe Path"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Orig Url/)
    rendered.should match(/Uniuqe Path/)
  end
end
