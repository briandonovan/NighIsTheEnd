
require 'colorize'

$str_nlnsp = "\n  "

def rtn_hsh_tally_chars_in_msg(str_msg)
  hsh_tally = {}
  str_msg.each_char { |c|
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

def rtn_str_char_occur_list_printable(arr_hsh_tally_sorted)
  str_printable_list = ''
  for arr_char_tally in arr_hsh_tally_sorted
    str_printable_list += $str_nlnsp + "#{arr_char_tally[0].to_s.cyan}: #{arr_char_tally[1].to_s.yellow}"
  end
  str_printable_list += "\n"
  return str_printable_list
end

puts $str_nlnsp + "Type in the message you'd like to tally and press ENTER."

str_msg = gets.chomp
if !str_msg.instance_of? String
  abort($str_nlnsp + "Somehow, you fed a non-string to this script.")
end

str_msg = str_msg.strip
if str_msg.length === 0
  abort($str_nlnsp + "You didn't write anything.")
end

hsh_tally = rtn_hsh_tally_chars_in_msg(str_msg)
arr_hsh_tally_sorted = hsh_tally.sort_by{ |k,v| v}.reverse
arr_vals_hsh_tally = hsh_tally.values.sort.reverse

fxnm_highest_occurrence = arr_vals_hsh_tally[0]
fxnm_num_chars_highest_occur = arr_vals_hsh_tally.count(fxnm_highest_occurrence)

puts $str_nlnsp + "That message included #{hsh_tally.keys.length.to_s.yellow} different characters."

if fxnm_highest_occurrence == 1
  puts $str_nlnsp + "No character occurs more than once."
elsif fxnm_num_chars_highest_occur == 1
  puts $str_nlnsp + "The character #{arr_hsh_tally_sorted[0][0].cyan} was most common, present #{arr_hsh_tally_sorted[0][1].to_s.yellow} times."
else
  str_highest_occur_chars = arr_hsh_tally_sorted[0, fxnm_num_chars_highest_occur].map { |k| "#{k[0].to_s.cyan}" }.join(" ")
  puts $str_nlnsp + "#{fxnm_num_chars_highest_occur.to_s} characters (#{str_highest_occur_chars}) were each present #{fxnm_highest_occurrence.to_s.yellow} times."
end

str_printable_char_occur_list = rtn_str_char_occur_list_printable(arr_hsh_tally_sorted)
puts $str_nlnsp + "Here's the list of characters that occur in your message and the number of times they appear:#{str_printable_char_occur_list}"

exit
