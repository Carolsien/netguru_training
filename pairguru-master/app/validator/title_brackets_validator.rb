class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    stack  = []
    lookup = { '(' => ')', '[' => ']', '{' => '}'}
    left   = lookup.keys
    right  = lookup.values
    record.title.each_char do |char|
      if left.include? char
        stack << char
      elsif right.include? char
        if stack.empty? || (lookup[stack.pop] != char)
          record.errors.add(:base, "This record is invalid")
        end
      end
    end
    return stack.empty?
  end
end
