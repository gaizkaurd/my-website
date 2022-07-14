class Activity::Component < ViewComponent::Base

  with_collection_parameter :activity

  def initialize(activity:, activity_iteration:)
    @activity = activity
    @activity_iteration = activity_iteration
    super
  end

  attr_reader :activity, :activity_iteration
end
