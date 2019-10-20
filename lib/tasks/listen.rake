task :listen do

  ARGV.each { |a| task a.to_sym do ; end }

  listener = Listen.to(ARGV[1]) do |modified, added, removed|
    puts "modified absolute path: #{modified}"
    puts "added absolute path: #{added}"
    puts "removed absolute path: #{removed}"
  end

  listener.start # not blocking
  sleep
end