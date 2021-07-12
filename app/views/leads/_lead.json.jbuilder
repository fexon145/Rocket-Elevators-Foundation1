json.extract! lead, :id, :full_name, :email, :phone_number, :company_name, :project_name, :project_description, :departement, :message, :created_at, :updated_at
json.url lead_url(lead, format: :json)
