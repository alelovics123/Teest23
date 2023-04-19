// See https://aka.ms/new-console-template for more information
using Microsoft.Extensions.Configuration;
using HttpPerformanceCore.DI;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using HttpPerformanceCore.Entityframework;
using System.Diagnostics;
using HttpPerformanceCore;
using MimeKit;
using MailKit.Net.Smtp;

ConfigurationBuilder configurationBuilder = new ConfigurationBuilder();
IConfiguration c = configurationBuilder.AddJsonFile("appsettings.json").Build();
var config = DIConfiguration.Configure();
var con = c.GetConnectionString("main");
var context = config.GetService<HttpPerformanceContext>();
var sender = c.GetRequiredSection("recipients").Value;
var temp = c.GetRequiredSection("mailSettings").GetChildren();
var MailSettings = new MailSettings
{
    Password = temp.First(n => n.Key == "Password").Value,
    SenderEmail = temp.First(n => n.Key == "Password").Value,
    Port = Int32.Parse(temp.First(n => n.Key == "Port").Value),
    SenderName = temp.First(n => n.Key == "SenderName").Value,
    Server = temp.First(n => n.Key == "Server").Value,
    UserName = temp.First(n => n.Key == "UserName").Value
};
using (var client = new HttpClient())
{
    while (true)
    {
        var configs = context.Configurations.ToList();
        var timeout = Int32.Parse(configs.Find(n => n.Key == "responseTimeThreshold").Value);
        var urls = configs.Find(n => n.Key == "urls").Value;
        var sleepLength = Int32.Parse(configs.Find(n => n.Key == "checkInterval").Value);
        try
        {
            foreach (var item in urls.Split(','))
            {
                var watch = Stopwatch.StartNew();
                client.BaseAddress = new Uri(item);
                await client.SendAsync(new HttpRequestMessage());

                watch.Stop();
                context.Responses.Add(new Response { Date = DateTime.Now, ResponseTime = (int)watch.ElapsedMilliseconds, Url = item });
                context.SaveChanges();
                if (watch.ElapsedMilliseconds > timeout)
                {
                    SendEmail($"Request took too long:{item} took {watch.ElapsedMilliseconds} ms",MailSettings);
                }
            }


        }
        catch (Exception ex) { Console.WriteLine(ex.ToString()); SendEmail(ex.ToString(),MailSettings); }


        Thread.Sleep(sleepLength);
    }
}

void SendEmail(string message,MailSettings mailSettings)
{
    using (MimeMessage emailMessage = new MimeMessage())
    {
        MailboxAddress emailFrom = new MailboxAddress(mailSettings.SenderName, mailSettings.SenderEmail);
        emailMessage.From.Add(emailFrom);
        MailboxAddress emailTo = new MailboxAddress(mailSettings.SenderName, mailSettings.SenderEmail);
        emailMessage.To.Add(emailTo);

        emailMessage.Subject = "";

        BodyBuilder emailBodyBuilder = new BodyBuilder();
        emailBodyBuilder.TextBody = message;

        emailMessage.Body = emailBodyBuilder.ToMessageBody();
        //this is the SmtpClient from the Mailkit.Net.Smtp namespace, not the System.Net.Mail one
        using (SmtpClient mailClient = new SmtpClient())
        {
            mailClient.Connect(mailSettings.Server, mailSettings.Port, MailKit.Security.SecureSocketOptions.StartTls);
            mailClient.Authenticate(mailSettings.UserName, mailSettings.Password);
            mailClient.Send(emailMessage);
            mailClient.Disconnect(true);
        }
    }
}