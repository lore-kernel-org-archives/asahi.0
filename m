Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7711C33506C
	for <asahi@lists.linux.dev>; Tue, 10 Feb 2026 21:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770757432; cv=none; b=hjWVvB6HI0GOvR9OXBob4z/ahr97eMjf63hlBPOWlGBNthALi0R5Yn3HoJNuKRMf2xxoFXEC5VbKT3LBcm1MBh2UjV4G7/Bj0+KSdaJUEALiZSWn9Y6KhyUnn1wm0cNlTyxVuLZOpM4+bOrrkHuvrREDrel31In8wC8PNsErpFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770757432; c=relaxed/simple;
	bh=v2F4lRC09DNyNnJD2ttzcRUS3ae92KAiDkfdH/EDDW0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=BytLjEeIVp+cphM6VQLs9HpRAa6liS3c4srdW4JZsa/sdAUjSWaIeL2YcNupQ/W6Kk/eVVdoEA/VbqW5Lv+nC7Qlq5KI9ZpcXio1bonZ5Dq9xIkXEG5NJXkOI8UsUN++xw9zF9pPdxrRlJ+hjVZRwzdo0mFbE+WHPUjPqTx1Ejk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=VyMH0UYo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZaGqqAnL; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="VyMH0UYo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZaGqqAnL"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 8A5BEEC05FE;
	Tue, 10 Feb 2026 16:03:49 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-09.internal (MEProxy); Tue, 10 Feb 2026 16:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770757429;
	 x=1770843829; bh=v2F4lRC09DNyNnJD2ttzcRUS3ae92KAiDkfdH/EDDW0=; b=
	VyMH0UYoBPCicmVTYHQsjtYBvOVoB8CNC4ICPq10fy/tCij9achP3L67zsYjXP/D
	AGsa6LGmqk9F07u0JWwnfWhtnxhQ8/3evQHJR4+lNpAAOSXIuJTmnqOnXvT7/Hcv
	JBRGdSnAEFMimO7YXAVya++pmO1Rhc1S0NfIBTKMJTp8spHZic+8KOCo+U3dJ6wl
	lqpc+BnLVR9opa2SrkyiTVsAIZ+t4oGkZaJN1owuWCDsj194XMvJDcRvvYG3RtZU
	0XzFndyDS4aR6sI4gmt50DtSzHtHxmCNqBx4r7eoDh7nL1a4EY1N3M5xULVavsM5
	JlXz7j8QuzFV4ohM7y3+AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770757429; x=
	1770843829; bh=v2F4lRC09DNyNnJD2ttzcRUS3ae92KAiDkfdH/EDDW0=; b=Z
	aGqqAnLNZ1iQR0VR6WMui8EVciooX7clPO+Z3sHYHuvB4XpEOuJjDIZeCFo7ZsG/
	wJjXQTkdlQF5nO+FGzzT3Gkbp2Do1bhXgqDf8LICh5QwB3CM4mFPs1uQGynJviO7
	W0ifylxrpUP8ztTz+8f79RIZv/RBZfOo0O2LU5V/V5nWf/6Q1QdRhyRMCEKJmdOW
	fwSGF5Cpxd1z9+qrGr5/MO/emBjROSTEb8Gly+abw1KYwrgGn4lNHiN38Z6Ts+Un
	r64B7uHQpJf5nyDCd4UsjpAKZS91vQ0UzWBemlAoNmX0B4uDcOOpjQqbd96JaNga
	UwpaX/RukRPU5utkQY+hg==
X-ME-Sender: <xms:NJ2LaUpwv29GbgxKb8V1diEmqhcTyB4lS-TxjM_KOTA-spNqfzRiJQ>
    <xme:NJ2LaVcfLB88XLc5D1UakpIMJW7xescHEmyO11xVzeCbiO6BM-Om_SQBzF95HVfLZ
    l4SBvgc398mLmV8opQT4g3cO2elsdGrlmzIlRUHCBE07PcoTa-dBAZj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtddtjeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedflfgrnhhn
    vgcuifhruhhnrghufdcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnh
    epheejtdeffeethfetgefhffejudegheefueejtedvhfeuheevfeekheetfeduffevnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnh
    hnrghurdhnvghtpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehfnhhklhdrkhgvrhhnvghlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsh
    hvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmvgeskhhlohgvnhhkrdguvghv
    pdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:NJ2LaVRSgPQBNIIEkLoGciYzKWFtQmdct0iGDfQOl4jANAiYjpLAxw>
    <xmx:NJ2LacmTKvtuRGg_kjSvi6SDIuSnGJbE6-y2RfPgFrYpWuoShbdE8A>
    <xmx:NJ2LaVS4dGpFEwOWKNnA4vDHFLhVh8VzoZ30Onh-yk3nwPJdheDWlQ>
    <xmx:NJ2LaaNBVEUUzWjhXNLwuUlOCC4zD8WOwORUeVHfLto2MPIjwXGlKg>
    <xmx:NZ2LaQH0NNS1Ok6ANKAnWRytVJSaS2BgxIXPrh6IIk638ybfCPebTkIa>
Feedback-ID: i47b949f6:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D3897700069; Tue, 10 Feb 2026 16:03:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AkIrrnlxGvb-
Date: Tue, 10 Feb 2026 22:03:28 +0100
From: "Janne Grunau" <j@jannau.net>
To: "Fiona Behrens" <me@kloenk.dev>, "Sven Peter" <sven@kernel.org>,
 "Sasha Finkelstein" <fnkl.kernel@gmail.com>
Cc: asahi@lists.linux.dev
Message-Id: <c87d7b7b-ead8-41d8-81b6-4c1245695f8f@app.fastmail.com>
In-Reply-To: <20260205-asahi-iio-aop-cfg-v1-1-c83e3b00fd0e@kloenk.dev>
References: <20260205-asahi-iio-aop-cfg-v1-1-c83e3b00fd0e@kloenk.dev>
Subject: Re: [PATCH] rust: iio: common: Change cfg guard of aop_sensors module
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hej,

On Thu, Feb 5, 2026, at 16:02, Fiona Behrens wrote:
> Change the cfg guard of the `aop_sensors` module to the direct config
> symbols `CONFIG_IIO_AOP_SENSORS_LAS` and `CONFIG_IIO_AOP_SENSORS_ALS`
> without checking if they are set as either module or yes.
>
> This fixes a build error when `CONFIG_IIO_AOP_SENSORS_LAS` is set to
> module and `CONFIG_IIO_AOP_SENSORS_ALS` is disabled.
>
> Signed-off-by: Fiona Behrens <me@kloenk.dev>
> ---
> The old cfg seem to be created due to a copy past error where two times
> the same cfg is checked.
>
> This is meant for the asahi downstream kernel as the iio rust mod is not
> yet part of the upstream rfl kernel.

merged in in the downstream kernel, thanks

Janne
