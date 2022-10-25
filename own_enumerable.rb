class Array
  def mapp()
    res = []
    if block_given?
        self.each { |e| res << yield(e) }
    else
        res = to_enum :mapp
    end
    res
  end
end

a = [1,2,3]
a.mapp.each {|d| puts d}
p a.mapp {'test'}