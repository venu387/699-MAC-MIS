/**
 * 
 */
package com.macmis.services;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.macmis.email.EmailEntity;
import com.macmis.email.EmailTemplate;
import com.macmis.models.JobModel;
import com.macmis.models.MemberModel;

/**
 * @author Venu S Reddy
 *
 */
@Service
public class EmailService {

	final String username = "noreply.mac.mis@gmail.com";
	final String password = "DnqK4dbV";

	@Autowired
	private HttpServletRequest request;

	public void sendRegistrationEmail(String to, String subject, MemberModel member) {
		EmailTemplate template = new EmailTemplate("registration.html");

		// HttpServletRequest request =
		// ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();

		String urlLogin = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ "/home/login";

		Map<String, String> replacements = new HashMap<String, String>();
		replacements.put("user", member.getFirstName() + " " + member.getLastName());
		replacements.put("email", member.getUsername());
		replacements.put("password", member.getPassword());
		replacements.put("login", urlLogin);
		String message = template.getTemplate(replacements);

		EmailEntity email = new EmailEntity(username, to, subject, message);
		email.setHtml(true);
		send(email);
	}

	public void sendJobAlertEmail(String emailId, String subject, JobModel job, MemberModel member) {
		// TODO Auto-generated method stub
		EmailTemplate template = new EmailTemplate("applyjob.html");

		Map<String, String> replacements = new HashMap<String, String>();
		replacements.put("user", member.getFirstName() + " " + member.getLastName());
		replacements.put("jobTitle", job.getTitle());
		replacements.put("company", job.getCompany().getName());
		replacements.put("location", job.getCompany().getCity() + ", " + job.getCompany().getProvince());
		replacements.put("contactName",
				job.getCompany().getContactFirstName() + " " + job.getCompany().getContactLastName());
		replacements.put("email", job.getCompany().getContactEmailId());
		replacements.put("url", job.getUrl());
		replacements.put("urlLink", job.getUrl());

		String message = template.getTemplate(replacements);

		EmailEntity email = new EmailEntity(username, emailId, subject, message);
		email.setHtml(true);
		send(email);
	}

	/*
	 * 
	 */
	@SuppressWarnings("unused")
	@Autowired
	private JavaMailSender mailSender;

	private void send(EmailEntity eParams) {

		eParams.setFrom(username);
		if (eParams.isHtml()) {
			try {
				sendHtmlMail(eParams);
			} catch (MessagingException e) {

			}
		} else {
			sendPlainTextMail(eParams);
		}
	}

	private void sendHtmlMail(EmailEntity eParams) throws MessagingException {
		/*
		 * boolean isHtml = true; try { MimeMessage message =
		 * mailSender.createMimeMessage(); MimeMessageHelper helper = new
		 * MimeMessageHelper(message); helper.setTo(eParams.getTo().toArray(new
		 * String[eParams.getTo().size()])); helper.setReplyTo(eParams.getFrom());
		 * helper.setFrom(eParams.getFrom()); helper.setSubject(eParams.getSubject());
		 * helper.setText(eParams.getMessage(), isHtml); if (eParams.getCc().size() > 0)
		 * { helper.setCc(eParams.getCc().toArray(new String[eParams.getCc().size()]));
		 * } Multipart multipart = new MimeMultipart( "alternative" );
		 * 
		 * // MimeBodyPart textPart = new MimeBodyPart(); // textPart.setText( "",
		 * "utf-8" );
		 * 
		 * MimeBodyPart htmlPart = new MimeBodyPart(); htmlPart.setContent(
		 * eParams.getMessage(), "text/html; charset=utf-8" );
		 * 
		 * //multipart.addBodyPart( textPart ); multipart.addBodyPart( htmlPart );
		 * message.setContent( multipart );
		 * 
		 * //Transport.send(message); mailSender.send(message);
		 * 
		 * } catch (MessagingException e) { throw new RuntimeException(e); }
		 */

		Properties props = new Properties();
		props.put("mail.smtp.auth", true);
		props.put("mail.smtp.starttls.enable", true);
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));

			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(eParams.getTo()));
			if (!eParams.getCc().equals(null) && !eParams.getCc().equals("")) {
				message.addRecipients(Message.RecipientType.CC, InternetAddress.parse(eParams.getCc()));
			}
			message.setSubject(eParams.getSubject());

			// Multipart multipart = new MimeMultipart("alternative");
			//
			// MimeBodyPart htmlPart = new MimeBodyPart();
			// htmlPart.setContent(eParams.getMessage(), "text/html; charset=utf-8");
			//
			// multipart.addBodyPart(htmlPart);
			message.setContent(eParams.getMessage(), "text/html; charset=utf-8");
			// message.setText(eParams.getMessage());

			Transport.send(message);

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}

	private void sendPlainTextMail(EmailEntity eParams) {

		Properties props = new Properties();
		props.put("mail.smtp.auth", true);
		props.put("mail.smtp.starttls.enable", true);
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));

			// message.setRecipients(Message.RecipientType.TO,
			// InternetAddress.parse("venusreddy2@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(eParams.getTo()));
			if (eParams.getCc() != null && eParams.getCc() != "") {
				message.setRecipients(Message.RecipientType.CC, InternetAddress.parse(eParams.getCc()));
			}
			message.setSubject(eParams.getSubject());

			// message.setContent(eParams.getMessage(), "text/html; charset=utf-8");
			message.setText(eParams.getMessage());

			Transport.send(message);

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}

}
