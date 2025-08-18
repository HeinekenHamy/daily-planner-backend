class EventBlueprint < Blueprinter::Base
  identifier :id
  fields :title, :description, :date, :time, :category, :priority
end
