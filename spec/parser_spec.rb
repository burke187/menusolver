require_relative 'spec_helper'

describe 'MenuSolver' do
	before do
		@menu_hash = MenuSolver::MenuParser.new('new.txt').parse
		@results = @menu_hash.solve 
	end
	
	it 'should result with a hash table of menu items in new.txt' do
		expect(@menu_hash).to eq(MenuSolver::Solver.new({:dishes=>[{:name=>"mixed fruit", :price=>2.15},
														 {:name=>"french fries", :price=>2.75}, 
														 {:name=>"side salad", :price=>3.35}, 
														 {:name=>"hot wings", :price=>3.55}, 
														 {:name=>"mozzarella sticks", :price=>4.2}, 
														 {:name=>"sampler plate", :price=>5.8}],
														  :target=>13.0}))
	end
	it 'should result in an array of menu items' do
		expect(@results).to eq([["french fries", "hot wings", "side salad", "side salad"]])
	end
end