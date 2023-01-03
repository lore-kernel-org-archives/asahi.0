Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A16228E1
	for <asahi@lists.linux.dev>; Tue,  3 Jan 2023 11:38:05 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 08B945C054E;
	Tue,  3 Jan 2023 06:38:04 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Tue, 03 Jan 2023 06:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1672745884; x=1672832284; bh=p2
	IVLcKLfYVfXq3tOPJfy9fqA+CIFIvOUBhc8QFZ2+A=; b=MUklIHs7gzCKpEOO5r
	1bvq39xyx/Ea65nv5IjDv1iCvNH/6Z8WEFI2t2t6X71A3lW8Uf84p0yO9jIuK5Ju
	6HIfSgSkuuNiyNQYQywdagyZAtcYuOK4UQLhxlOgmSBosH94XXl1puDwlNPGa9nx
	aG73MPQAMtCb7CEO22tiYdOqbXZazX48aW9iL8EBoEntbXjo4WQdBwZvEzz7w4u+
	nkpCMDaS2+bLkZbYVl7BbOnGVpbAcIS+KFdQCYOT2iAuKSHbanLQ6aZGsZdQgw5P
	uRRmSmubqqCdVIv7McKCKSeuLo+KxqFEVzCEh9Z6NbF+zO0cgyXFPryORAD/+W8e
	drGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672745884; x=1672832284; bh=p2IVLcKLfYVfXq3tOPJfy9fqA+CI
	FIvOUBhc8QFZ2+A=; b=RRR4lGdjU5qgZWpvlv7gWOBZ+3ZRLIELrTKSLtEgij82
	porsHf4hPpfNiMHANXtr/wqFpRYBtS+FcMKxBVl4h1fDGv0LxvvipaOjcmrKs6/X
	EtibEmdZwTsh244r8W2PTI5fycD/JWkCzxIPTyNepswPdN5G76O5xHws9ugCuyQj
	ZaBEC7gyI8vfFtv3rbGpbRsYneHl9tL8VV/zCKMXROPG0c1Ij2D10u8J6kTLaL1w
	einiw+wzG1MErWu+AM8MmK65sHhwSFgiAEsvUfHaGqKzgzAvnx69dobegdY9uHY/
	VcaABIbeGCsUd5GrwmaDOx5aL99m5m3eEKkqpyfM7w==
X-ME-Sender: <xms:mhO0Y59Z8i4B82a-n6IP83_yBP1xx3s64NpzImujxMdlKAXtMj18Yw>
    <xme:mhO0Y9seP4KSGIGcSHtz8s9WS5ZTyXrtoOJST80rMy4OchRQr8qvJJGlsjfb1dvwa
    cAUJhnuKzNpAPj1vpc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeggddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
    nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
    htthgvrhhnpeelvefggeffheevtdeivefhkeehfeettdejteduveeiheevveeilefghfei
    veeiueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:mhO0Y3A93X0nfCn-JQFPV80WZ9BD7yh7UhiFzK2qZ8pvJWxwjt-5qQ>
    <xmx:mhO0Y9c0iWRIX2rPJnofnhBZGQLVKhcPJNE9-zVAWDzjlbswZ-eA4g>
    <xmx:mhO0Y-NtXHjs3l9Ony8srFU_GRXqN3QpK79jL77fnKcWkTpMaIw4LA>
    <xmx:nBO0Y9cV6p19-b6L8Ui7vqw_Dh0inHu_2ZXe3MazqtTDpHAfdSNf2w>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7E4CFA6007C; Tue,  3 Jan 2023 06:38:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <8b8a3f31-936f-4595-83aa-8e5b0272f8a3@app.fastmail.com>
In-Reply-To: 
 <6f312af6160d1e10b616c9adbd1fd8f822db964d.1672473415.git.christophe.jaillet@wanadoo.fr>
References: 
 <6f312af6160d1e10b616c9adbd1fd8f822db964d.1672473415.git.christophe.jaillet@wanadoo.fr>
Date: Tue, 03 Jan 2023 12:37:41 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>,
 "Hector Martin" <marcan@marcan.st>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>,
 "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: apple: Use devm_clk_get_enabled() helper
Content-Type: text/plain



On Sat, Dec 31, 2022, at 08:57, Christophe JAILLET wrote:
> The devm_clk_get_enabled() helper:
>    - calls devm_clk_get()
>    - calls clk_prepare_enable() and registers what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
>
> This simplifies the code and avoids the need of a dedicated function used
> with devm_add_action_or_reset().
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Sven Peter <sven@svenpeter.dev>


Thanks,


Sven
