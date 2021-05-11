require 'ruby3/adapter/Encrypter'
class Encrypter
  def say
    'hello'
  end
end
RSpec.describe do
  xcontext 'encrypt' do
    encrypter = Encrypter.new('key')

    it 'encrypt successfully' do
      encrypter.encrypt(
        File.open(
          '/Users/clin/projects/playgrounds/ruby3-playground/spec/ruby3/adapter/plaintext'
        ),
        File.open('secret', 'w')
      )
    end

    it 'encrypt string successfully' do
      encrypter.encrypt(
        StringAdapter.new('we attack at dawn'),
        File.open('secret', 'w')
      )
    end
  end

  xcontext 'modify class and object' do
    it 'modify class' do
      expect(encrypter.say).to eql 'hello'
    end

    it 'modify object' do
      class << encrypter
        def hi
          'hello'
        end
      end
      expect(encrypter.hi).to eq 'hello'
    end
  end
end
