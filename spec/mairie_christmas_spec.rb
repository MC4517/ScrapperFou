require_relative '../lib/mairie_christmas.rb'


describe "the program get url" do
    it "should return city name and email and must not be nil" do
      expect(get_townhall_url).not_to be_nil
    end
    it "should be" do
    expect(get_townhall_email).not_to be_nil
    end
  end
  
 