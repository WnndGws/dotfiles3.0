#!/usr/bin/zsh
## A hook to send emails to virtual mailboxes using notmuch

notmuch new
# retag all "new" messages "inbox" and "unread"
notmuch tag +inbox +unread -new -- tag:new
# tag all messages from "me" as sent and remove tags inbox and unread
notmuch tag -new -inbox +sent -- from:wynand
# tag uni
notmuch tag +uni -inbox +unread -new -- to:uwa.edu.au

#-----------------------#
##NEWSLETTER MANAGEMENT##
#-----------------------#
notmuch tag -inbox +trash -- 'from:"donotreply@jora.com" date:"2017-01-01..yesterday" tag:inbox'
notmuch tag -inbox +trash -- 'from:"*@inside.com" date:"2017-01-01..yesterday" tag:inbox'
notmuch tag -inbox +trash -- 'from:"*@*element14.com" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"*@*dev.to" date:"2017-01-01..yesterday" tag:inbox'
notmuch tag -inbox +trash -- 'from:"*@humanreadablemag*" date:"2017-01-01..yesterday" tag:inbox'
notmuch tag -inbox +trash -- 'from:"*@daveyrealestate.com.au" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"*@*stackcommerce.com" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"*@scottscheapflights.com" date:"2017-01-01..yesterday" tag:inbox'
notmuch tag -inbox +trash -- 'from:"store-news@amazon.com" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"noreply@getpocket.com" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"tytnetwork@tytnetwork.com" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"info@stackskills.com" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"learn@codecademy.com" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"*@twitter.com" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"qantas@e.qantas.com" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"do-not-reply@e.maccas.com.au" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"emails@e.etsy.com" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"donotreply@mailings.ticketmaster.com.au" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"store-news@vip.dicksmith.com.au" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"no-reply@email.thetileapp.com" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"messages-noreply@linkedin.com" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"whattowatch@mail.getvideostream.com" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"*acdoctors.com.au" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"*koreessentials.com" date:"2017-01-01..today" tag:inbox'
notmuch tag -inbox +trash -- 'from:"sales@ple.com.au" date:"2017-01-01..today" tag:inbox'
