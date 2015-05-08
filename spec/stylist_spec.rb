require('spec_helper')

describe(Stylist) do

  describe('#==') do
    it("recognizes equivalency between objects") do
      test_stylist  = Stylist.new({:name => "Some Stylist", :id => nil})
      test_stylist2 = Stylist.new({:name => "Some Stylist", :id => nil})
      expect(test_stylist).to(eq(test_stylist2))
    end
  end

  describe('#save') do
    it("records record of the stylist") do
      test_stylist = Stylist.new({:name => "Some Stylist", :id => nil})
      test_stylist.save()
      expect(Stylist.all).to(eq([test_stylist]))
    end
  end

  describe('.find') do
    it("locates and returns a specific stylist record") do
      test_stylist = Stylist.new({:name => "Some Stylist", :id => nil})
      test_stylist.save()
      expect(Stylist.find(test_stylist)).to(eq(test_stylist))
    end
  end

  describe('#name') do
    it("returns a stylists name") do
      test_stylist = Stylist.new({:name => "Some Stylist", :id => nil})
      test_stylist.save()
      expect(test_stylist.name()).to(eq("Some Stylist"))
    end
  end

  describe('#id')  do
    it("returns a stylists unique id") do
      test_stylist = Stylist.new({:name => "Some Stylist", :id => nil})
      test_stylist.save()
      expect(test_stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#clients') do
    it("returns a list of a specific stylists clients") do
      test_stylist = Stylist.new({:name => "Some Stylist", :id => nil})
      test_stylist.save()
      test_client  = Client.new({:name => "Scary Spice", :stylist_id => test_stylist.id(), :id => nil})
      test_client.save()
      test_client2 = Client.new({:name => "Baby Spice", :stylist_id => test_stylist.id(), :id => nil})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end

  describe("#update") do
    it("updates a stylists entry in the database") do
      test_stylist = Stylist.new({:name => "Some Stylist", :id => nil})
      test_stylist.save()
      test_stylist.update({:name => "Other Stylist"})
      expect(test_stylist.name()).to(eq("Other Stylist"))
    end
  end

  describe('#delete') do
    it("removes a stylists entry from the database") do
      test_stylist  = Stylist.new({:name => "Some Stylist", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Other Stylist", :id => nil})
      test_stylist2.save()
      test_stylist.delete()
      expect(Stylist.all()).to(eq([test_stylist2]))
    end
  end

end
