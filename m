Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594651378
	for <asahi@lists.linux.dev>; Sat, 17 Sep 2022 11:34:07 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 3F6935C0156;
	Sat, 17 Sep 2022 07:34:06 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute2.internal (MEProxy); Sat, 17 Sep 2022 07:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1663414446; x=1663500846; bh=hW
	0BGg6FLWAx0B92Hm9903DZr05nI5+OYUU/9F7yaSM=; b=vZX0NM78Z0AqAie16l
	za3ZmMVqd4n+fu8ZqWrMW6im9SNJ3VTkDhuY35Cl5AOdQfBnlHoSsx3KDhj/8Vlo
	DS5x00eKVP5qM5SiEjcsfMA3OwVfCDCgJG5DJx/Z4nB2od8r6ZUcDfwd5WtyBEEY
	/gRej3RVfQXM+WuotWR2OVSw4QbGfmZj2GW7dMzbwcnj+1spTtMhLSck5T3UCshv
	UTFwqRap0WuLBZHx5cCR/F14K4xei0RfX8r3MNsPOBEiNUJl5HQ/KRr2z4XZUhrS
	uVAQk1tTP3E1iI4g8z2ivWQgk6OV6QQl22joYNlULX1JvcywJXTbkEAv7z4KCWt+
	YImw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663414446; x=1663500846; bh=hW0BGg6FLWAx0B92Hm9903DZr05n
	I5+OYUU/9F7yaSM=; b=v1uYPpBrjaowBgmiO3Wr9VHgWib16Ko3ZCiXRKUX9zTs
	3tb5syjFJhKfprwfLqXZXV9EjSYzYAKEpigG86sH7Vjag6t2QDaCbexS0+tsJIlh
	K0q/w7RH3oeY4v6tWZuMCtShIY/xZWCYR8Lr1+ray3KZ1Xozl7k+jrI3A+QaWSMU
	x+6j17HPKXAdCU5/BfPjfYOMkSn9FieWt8vEjNmnkaW1ixhxONcOWzxi9diEqRnp
	96gglnqaG5tCwNzP0BQmbKJ2y9fbPtZbIYOd7SHmJyowqIY9GpM9czJgAJw9kvcH
	i6BTrmTTcfEI+/B318sueMtXoVKCsw/WM1n28unhCA==
X-ME-Sender: <xms:rbAlY75vN9aO19x93BfIKJW1pcJFz03TMJhsVVLPwEH_v42NQXaBYA>
    <xme:rbAlYw5kHRM_hnDypbDfvh7-TX8kqiQRDf62pEZ_CZbea4ZBVK7kUlgO6y6WfvAMB
    S_qmOVIVwFeFw0y91g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvvddggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufhv
    vghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrf
    grthhtvghrnhepkeelkeduledvvdfhfefhlefgffefgfdvheejgeejhfehjeejgffffeei
    jedtteejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdr
    uggvvh
X-ME-Proxy: <xmx:rbAlYyeGsONrx6i2gpnMlACKjYhTxh0U_qL4dGn1xSA_kaW5xq2W-w>
    <xmx:rbAlY8KUh01pl76OXFI8Izki-d6LpHtHN8X1HcC8Qs5JzC3kerPG4A>
    <xmx:rbAlY_JmfG1s5_5cObxBy49DoKy5eAnw8cFtBJPWj3kJ7qQ3wq3F2Q>
    <xmx:rrAlY30SYHOg0LSKJwjuIzUZUvxAawJOz7jXMEJOG1rFiOPLXr83qQ>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 89DC7A6007C; Sat, 17 Sep 2022 07:34:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <b601263b-8363-432a-b6d7-504fabd37fef@www.fastmail.com>
In-Reply-To: <YyWtz4u5fcxQAB4R@shell.armlinux.org.uk>
References: <YyGR+z5nGPh66LdY@shell.armlinux.org.uk>
 <19191d4d-e8a8-4319-bf7b-d5301a792a21@www.fastmail.com>
 <YyWtz4u5fcxQAB4R@shell.armlinux.org.uk>
Date: Sat, 17 Sep 2022 13:33:45 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 "Hector Martin" <marcan@marcan.st>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] apple rtkit: add support for atomic operations
Content-Type: text/plain



On Sat, Sep 17, 2022, at 13:21, Russell King (Oracle) wrote:
> On Sat, Sep 17, 2022 at 12:42:30PM +0200, Sven Peter wrote:
>> Hi,
>> 
>> On Wed, Sep 14, 2022, at 10:34, Russell King (Oracle) wrote:
>> > Hi,
>> >
>> > This series adds support to the Apple rtkit for atomic messaging,
>> > which will be necessary for SMC support on these platforms.
>> >
>> > SMC support requires a bit of rework after recent review comments,
>> > so I'm sending this separately in the hope that we can move forward
>> > with upstream kernels.
>> 
>> Maybe I misremember or maybe you forgot to pick up my reviewed-by tags
>> for the mailbox commits.
>
> It's the first time I've sent the mailbox commits after Hector
> mentioned them.

There are just too many things in flight right now which is part of the
reason I'm happy you're trying to get all this upstream!

https://lore.kernel.org/asahi/YxYoW2IZFK%2FJdKgH@shell.armlinux.org.uk/


>
>> Either way, for the entire series:
>> 
>> Reviewed-by: Sven Peter <sven@svenpeter.dev>
>> 
>> 
>> We'd usually take the last soc/rtkit commit through the Asahi platform and then the
>> soc tree. Taking it through the mailbox tree will make things more complicated
>> if SMC (which is the only driver that uses the poll API and hard depends on it) is
>> also ready for this merge window. I don't think that's very likely so taking it
>> through mailbox is also fine.
>
> I'm sending these seperately because I don't think the platform/mfd
> issues will be sorted before the merge window. We've fallen into the
> trap where I have a load of updates to the patches in my git tree
> that aren't in the Asahi tree, but Lee wants some substantial changes
> to the way the MFD part is handled which I think Hector needs to do.
> So somehow I need to get my changes back to Hector (I don't do github)
> which basically means digging out the original patches from the Asahi
> kernel tree and supplying diffs to Hector for those - along with all
> the acks/reviewed-bys etc. This *really* isn't nice.
>
> I didn't follow that discussion very well - with about 130 messages
> in total in that thread, it just became too much for me to keep track
> of, as I explained as the discussion drew to a close. That was the
> whole reason for me sending v2, which essentially mostly got ignored
> and discussion continued on v1.
>
> So, basically, trying to get these patches into mainline has created
> a hell of a lot of extra work and difficulty - and at this point I'm
> wondering whether it really is a good idea to continue with this.
>
> It's fine if the comments are all minor issues that can be quickly
> resolved, but a major restructuring is a completely different matter.
>
> So, to at least get some progress, I decided to send what would be
> possible to hopefully merge during the remainder of this window.

yeah, I'm just glad this is finally getting some momentum. there's just
too many things in-flight in our downstream trees!
I didn't follow that discussion entirely either but I also don't think
SMC will land in this merge window so taking this through mailbox is
completely fine with me.


Sven
