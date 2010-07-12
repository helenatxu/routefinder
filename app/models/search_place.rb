class SearchPlace < ActiveRecord::Base
  attr_accessible :keywords, :country

  def places
    @places ||= find_places
  end

  def find_places
    Place.find(:all, :conditions => conditions)
  end


  def keyword_conditions
    ["places.name LIKE ?", "%#{keywords}%"] unless keywords.blank?
  end


  def country_conditions
    ["places.country = ?", country] unless country.blank?
  end

  def conditions
    [conditions_clauses.join(' AND '), *conditions_options]
  end

  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end

  def conditions_options
    conditions_parts.map { |condition| condition[1..-1] }.flatten
  end

  def conditions_parts
    private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
  end

end