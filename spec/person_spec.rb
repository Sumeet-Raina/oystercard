class Person
    attr_accessor :name, :age
    def initialize(names, age)
      self.name = names
      self.age = age
     end
     def say_hi
       "Hi, #{name}!" 
     end

end

RSpec.describe do
    it do
        person = Person.new('Sumeet', 33)

        expect(person.name).to eq 'Sumeet'
        expect(person.age).to eq 33

        expect(person.say_hi).to eq 'Hi, Sumeet!'
    end
end