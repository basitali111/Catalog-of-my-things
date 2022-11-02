require './book'

book1 = Book.new('Marvel', 'good', '2000-09-18')
book2 = Book.new('Klaus', 'bad', '2022-03-18')

describe 'test book constructor' do
  it 'takes three parameter and return book object' do
    expect(book1.instance_of?(Book)).to be_truthy
    expect(book2.instance_of?(Book)).to be_truthy
  end

  it 'book object should have a date' do
    expect(book1.publish_date).to eq('2000-09-18')
    expect(book2.publish_date).to eq('2022-03-18')
  end

  it 'book object should a correct cover_state paramenter' do
    expect(book1.cover_state).to eq('good')
    expect(book2.cover_state).to eq('bad')
  end
end

describe 'test book can_be_arquived method ' do
  it "return true when parent's method returns true OR if cover_state is true, else return false" do
    expect(book1.can_be_archived?).to eq(true) # publish date older than 10 years
    expect(book2.can_be_archived?).to eq(true) # cover condition bad
  end
end
