from django.core.mail import EmailMessage
class Util:
    @staticmethod
    def send_email(data):
        email = EmailMessage(from_email='visued@gmail.com', subject=data['email_subject'], body=data['email_body'], to=[data['to_email']])
        email.send()
