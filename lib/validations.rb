class Validations
  class << self
    def on_update(model, name)
      validation_value(model, 'update', name)
    end

    def on_save(model, name)
      validation_value(model, 'save', name)
    end

    def validation_value(model, action, name)
      VALIDATIONS[model][action][name]
    end
  end
end