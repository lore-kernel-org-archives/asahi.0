Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D007366
	for <asahi@lists.linux.dev>; Sat, 17 Sep 2022 10:42:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 26D0C5C0159;
	Sat, 17 Sep 2022 06:42:53 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute2.internal (MEProxy); Sat, 17 Sep 2022 06:42:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1663411373; x=1663497773; bh=dQ
	aF+1wSXTdrGKDcFvsc8AiWzGgDv7nBoW21HBv1DLc=; b=oeCs/stak0qMFS9gHV
	ayipsq4P2eK4CEc60GdUWqJRjscPQ92tLolcVRGeoHknSQQ5XGh3fxiZVXknEWsw
	mUFU/bB1C8A4R4daHOkoMRwXYWTMhG2Kjl/HRaV/JMo0etl8bP9oYMjgjUQmD5vU
	wTjKYos08sQ4y12mnS0+SpwAuTGs2oxXCn1EBIPce3gFQEImGwIypjucBUZxu/Ss
	5fzbVo5nW4ETo4FhjJKgxRdeVBuwD8ZSyaL7OaXU7F1t07OAsK6SKxi8qauN/QRb
	qlBhJ2QUa2gayWtqnCo9EOp3ObGK7cjMcAMw+7nEWYi8j8gWWYs6HHdjKkiWXtyR
	Ou/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663411373; x=1663497773; bh=dQaF+1wSXTdrGKDcFvsc8AiWzGgD
	v7nBoW21HBv1DLc=; b=iZBEa7Zw0YqZHXwMam7tmdy/BdtD6R1Tm4RubFd3blxd
	F5DO+7ib6euBW+NBpfgX1LkLS9x0oe9/fIafWc8HC1g45ryrZ0ZBeYY6Y0U7lTuG
	PNzosz3u6I1VfeOBxrnpwYWvajkD2zrR2sYnXEjaKeJbcZ8pDhe+ecvdtpQRwp14
	iCbk6hfSYX4A5+QtNCAo4JuUkpYSRjNmZLXC6t1WUt2fep0Kpav59tjSnquFGOTt
	b6kWhifUUdnTLGevjzdpNKv4MQIC7HspSR1X2KI99Bvtbn7Ota/VfEY6h/j7g4Ll
	vFp2nGajgxnnxEoVv3ZYZ8M5n1xiz7h3BlkK+BOdjw==
X-ME-Sender: <xms:rKQlY47s17PG-7EztnXEHgVyhOcuQezgmsIabgGAzRJEx-Pv_FAPRw>
    <xme:rKQlY55oVRBO497zW_FDKtuO76lttwVgavALPI93p7_5q8g7RQHJzIqprVvPzLVZA
    _7NVJU152vYWg7EgG4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvvddgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufhv
    vghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrf
    grthhtvghrnhepleevgfegffehvedtieevhfekheeftedtjeetudevieehveevieelgffh
    ieevieeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshhvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:rKQlY3fXYx1Diz8XUWJOFrcgAmqzrEU6A4e7O0f6XhYWb6_pPU2J5g>
    <xmx:rKQlY9ITr0-eNPZEs5-zPjrxTjD7qyn5_coZ69aTB8YHIIRPq6uTPA>
    <xmx:rKQlY8LgNdfCS0-5UB8V-NWaPTdO3qBE4BKePW3jMnO_9bVnH9xWjA>
    <xmx:raQlYw3yTe7UMJJUfcmwAPkym7eraYI1yQjbayu2zjKxuliSVOGHTA>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7057FA6007C; Sat, 17 Sep 2022 06:42:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <19191d4d-e8a8-4319-bf7b-d5301a792a21@www.fastmail.com>
In-Reply-To: <YyGR+z5nGPh66LdY@shell.armlinux.org.uk>
References: <YyGR+z5nGPh66LdY@shell.armlinux.org.uk>
Date: Sat, 17 Sep 2022 12:42:30 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 "Jassi Brar" <jassisinghbrar@gmail.com>
Cc: "Alyssa Rosenzweig" <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 "Hector Martin" <marcan@marcan.st>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] apple rtkit: add support for atomic operations
Content-Type: text/plain

Hi,

On Wed, Sep 14, 2022, at 10:34, Russell King (Oracle) wrote:
> Hi,
>
> This series adds support to the Apple rtkit for atomic messaging,
> which will be necessary for SMC support on these platforms.
>
> SMC support requires a bit of rework after recent review comments,
> so I'm sending this separately in the hope that we can move forward
> with upstream kernels.

Maybe I misremember or maybe you forgot to pick up my reviewed-by tags
for the mailbox commits.
Either way, for the entire series:

Reviewed-by: Sven Peter <sven@svenpeter.dev>


We'd usually take the last soc/rtkit commit through the Asahi platform and then the
soc tree. Taking it through the mailbox tree will make things more complicated
if SMC (which is the only driver that uses the poll API and hard depends on it) is
also ready for this merge window. I don't think that's very likely so taking it
through mailbox is also fine.


Best,

Sven

