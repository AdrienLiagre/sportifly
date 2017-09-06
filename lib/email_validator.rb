require 'mail'

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    domain_names = Group.all.pluck(:email_domain_name)
    
      m = Mail::Address.new(value)
      # We must check that value contains a domain, the domain has at least
      # one '.' and that value is an email address
      if (m.domain!=nil && m.domain.match(Regexp.union(domain_names)) && m.address == value) == true
        r = true
      elsif Token.where(mail:m.address).count > 0
        r = true
      else
        r = false
      end

      # Update 2015-Mar-24
      # the :tree method was private and is no longer available.
      # t = m.__send__(:tree)
      # We need to dig into treetop
      # A valid domain must have dot_atom_text elements size > 1
      # user@localhost is excluded
      # treetop must respond to domain
      # We exclude valid email values like <user@localhost.com>
      # Hence we use m.__send__(tree).domain
      # r &&= (t.domain.dot_atom_text.elements.size > 1)
      
    record.errors[attribute] << (options[:message] || "est invalide") unless r
  end
end
