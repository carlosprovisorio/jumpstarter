arr = 1,2,3,4,5,6,7,8,9,10

ans = []
arr.each do |a|
if Math.sqrt(a) % 1 == 0 
	ans << a
 end
end
ans.sort

puts ans