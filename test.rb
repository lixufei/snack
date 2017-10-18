puts 'hello' + ' world' +

'xufei' #追加一行

#test BEGIN and END
END {
	puts 'this is the end word.'
}

BEGIN {
	puts 'today is 2015/12/26'
}

name = 'mobile'
puts name
puts "#{name + "milk"}" #单引号中字符串不可以被替换

#hash
colors = {'name' => 'xufei', 'age' => 10, 'belong' => 'IT'}
colors.each do |key, value|
	print key, ' is ' , value, "\n" #print和puts的区别：print不换行，puts遇分号或换行之后打出的内容换行,注意，此处连接字符串用的逗号
end

#范围(try (4...10))
(4..10).each do |n|
	print n, ' '
end

color = Range.new(10,16)
color.each do |n|
	print n, ' '
end

=begin
this 思
注释
一个代码块
=end

puts '----------------------------'
class Customer
	@@total_no_of_cust = 0  #类变量必须初始化才可以在方法定义中使用

	def initialize (id, name, tel) 
		@id = id   #实例变量如果没有初始化，则输出nil
		@name = name
		@tel = tel
	end

	def displayDetail
		puts "id is #@id"
		puts "name is #@name"
		puts "tel is #@tel"
	end

	def showTotalNoOfCus 
		@@total_no_of_cust += 1
		puts "total number of Customer is: #@@total_no_of_cust"
	end

	cus1 = Customer.new(1, 'xufei', '56789')
	cus1.displayDetail()   #方法后面可带括号可不带
	cus1.showTotalNoOfCus()

	cus2 = Customer.new(2, 'feifei', '00000')
	cus2.displayDetail
	cus2.showTotalNoOfCus
end

#::常量解析运算符

MR_COUNT = 0        # 定义在主 Object 类上的常量
module Foo
  MR_COUNT = 0
  ::MR_COUNT = 1    # 设置全局计数为 1
  MR_COUNT = 2      # 设置局部计数为 2
end
puts MR_COUNT       # 这是全局常量
puts Foo::MR_COUNT  # 这是 "Foo" 的局部常量 

CONST = ' out there'
class Inside_one
   CONST = proc {' in there'}
   def where_is_my_CONST
      ::CONST + ' inside one'
   end
end
class Inside_two
   CONST = ' inside two'
   def where_is_my_CONST
      CONST
   end
end
puts Inside_one.new.where_is_my_CONST
puts Inside_two.new.where_is_my_CONST
puts Object::CONST + Inside_two::CONST
puts Inside_two::CONST + CONST
puts Inside_one::CONST
puts Inside_one::CONST.call + Inside_two::CONST