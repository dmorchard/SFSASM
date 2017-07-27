a = []
File.open('G:\RubyDev\GitHub\SFSASM\testing\Kassimali Ex 8.4\k1.txt') do |f|
  f.lines.each do |line|
    a << line.split.map(&:to_i)
  end
end

puts a.inspect