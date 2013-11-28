class SlugValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A[a-z|\d|\-|\.]+\z/
      record.errors[attribute] << (options[:message] || "is invalid. Only downcase letters, numbers, dots and hyphens (-) are allowed")
    end
  end
end