# use while or until to iterate and yield to successive elements while iterating

require 'rspec'
require './sorted_array.rb'

shared_examples "yield to all elements in sorted array" do |method|
    specify do 
      expect do |b| 
        sorted_array.send(method, &b) 
      end.to yield_successive_args(2,3,4,7,9) 
    end
end

describe SortedArray do
  let(:source) { [2,3,4,7,9] }
  let(:sorted_array) { SortedArray.new source }

  describe "iterators" do
    describe "that don't update the original array" do 
      describe :each do
        context 'when passed a block' do
          it_should_behave_like "yield to all elements in sorted array", :each
        end

        it 'should return the array' do
          sorted_array.each {|el| el }.should eq source
        end
      end

      describe :map do
        it 'the original array should not be changed' do
          original_array = sorted_array.internal_arr
          expect { sorted_array.map {|el| el } }.to_not change { original_array }
        end

        it_should_behave_like "yield to all elements in sorted array", :map

        it 'creates a new array containing the values returned by the block' do
          sorted_array.map{|el| el * 2 }.should == [4, 6, 8, 14, 18]
      
          sorted_array.map { |i| i * 2 }.should eq [4, 6, 8, 14, 18]
        end
      end
    end

    describe "that update the original array" do
      describe :map! do
        it 'the original array should be updated' do
          original_array = sorted_array.internal_arr
          expect{ sorted_array.map! {|i| i * 2 } }.to change { original_array }
        end

        it_should_behave_like "yield to all elements in sorted array", :map!

        it 'should replace value of each element with the value returned by block' do
          sorted_array.map!{|el| el * 2 }.should == [4, 6, 8, 14, 18]
        end
      end
    end
  end

  # This is Alex's tests
  describe :inject do
    context 'when passed no accumulator' do
      it 'should accumulate from the first element' do
        sorted_array.inject { |acc,el| acc + el }.should == 25
      end
    end

    context 'when passed an accumulator' do
      it 'should accumulate starting with that value' do
        sorted_array.inject(5) { |acc,el| acc + el }.should == 30
      end
    end
  end
end


# This is Tanner's code as an example
# def inject acc=0, &block
#     each{ |x| acc = (yield acc, x) }
#     return acc
#   end

# This is Stu's code as an example. 
# def inject acc=nil, &block

#     if acc.class == Symbol
#       # if acc is a symbol, then that's the method we'll use to accumulate
#       op = acc
#       start_value = @internal_arr.shift
#       acc = start_value
#       self.each { | ele | acc = acc.send(op, ele)}
#       @internal_arr.unshift(start_value)

#     elsif acc == nil
#       # if acc is nil, then set it to the first value in the arr
#       start_value = @internal_arr.shift
#       acc = start_value
#       self.each { |ele| acc = yield(acc, ele) }
#       @internal_arr.unshift(start_value)

#     else
#       # Acc is set to the first value of @internal_arr
#       self.each { |ele| acc = yield(acc, ele) }
#     end

#     acc
    
#   end
