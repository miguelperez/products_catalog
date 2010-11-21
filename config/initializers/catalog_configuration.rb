#base configurations for the catalog
require 'yaml'
CATALOG_CONFS = YAML.load_file(File.join(RAILS_ROOT, 'config', 'catalog_configuration.yml'))

def company_configuration_value(property)
  value = CATALOG_CONFS['company'][property]
  return h(value) unless value.blank?
  ""
end

default_validations = {
  "product" => {
    "update" => {
      "not_visible_if_price_lower_than_zero" => "true",
      "not_visible_if_no_images" => "true"
    }
  },
}

user_validations = CATALOG_CONFS.delete("validations") || {}

VALIDATIONS = default_validations.merge(user_validations)