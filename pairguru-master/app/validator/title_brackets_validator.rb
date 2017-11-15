class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    stack = []
    lookup = { '(' => ')', '[' => ']', '{' => '}'}
    i = 0
    left = lookup.keys
    right = lookup.values
    record.title.each_char do |char|
      if left.include? char
        i = 0
        stack << char
      elsif right.include? char

        if stack.empty?
          record.errors.add(:base, "Too many or missing opening brackets")
        else
          a = stack.pop
          if lookup[a] != char
              record.errors.add(:base, "Too many or incorrect closing brackets")
              stack << a
          elsif i == 0
            record.errors.add(:base, "Empty brackets")
          end
        end
      else
        i=i+1
      end
    end
    if !stack.empty?
      record.errors.add(:base, "Not all brackets are closed")
    end
  end
end
