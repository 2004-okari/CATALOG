# frozen_string_literal: true

require 'rspec'
require_relative '../classes/game'

describe Game do
  context 'Game class' do
    game = Game.new('2002-02-27', 'yes', '2013-12-12')

    it 'should create a new Game' do
      expect(game).to be_an_instance_of(Game)
    end

    it 'should return the correct multiplayer' do
      expect(game.multiplayer).to eq 'yes'
    end

    it 'should return the correct last_played_at' do
      expect(Date.parse(game.last_played_at).year).to eq 2013
    end

    it 'should return true if can_be_archived? returns true and last_played_at is older than 2 years' do
      expect(game.send(:can_be_archived?)).to eq true
    end
  end
end
