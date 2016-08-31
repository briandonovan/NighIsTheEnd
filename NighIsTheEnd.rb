
def tally_chars_in_msg(str_msg)
  hsh_tally = {}
  str_msg.each_char{|c|
    if hsh_tally.has_key?(c)
      hsh_tally[c] += 1
    else
      unless c.match(" ") or c.match(/[[:punct:]]/)
        hsh_tally[c] = 1
      end
    end
  }
  return hsh_tally
end

puts "Type in the message you'd like to tally and press /ENTER/!"
str_msg = gets.chomp
if !str_msg.instance_of? String
  abort("Somehow, you fed a non-string to this script.")
end
if str_msg.length === 0
  abort("You didn't write anything.")
end

hsh_tally = tally_chars_in_msg(str_msg)
puts "That message included #{hsh_tally.keys.length} different characters."
exit
