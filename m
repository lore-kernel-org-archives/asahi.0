Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF861367
	for <asahi@lists.linux.dev>; Sun, 19 Feb 2023 12:42:17 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 250B03200437;
	Sun, 19 Feb 2023 07:42:16 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Sun, 19 Feb 2023 07:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1676810535; x=1676896935; bh=aY
	EIOi/mXoLvIOxTB00nEm2fcG/4l2r6BthM9ewwQds=; b=odHxo0HhAyJqFM8g5T
	nbckLglSwAhTv8dHA1jRF3esdy7gqCQSscWoiO1nVSpUWdlcKMNXogBEP7+sx9cu
	YS23DC11sy9xj8i70JftzLxYYoj+KIhUCAzIltvm/eaFHhJqWO3LkII+SGgus9Z+
	4aJwukQCN2VnMPcMTwnRQANho1naAEqlgn1jgDFv29xqsECyrOs45r7Sr4zI8RHD
	oiGMa8vmmM0QSU8FxMQThNTeZY/V833YTqNXYDsQ7/T4C8ih7XdSOgRicM52z41w
	qKjNDxu2OmTXuYuI3JdyE9hhY+uGXbSgbkCZP+hVOOFKF9gX+dwYA6hzrHMsdAFs
	/kgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1676810535; x=1676896935; bh=aYEIOi/mXoLvIOxTB00nEm2fcG/4
	l2r6BthM9ewwQds=; b=V8hCZZ7JLOQDrsHzKpNQHwcI4jgeTmxr82bE8zBXiGqM
	VW2KoYVj9gcU1NsDsUuJ0qdCURsZCB2EPkI+Auxdwkw/MuKDXk/9d7dAXE0ptyW9
	3jVXtGIF6aP0cOzWfupFKEbv7tSv4DfVVC4iEtVaV7GiUEzio5yMGmjtpypMWy+p
	obtZ0bM4S8Ne/4rqPy+jOkTPBvBG4JBUjXGnNEvaAVF0nhvpwwNQqqD2L5mvxSap
	xxNOEJtxAqYOYWu+wSJDn7t6GyKc1Ng15Zz+EBDtoWtmAmbC0Bj76jgkzljmIo1g
	t2xqXMn/JugPmP4kLeuKj+VMYI1+uMOJfBhbflR5Kw==
X-ME-Sender: <xms:JxnyYwcCViEZqVSgJvOtuje1Jg8Y1c8uSCbnBmOZ74etkZP7BMbu_Q>
    <xme:JxnyYyND269spxTFRhzCeQ3AcfCELKKwX7yiyATFLhKzGio1h4R11bylSvl32_r6T
    jyO4kHTcUlL9FPU2X0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejfedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufhv
    vghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrf
    grthhtvghrnhepkeelkeduledvvdfhfefhlefgffefgfdvheejgeejhfehjeejgffffeei
    jedtteejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdr
    uggvvh
X-ME-Proxy: <xmx:JxnyYxhgURRVG5sejjh-39kh-292WewvlkQZ1bj13bMhecBqkvI7JQ>
    <xmx:JxnyY1_m_m0gAdD7yx67UxkE__YeN444IQk0kKkK38FAtiRwhUGCNQ>
    <xmx:JxnyY8s0WdZ26MUw9sIwvAM2kn7gvEaTLD6LfCy_CywkkDFQ8go6sw>
    <xmx:JxnyYx_cd9shU-LLDCBghE77xxeFQmysge9QJ4UaCp1hTKHan0uCBg>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 867CBA6007C; Sun, 19 Feb 2023 07:42:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <782bc40e-842e-448c-89bf-73b3d8666344@app.fastmail.com>
In-Reply-To: 
 <20230214-apple_dts_pcie_disable_unused-v1-0-5ea0d3ddcde3@jannau.net>
References: 
 <20230214-apple_dts_pcie_disable_unused-v1-0-5ea0d3ddcde3@jannau.net>
Date: Sun, 19 Feb 2023 13:41:55 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Janne Grunau" <j@jannau.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Hector Martin" <marcan@marcan.st>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Mark Kettenis" <kettenis@openbsd.org>
Subject: Re: [PATCH 0/2] arch: arm64: dts: apple: Disable unused PCIe ports
Content-Type: text/plain

On Tue, Feb 14, 2023, at 15:07, Janne Grunau wrote:
> The t8103 and t600x device trees deleted unused PCIe ports. This was
> probably done to replicate Apple's device tree which doesn't has nodes
> for most unused hardware.
> A more accurate description of the hardware is to disable unused
> hardware.
>
> This was discovered during the review of the t8112 device trees in
> https://lore.kernel.org/asahi/1ea2107a-bb86-8c22-0bbc-82c453ab08ce@linaro.org/
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Janne Grunau (2):
>       arm64: dts: apple: t8103: Disable unused PCIe ports
>       arm64: dts: apple: t600x: Disable unused PCIe ports

For the entire series:

Reviewed-by: Sven Peter <sven@svenpeter.dev>


Thanks,


Sven
