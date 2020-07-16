require_relative '../lib/dark_trader'

describe "The connect to URL method" do
  it "should return page, and page is not nil" do
    expect(connect_to_url).not_to be_nil
  end
end

describe "The fetch and stock data method" do
  it "should identify 3 crypto in the hash" do
    expect(fetch_and_stock_data.key?("Grin")).to eq(true)
    expect(fetch_and_stock_data.key?("Bitcoin")).to eq(true)
    expect(fetch_and_stock_data.key?("Polymath")).to eq(true) 
  end
end

describe "The array of data method" do
  it "should check the size of array" do
    expect(array_of_data.length).to eq(200)
  end
end



