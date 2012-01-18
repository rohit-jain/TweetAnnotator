#!/usr/bin/env ruby
begin
t=gets
t=t.chomp.to_i
while t!=0
a=gets
n=a.split[0]
m=a.split[1]
n=n.chomp.to_i
m=m.chomp.to_i

if n==m
result=0;
else
result=0
c=0
d=0
c=(1<<(n+1))
d=(1<<(m+1))
result=(c-d)
end

puts sprintf("%0.02f\n",Float(result));
t=t-1;
end
end

