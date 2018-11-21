require 'bookmark'

describe BookMark do
  let(:bookmark) { BookMark.new }

  it 'Can show a list of bookmarks' do
    expect(bookmark).to respond_to(:list)
  end

  it "list's the bookmarks with the format integer boomark ie.
  1. website" do
    expect(bookmark.print.first[:title]).to match('Makers Academy')
  end

  it "can delete a bookmark" do
    expect(bookmark).to respond_to(:delete)
  end
end
