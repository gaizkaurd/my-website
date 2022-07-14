class ProyectCard::Component < ViewComponent::Base

  with_collection_parameter :proyect

  def initialize(proyect:, proyect_iteration:)
    @proyect = proyect
    @proyect_iteration = proyect_iteration
    super
  end

  attr_reader :proyect, :proyect_iteration
end
