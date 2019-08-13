# Rocket Elevators API

To access the deployed site go the following url:

http://rocketelevators-wc26.tk/

To access the backoffice section use the admin@admin.com email and the admin123 password.

The rails admin section will be found by clicking "Log in" in the Admin dropdown menu.

We deployed the following APIs:

- Sendgrig (don't forget to look at your spam folder)
- Slack
- Twilio (Use the edit command described further to change the service_phone key to receiving sms to your own phone)
- Google Maps (Access it by the admin dropdown menu under GMAP)
- Zendesk (You should have received an invitation to join our desk as an admin)
- reCAPTCHA

To change credentials and other encrypted infos you must run the following command on the server:

- EDITOR=vim rails credentials:edit

For some reason we strongly suggest using vim since we had troubles with other editors. It seems to be a common issue since it is documented on the web. Using another editor may prevent the modified data from being properly saved.

