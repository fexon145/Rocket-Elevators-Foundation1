class Customer < ApplicationRecord
    belongs_to :company_headquarters_address, class_name: "Address", optional: true
    belongs_to :user, class_name: "User", optional: true
    has_many :buildings
    after_create :verify_email
    after_update :verify_email

    def verify_email
        Lead.all.each do |l|
        if l.email == email_of_the_company_contact || l.email == technical_manager_email_for_service
            if l.file.attached?
                client = DropboxApi::Client.new(ENV["DROPBOX_APIKEY"])
                binary = l.file.download
                test = "/#{l.full_name}"
                begin
                    client.create_folder(test)
                rescue DropboxApi::Errors::FolderConflictError => exception
                    puts "This Folder name already exists, Skipping this step"
                end
                client.upload("/#{l.full_name}/#{l.file.blob.filename}", binary, :autorename => true)
                l.file.destroy
                l.file.blob.destroy
                end
            end
        end
    end
end
