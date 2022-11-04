require './author'

describe Author do
  before(:each) do
    @author = Author.new('basit', 'ali')
  end

  context '#new' do
    it 'is an instance of Author and takes 2 parameters' do
      expect(@author).to be_instance_of(Author)
    end

    it 'gives Argument error when more or less than 3 params given' do
      expect { Author.new('publisher') }.to raise_error(ArgumentError)
    end
  end

  context '#firstname' do
    it 'can be read' do
      expect(@author.first_name).to eql('basit')
    end
  end

  context '#lastname' do
    it 'can be read' do
      expect(@author.last_name).to eql('ali')
    end

    it 'can not be written' do
      expect { @author.cover_state = 'red' }.to raise_error(NoMethodError)
    end
  end

  context '#add_item' do
    it 'takes item object as parameter and sets the author of the item' do
      mocked_item = spy('item')
      allow(mocked_item).to receive(:author=) { [] }
      expect(@author.add_item(mocked_item)).to equal(@author)
    end
    it 'giver error if more or less than 1 parameter as input' do
      expect { @author.add_item }.to raise_error(ArgumentError)
    end
  end
end
