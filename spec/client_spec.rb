require('spec_helper')

describe(Client) do

  describe('#==') do
    it("recognizes equivalency between objects") do
      test_client  = Client.new({:name => "Scary Spice", :stylist_id => nil, :id => nil})
      test_client2 = Client.new({:name => "Scary Spice", :stylist_id => nil, :id => nil})
      expect(test_client).to(eq(test_client2))
    end
  end

end
