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
c=(1<<(n-m))
d=(1<<(m+1))
e=c+1
result=d*(c+1)
end

puts sprintf("%0.02f\n c=%d\n d=%d\n e=%d\n",Float(result),c,d,e);
t=t-1;
end
end

