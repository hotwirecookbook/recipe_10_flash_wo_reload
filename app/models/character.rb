class Character < ApplicationRecord
  scope :filter_by_name, -> (name) { where('name ILIKE ?', "%#{name}%") }
  scope :filter_by_species, -> (species) { where species: species }
  scope :filter_by_homeworld, -> (homeworld) { where homeworld: homeworld }
  scope :filter_by_affiliation, -> (affiliation) { where affiliation: affiliation }

  def self.search(params)
    characters = where(nil)

    characters = characters.filter_by_name(params[:name]) if params[:name].present?
    characters = characters.filter_by_species(params[:species]) if params[:species].present?
    characters = characters.filter_by_homeworld(params[:homeworlds]) if params[:homeworlds].present?
    characters = characters.filter_by_affiliation(params[:affiliations]) if params[:affiliations].present?

    characters
  end

  def self.homeworlds
    pluck(:homeworld).uniq
  end

  def self.species
    pluck(:species).uniq
  end

  def self.affiliations
    pluck(:affiliation).uniq
  end
end
