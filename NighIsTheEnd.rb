
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

puts "Type in the message you'd like to tally and press ENTER."
str_msg = gets.chomp
if !str_msg.instance_of? String
  abort("Somehow, you fed a non-string to this script.")
end
str_msg = str_msg.strip
if str_msg.length === 0
  abort("You didn't write anything.")
end

hsh_tally = tally_chars_in_msg(str_msg)
arr_hsh_tally_sorted = hsh_tally.sort_by{ |k,v| v}.reverse

arr_vals_hsh_tally = hsh_tally.values.sort.reverse
int_highest_occurrence = arr_vals_hsh_tally[0]
int_num_chars_highest_occur = arr_vals_hsh_tally.count(int_highest_occurrence)

puts "That message included #{hsh_tally.keys.length} different characters."
if int_num_chars_highest_occur == 1
  puts "The character #{arr_hsh_tally_sorted[0][0]} was most common, present #{arr_hsh_tally_sorted[0][1].to_s} times."
else
  str_highest_occur_chars = arr_hsh_tally_sorted[0, int_num_chars_highest_occur].map { |k| "#{k[0]}" }.join(" ")
  puts "#{int_num_chars_highest_occur.to_s} characters (#{str_highest_occur_chars}) were each present #{int_highest_occurrence.to_s} times."
end

puts hsh_tally.to_s
#puts arr_hsh_tally_sorted
exit
