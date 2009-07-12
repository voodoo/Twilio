class String
  def spaced
    self.scan(/\d/).map{|d| d}.join(' ')
  end
  
  def to_phone
    self.using('(###) ###-####')
  end
  
  def using(pattern, fill='', right=false, fixchar='#', remchar='&')

      remCount = pattern.count(remchar)
      raise ArgumentError.new("Too many #{remchar}") if remCount > 1
      raise ArgumentError.new("#{fixchar} too long") if fixchar.length > 1
      raise ArgumentError.new("#{remchar} too long") if remchar.length > 1
      raise ArgumentError.new("#{fill} too long")    if fill.length > 1
      remaining = remCount != 0
      slots = pattern.count(fixchar)

      # Return the string if it doesn't fit and we shouldn't even try,
      if fill.nil?
        return self if self.length < slots
        return self if self.length > slots and !remaining
      end

      # Pad and clone the string if necessary.
      source =  if fill.nil? || fill.empty? then
                  self
                elsif right then
                  self.rjust(slots, fill)
                else
                  self.ljust(slots, fill)
                end

      # Truncate the string if necessary.
      if source.length > slots && !remaining then
        source = right ? source[-source.length, source.length] :
                         source[0, source.length]
      end

      # Truncate pattern if needed.
      if !fill.nil? && fill.empty? then

        if source.length < slots  # implies '&' can be ignored
          keepCount = source.length # Number of placeholders we are keeping
          leftmost, rightmost = 0, pattern.length - 1
          if right then
            # Look right-to-left until we find the last '#' to keep.
            # Loop starts at 1 because 0th placeholder is in the inject param.
            leftmost = (1...keepCount).inject(pattern.rindex(fixchar)) {
              |leftmost, n| pattern.rindex(fixchar, leftmost - 1) }
          else
            # Look left-to-right until we find the last '#' to keep.
            rightmost = (1...keepCount).inject(pattern.index(fixchar)) {
              |rightmost, n| pattern.index(fixchar, rightmost + 1) }
          end
          pattern = pattern[leftmost..rightmost]
          slots = pattern.count(fixchar)
        end

        # Trim empty '&' up to nearest placeholder. If a '&' goes empty, the
        # literals between it and the nearest '#' are probably also unnecessary.
        if source.length == slots then
          if pattern.match("^#{Regexp.escape(remchar)}") then
            pattern = pattern[pattern.index(fixchar) || 0 ... pattern.length]
          elsif pattern.match("#{Regexp.escape(remchar)}$") then
            pattern = pattern[0 ... (pattern.rindex(fixchar) + fixchar.length) || pattern.length]
          end
        end

      end

      # Figure out how long the remainder will be when we get to it.
      remSize = source.length - slots
      if remSize < 0 then remSize = 0; end

      # Make the result.
      scanner = ::StringScanner.new(pattern)
      sourceIndex = 0
      result = ''
      fixRegexp = Regexp.new(Regexp.escape(fixchar))
      remRegexp = Regexp.new(Regexp.escape(remchar))
      while not scanner.eos?
        if scanner.scan(fixRegexp) then
          result += source[sourceIndex].chr
          sourceIndex += 1
        elsif scanner.scan(remRegexp) then
          result += source[sourceIndex, remSize]
          sourceIndex += remSize
        else
          result += scanner.getch
        end
      end

      result
    end  
end