# Include hook code here
require 'boiler_plate/validation_reflection'
require 'field_set_form_builder'
require 'field_set_form'

ActiveRecord::Base.class_eval do
  include BoilerPlate::ActiveRecordExtensions::ValidationReflection
  BoilerPlate::ActiveRecordExtensions::ValidationReflection.load_config
  BoilerPlate::ActiveRecordExtensions::ValidationReflection.install(self)
end