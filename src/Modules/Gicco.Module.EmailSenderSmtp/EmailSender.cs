using Gicco.Infrastructure.Data;
using Gicco.Module.Core.Models;
using Gicco.Module.Core.Services;
using MailKit.Net.Smtp;
using Microsoft.Extensions.Configuration;
using MimeKit;
using MimeKit.Text;
using System.Linq;
using System.Threading.Tasks;

namespace Gicco.Module.EmailSenderSmtp
{
    public class EmailSender : IEmailSender
    {
        private readonly EmailConfig _emailConfig = new EmailConfig();

        public EmailSender(IConfiguration config, IRepositoryWithTypedId<AppSetting, string> appSettingRepository)
        {
            _emailConfig.SmtpServer = appSettingRepository.Query().FirstOrDefault(x => x.Id == "SmtpServer").Value;
            _emailConfig.SmtpUsername = appSettingRepository.Query().FirstOrDefault(x => x.Id == "SmtpUsername").Value;
            _emailConfig.SmtpPassword = appSettingRepository.Query().FirstOrDefault(x => x.Id == "SmtpPassword").Value;
            var port = appSettingRepository.Query().FirstOrDefault(x => x.Id == "SmtpPort");
            _emailConfig.SmtpPort = port != null ? int.Parse(port.Value) : 587;
        }

        public async Task SendEmailAsync(string email, string subject, string body, bool isHtml = false)
        {
            var message = new MimeMessage();
            message.From.Add(new MailboxAddress(_emailConfig.SmtpUsername));
            message.To.Add(new MailboxAddress(email));
            message.Subject = subject;

            var textFormat = isHtml ? TextFormat.Html : TextFormat.Plain;
            message.Body = new TextPart(textFormat)
            {
                Text = body
            };

            using (var client = new SmtpClient())
            {
                // Accept all SSL certificates (in case the server supports STARTTLS)
                client.ServerCertificateValidationCallback = (s, c, h, e) => true;
                await client.ConnectAsync(_emailConfig.SmtpServer, _emailConfig.SmtpPort, false);

                // Note: since we don't have an OAuth2 token, disable
                // the XOAUTH2 authentication mechanism.
                client.AuthenticationMechanisms.Remove("XOAUTH2");

                // Note: only needed if the SMTP server requires authentication
                await client.AuthenticateAsync(_emailConfig.SmtpUsername, _emailConfig.SmtpPassword);

                await client.SendAsync(message);
                await client.DisconnectAsync(true);
            }
        }
    }
}
