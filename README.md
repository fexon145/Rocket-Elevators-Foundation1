Week 7 - Life is a Web Service

During this week we used the following APIs in our website:
-Google Maps
-Twilio
-Slack
-DropBox
-SendGrid
-IBM Watson
-ZenDesk

All the accounts on those website have been created with the following user:
Username: rocketelevator@hotmail.com
PW: Codeboxx1!

Here's how to test all the APIs we used:
Google Maps: 
When you click on the Google Maps tab in the admin section, a map with markers for each address and informations about the building for this address will be generated. NOTE-- This can take a long time to load and you may be prompted with an error if it takes too long, just refresh the page.

Twilio:
When the status of an elevator is set to "Intervention" from the admin section, the technical contact assigned to the building associated with the elevator will receive an SMS.

Slack:
While in the admin dashboard, click on "Elevators" on the lefthand panel. When the status of an elevator is changed, it will send a notification in the Rocket Elevators channel on Slack.

Dropbox:
The Dropbox API takes files that are uploaded via the contact form and when a customer is created or edited, a command will be executed to verify if the emails match and if it does, the previously uploaded attachment will be sent to Dropbox for safekeeping.

Sendgrid:
After customers fill out the contact form, the Sendgrid API will reach out to them via email to greet them and assure them that a representative will contact them shortly.

IBM Watson:
When you click on the Watson tab in the admin section, a single button will appear which will greet the current user and give a brief summary of the elements contained in the database.
NOTE-- It seems that the script for the button takes some time to execute the command and you may need to reload the page or the tab to have the message update when a modification is done.

Zendesk:
When a customer sends a contact form or a quote, the Zendesk API is triggered and a new ticket is created on the behalf of the customer. This ticket contains the customer's contact information and provides an easy way for the Rocket Elevators support team to respond to customers and follow up on requests.
