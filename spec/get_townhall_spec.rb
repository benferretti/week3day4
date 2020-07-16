require_relative '../lib/get_townhall'

describe "The get_townhall_email method" do
  it "should return page, and page is not nil" do
    expect(get_townhall_email("http://annuaire-des-mairies.com/95/saint-gratien.html")).to eq("info@mairie-saintgratien.fr")
  end
end

describe "The get_townhall_urls method" do
  it "should identify 3 mails in the hash" do
    expect(get_townhall_urls.has_value?("http://annuaire-des-mairies.com/95/saint-gratien.html")).to eq(true)

  end
end

describe "The array of data method" do
  it "should check the size of array" do
    expect(array_of_data.length).to eq(185)
  end
end

