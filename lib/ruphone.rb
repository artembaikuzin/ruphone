require 'ruphone/version'

module Ruphone
  # Normalize russian phone numbers to +7XXXXXXXXXX format. Examples:
  #
  #   Ruphone.normalize('8921-746-95-48')
  #   # => "+79217469548"
  #
  #   Ruphone.normalize('8(921) 746-95-48')
  #   # => "+79217469548"
  #
  #   Ruphone.normalize('746-95-48', city_code: '+7843')
  #   # => "+78437469548"
  #
  def self.normalize(phone, args = {})
    return phone if phone.nil?

    phone = phone.tr('^0-9', '')
    return phone if phone.size.zero?

    return prefix(phone) if phone.size == 10

    if phone.size == 11
      return plus(phone) if phone.start_with?('7')
      return prefix(phone[1..-1]) if phone.start_with?('8')
    end

    city_code = normalize_city_code(args[:city_code])
    if city_code && phone.size == 11 - city_code.size
      return plus("#{city_code}#{phone}")
    end

    phone
  end

  private

  def self.prefix(phone)
    "+7#{phone}"
  end

  def self.plus(phone)
    "+#{phone}"
  end

  def self.normalize_city_code(city_code)
    return city_code if city_code.nil?
    return city_code[1..-1] if city_code.start_with?('+')
    city_code
  end
end
