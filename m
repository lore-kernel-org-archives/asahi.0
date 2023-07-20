Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F360818C25
	for <asahi@lists.linux.dev>; Thu, 20 Jul 2023 18:55:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 893063200124;
	Thu, 20 Jul 2023 14:55:56 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Thu, 20 Jul 2023 14:55:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1689879356; x=
	1689965756; bh=VlXcKq8r5CvDv0CQjr1ifJgqgPG6o4lzBf7CAsOaYZM=; b=Z
	9dpjKXFJx6E45rGhQTEV52gxvEbjHOelVthAwRJS6cG8c6GxcCx//r0a3GUSoHkX
	yUqFaRRQS5dB8URGVRxLIXnel2gk2wqziQqQxDo6HPQ8Q3RXE2BxySHNO232FIuM
	xtuHcPRuHzr6c1zkLDANxy7BBf5EdepwPtYuWnDdufESlLxbqykO3lLbrh25KgPJ
	12j6mpjWOWbW9rhuayi20DR3wwdgsaRtcVIGSHqUzfyk8qVnQHI9Dc+uiXdJZt+5
	wbMVlvUjJiGaMBBgXnNk+FkHVFLY5d8/9opd6DjF7QZb80Em+dYw3t8/OnQK9cU1
	gnN1l8FLjEXiKm1SQaVVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689879356; x=1689965756; bh=VlXcKq8r5CvDv
	0CQjr1ifJgqgPG6o4lzBf7CAsOaYZM=; b=MR+lC1CyfZRZhHHseDJBYoY1Nowk+
	rXvJx/agWc6q5w2QrSUUbh+EaZf6+V9ZJE/4SZWH1eKQXU80CeEgJr5QbX7hshww
	a2UDx4PUy0oY5QGMUBvQskEhOUy9CkwPXFr5kEvLxtdsfBMbaCZfpDuxakvIX3pS
	3hmhUkFCIYS3rzujR/Z29cZYoenR5IMHNcWenOnijNdtSoEtOH8DC2vO7DLc0B5k
	gLL/8/UTdvsq3L1UYqD6jXId4D6CqEoDUt8unX/eAcAZXeGmWPijTUjOUJlU7fT5
	PRMqllQ+ICabl2km7yJzEvUHEsuy0AWnZtfzCQOQWUPQ0Jls5gprQXrQw==
X-ME-Sender: <xms:O4O5ZCKrcphA5Ki_6B6jEoHmSvxi1q-uf7-S6pajJ_UuTQHkybOH_A>
    <xme:O4O5ZKKF4XXiXqve39sE0cVhw-95f1P5Yjbgg7Cq-uQUuTBbf9NLYI-re04SBf2A6
    RqXwmVK6rtfWf9JS2M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrhedtgdduvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufhv
    vghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrf
    grthhtvghrnhepleevgfegffehvedtieevhfekheeftedtjeetudevieehveevieelgffh
    ieevieeunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epshhvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:O4O5ZCvKzXNfZoowqJSQQMHfK6sTe80gSOgKTfWAg9JYIJFlcPQ58g>
    <xmx:O4O5ZHYiySCowtqcO0lst1ko5KBkldl20bkaPEHAccB_zoHec0P6CQ>
    <xmx:O4O5ZJZ0pf9JBp6lvzyztia23uQvRVlulcUQtISU_K5gTwZSEH8INw>
    <xmx:PIO5ZIUREdiI16X5iWkZR3SqelLO0ht1PVeND3tlGGPkiTUGb7F8zw>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A139CA60077; Thu, 20 Jul 2023 14:55:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <1e16e400-0dbb-4ba1-a0a5-2380b50fa60a@app.fastmail.com>
In-Reply-To: <20230719223848.138363-1-minhuadotchen@gmail.com>
References: <20230719223848.138363-1-minhuadotchen@gmail.com>
Date: Thu, 20 Jul 2023 20:55:34 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Min-Hua Chen" <minhuadotchen@gmail.com>,
 "Hector Martin" <marcan@marcan.st>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Philipp Zabel" <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: apple: apple-pmgr-pwrstate: mark apple_pmgr_reset_ops static
Content-Type: text/plain



On Thu, Jul 20, 2023, at 00:38, Min-Hua Chen wrote:
> This patch fixes the following sparse warnings:
>
> drivers/soc/apple/apple-pmgr-pwrstate.c:180:32: sparse: warning: symbol 
> 'apple_pmgr_reset_ops' was not declared. Should it be static?
>
> No functional change intended.
>
> Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
> ---

Acked-by: Sven Peter <sven@svenpeter.dev>


Thanks,


Sven

>  drivers/soc/apple/apple-pmgr-pwrstate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/apple/apple-pmgr-pwrstate.c 
> b/drivers/soc/apple/apple-pmgr-pwrstate.c
> index d62a776c89a1..9467235110f4 100644
> --- a/drivers/soc/apple/apple-pmgr-pwrstate.c
> +++ b/drivers/soc/apple/apple-pmgr-pwrstate.c
> @@ -177,7 +177,7 @@ static int apple_pmgr_reset_status(struct 
> reset_controller_dev *rcdev, unsigned
>  	return !!(reg & APPLE_PMGR_RESET);
>  }
> 
> -const struct reset_control_ops apple_pmgr_reset_ops = {
> +static const struct reset_control_ops apple_pmgr_reset_ops = {
>  	.assert		= apple_pmgr_reset_assert,
>  	.deassert	= apple_pmgr_reset_deassert,
>  	.reset		= apple_pmgr_reset_reset,
> -- 
> 2.34.1
