require 'spec_helper'

describe Shortener do
  let(:shortener){double('shortened_url', orig_url: 'http://www.foo.com')} 
  
  describe '#generate' do
    it 'should return existing shortened url if it existed' do
      Shortener.stub(:find_by_orig_url){shortener}  
      expect(Shortener.generate('orig_url')).to eq shortener
    end

    it "should create new shortener if it doesn't existed" do
      expect{Shortener.generate 'abcde'}.to change{Shortener.all.size}.from(0).to(1)
    end
  end
  
  describe '#shortened_url' do
    it 'should return shortened_url' do
      stub_const('Shortener::HOST_NAME', 'http://www.bar.com')
      expect(Shortener.shortened_url 'abc').to eq 'http://www.bar.com/s/abc' 
    end
  end
end
