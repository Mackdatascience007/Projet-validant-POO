require_relative '../lib/player'




describe Player do

  describe '#new' do
    it 'works' do
      name = double('name')
      result = Player.new(name)
      expect(result).not_to be_nil
    end
  end
end
