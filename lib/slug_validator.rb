class SlugValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A[a-z|\-]+\z/
      record.errors[attribute] << (options[:message] || "is invalid. Only downcase letters, numbers and hyphens (-) are allowed")
    end
  end
end