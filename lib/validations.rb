# This class acts as a helper for user entered validations.
class Validations
  class << self
    # Checks against on update validations hash
    def on_update(model, name)
      validation_value(model, 'update', name)
    end

    # Checks against on save validations hash
    def on_save(model, name)
      validation_value(model, 'save', name)
    end

    def validation_value(model, action, name)
      VALIDATIONS[model][action][name]
    end
  end
end