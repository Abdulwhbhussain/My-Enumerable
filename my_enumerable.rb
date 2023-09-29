module MyEnumerable
  def all?()
    each { |item| return false unless yield item }
    true
  end

  def max()
    max = nil
    each { |item| max = item if max.nil? || item > max }
    max
  end

  def min()
    min = nil
    each { |item| min = item if min.nil? || item < min }
    min
  end

  def sort()
    result = []
    each { |item| result << item }
    result.sort do |a, b|
      if block_given?
        yield a, b
      else
        a <=> b
      end
    end
  end
end
