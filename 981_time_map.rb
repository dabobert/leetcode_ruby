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
    @internal[key] ||= []
    @internal[key][pt(timestamp)] = value
    nil
  end

  #         :type key: String
  #         :type timestamp: Integer
  #         :rtype: String
  def get(key, timestamp)
    @internal[key][pt(timestamp)] || @internal[key].slice(0, pt(timestamp)).compact.last || ''
  end

  def pt(timestamp)
    timestamp - OFFSET
  end
end

# Your TimeMap object will be instantiated and called as such:
# obj = TimeMap.new()
# obj.set(key, value, timestamp)
# param_2 = obj.get(key, timestamp)
# TimeMap.test
