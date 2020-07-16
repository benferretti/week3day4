require_relative '../lib/get_deputy'

describe "The get_deputy_email method" do
  it "should return page, and page is not nil" do
    	expect(get_deputy_email("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036")).to eq("damien.abad@assemblee-nationale.fr")
  end
end

describe "The get_deputy_urls method" do
  it "should identify 3 mails in the hash" do
    expect(get_deputy_urls.has_value?("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036")).to eq(true)

  end
end

describe "The array of data method" do
  it "should check the size of array" do
    expect(array_of_data.length).to eq(573)
  end
end

