#coding:utf-8
class HelloController < ApplicationController
	def index
		render text: 'こんにちわ、世界'
	end
	
	def new
		@book = Book.new
	end
	
	def hello_params
		params.require(:hello).permit(:name)
	end
	

end
