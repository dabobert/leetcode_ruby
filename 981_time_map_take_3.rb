# https://leetcode.com/problems/time-based-key-value-store/
class TimeMap
  OFFSET = 1

  attr_accessor :internal

  def self.test
    puts timeMap = TimeMap.new
    puts timeMap.set('foo', 'bar', 1) # store the key "foo" and value "bar" along with timestamp = 1.
    puts timeMap.get('foo', 1) # return "bar"
    puts timeMap.get('foo', 3)
    # return "bar", since there is no value corresponding to foo at timestamp 3 and timestamp 2, then the only value is at timestamp 1 is "bar".
    puts timeMap.set('foo', 'bar2', 4) # store the key "foo" and value "bar2" along with timestamp = 4.
    puts timeMap.get('foo', 4) # return "bar2"
    puts timeMap.get('foo', 5) # return "bar2"
  end

  def initialize
    @internal = {}
  end

  #         :type key: String
  #         :type value: String
  #         :type timestamp: Integer
  #         :rtype: Void
  def set(key, value, timestamp)
    new_key = compkey(key, timestamp)
    @internal[new_key] = value
    # puts "saving #{value} => #{new_key}"
    nil
  end

  #         :type key: String
  #         :type timestamp: Integer
  #         :rtype: String
  def get(key, timestamp)
    new_key = compkey(key, timestamp)
    out = @internal[new_key]
    # puts "getting #{new_key} => #{out}"

    if timestamp == 1
      @internal[new_key] || ''
    elsif !out.nil?
      out || ''
    else
      get(key, timestamp - 1)
    end
    # @internal[key][pt(timestamp)] || @internal[key].slice(0, pt(timestamp)).compact.last || ""
  end

  def pt(timestamp)
    timestamp
  end

  def compkey(key, timestamp)
    "#{key}:#{pt(timestamp)}"
  end
end

# Your TimeMap object will be instantiated and called as such:
# obj = TimeMap.new()
# obj.set(key, value, timestamp)
# param_2 = obj.get(key, timestamp)
# TimeMap.test

# set ["love","high",10] => null
# set ["love","low",20] => null
# get ["love",5] => null
# get ["love",10] => high
# get ["love",15] => high
# get ["love",20] => low
# get ["love",25]] => low
#
