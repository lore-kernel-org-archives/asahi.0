Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FCAA20
	for <asahi@lists.linux.dev>; Thu,  1 Dec 2022 18:35:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id AD3955C011D;
	Thu,  1 Dec 2022 13:35:28 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Thu, 01 Dec 2022 13:35:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1669919728; x=1670006128; bh=pk
	8Iux6YCMVT1etqJvZ4tJrrAsulMlBycPs6sKsttUQ=; b=OUj2zLcKJCTLZrp1mC
	/5W5Noq5Vge2GPO5f/7z3TpMnBRcTR/KY1urq8Ja7omLR+OOobQe3F0F864TVmJf
	aFF35KEHAJ2A1OvBu6vyHZcJnp0KB6tjrNpUAPRXqG2Zg/zK30nQdAme6UeHcR4i
	mGZbvcYgyzCGCjKShEXgA5Eh6XrNbCfcRKhlLcY61y3BXj1CTWk6S1oblJwL6EeV
	DzdoQFBvUoWOgQYzWbXTQEd9x6Jc4CgyCOgbOjeKY4kX76qsFkRU/gOHhy7jcRy8
	3a/2bmg17rCWfg+wYS6HeWL5qpd3CRsd8oBHNQVCp8vWHFUSmf88Rv+/8gUOs3DQ
	Kp/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669919728; x=1670006128; bh=pk8Iux6YCMVT1etqJvZ4tJrrAsul
	MlBycPs6sKsttUQ=; b=fN4KW7tr/2ZMlCyZY+s5+aJKrBrwC3DAZxsEEhxoEcH+
	B5gNMXL7V8h/Ads1qajiSfT6hRCvdNApKM+uwsXht/PAWHwTbPE+x4pekyKws1RL
	4cR5N5+nxH7HT95+kjEsHAZj542wv0KpSphchtFcNWBZnCgUJCJXtw0BG7Le/sYA
	CRJ6UN65RQP8OYvEXgJ8oni4/KK9pLXPe/LorBNHJOnb5p2Z7nfYDNkZjj85MZoa
	8LmfpRdQGxa9ptzRin+alxju2i8ZjRZkYDKOOtfWgpQDXfPdz+9df5b4zna2OujE
	MXlMN7UbjYVU8D0m8FF8NxuM7IpabqwVlZ+KSYOg9A==
X-ME-Sender: <xms:8POIYzQQkj7Oq9NVxaP4uWI9oumU_Jovfh2YTEP8Uq7ZXdxjC1SI1g>
    <xme:8POIY0y6pS7jve2HmTaXZXC901d6p4a6Uornn5z_BY5QKHtClFOxGljNv6INwPSzr
    aVCgs9QPw-PIoUNIdk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdduudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufhv
    vghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrf
    grthhtvghrnhepleevgfegffehvedtieevhfekheeftedtjeetudevieehveevieelgffh
    ieevieeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshhvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:8POIY43yYF8Q6lH-VhnGcQTi452WO8X9LzvVJwhmqJtDN5Nnp62YUg>
    <xmx:8POIYzBgEduUjpxPDvWhu6ZBAbvL61nb7FBtqYYxiDn7NHs79MWj4Q>
    <xmx:8POIY8jYVGtUJ8_hn2YKxdjeUa5RNeL0A_H8owM62cgTjCVw1YTrBA>
    <xmx:8POIY3XqM4pEIKo_ymhC8JNgbepCzKZoc78a1hwzmYNUUKQKY9Uy6A>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5A76EA6007C; Thu,  1 Dec 2022 13:35:28 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <60e1a46f-b180-496c-bc45-348969bbac32@app.fastmail.com>
In-Reply-To: <20221201165344.32505-1-marcan@marcan.st>
References: <20221201165344.32505-1-marcan@marcan.st>
Date: Thu, 01 Dec 2022 19:35:08 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Hector Martin" <marcan@marcan.st>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>
Cc: "Mark Kettenis" <kettenis@openbsd.org>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apple: Add CPU topology & cpufreq nodes for t600x
Content-Type: text/plain

On Thu, Dec 1, 2022, at 17:53, Hector Martin wrote:
> Add the missing CPU topology/capacity information and the cpufreq nodes,
> so we can have CPU frequency scaling and the scheduler has the
> information it needs to make the correct decisions.
>
> As with t8103, boost states are commented out pending PSCI/etc support
> for deep sleep states.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>

Reviewed-by: Sven Peter <sven@svenpeter.dev>
