class Tag 
  def content(value)
    puts "\t#{value}" 
end 
end 
def inside_tag(tag,&block)
  puts "<#{tag}>"
  block.call(Tag.new)
  puts "</#{tag}>"
end 
inside_tag("p") do |tag|
  tag.content "hello world"
  tag.content "I'm learning ruby"
end   