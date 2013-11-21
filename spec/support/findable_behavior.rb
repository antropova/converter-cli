shared_examples "findable" do
  it 'finds an object by name' do
    subject.name = "Find Me"
    subject.class.find_by_name('Find Me').should eq(subject)
  end

  it 'creates an object by name' do
    subject.class.create_by_name('Find Me').name.should eq('Find Me')
  end
end