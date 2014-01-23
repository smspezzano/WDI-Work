require 'sinatra'
require "sinatra/reloader"

# get "/add/:num1/:num2/" do 
# 	num_1 = params[:num1].to_i	
# 	num_2 = params[:num2].to_i
# 	sum_add = num_1 + num_2
# 	return "#{num_1} + #{num_2} = #{sum_add}"
# end

# def convert(arr)
# 	for i in (0..arr.length)
# 		arr[i] = arr[i].to_f
# 	end
# end

def convert(arr)
	arr.map!{ |ele| ele.to_f}
end


get "/add/*" do
	n = params[:splat][0].split('/')
	convert(n)

	n = n.inject(0){ |sum, n| sum + n }
	"#{n}"
end

get "/subtract/:num1/:num2/" do 
	num_1 = params[:num1].to_i
	num_2 = params[:num2].to_i
	sum_sub = num_1.to_i - num_2.to_i
	return "#{num_1} - #{num_2} = #{sum_sub}"
end

get "/multiply/:num1/:num2/" do 
	num_1 = params[:num1].to_i	
	num_2 = params[:num2].to_i
	sum_multi = num_1 * num_2
	return "#{num_1} * #{num_2} = #{sum_multi}"
end

get "/divide/:num1/:num2/" do 
	num_1 = params[:num1].to_f	
	num_2 = params[:num2].to_f
	sum_div = num_1 / num_2
	return "#{num_1} / #{num_2} = #{sum_div}"
end