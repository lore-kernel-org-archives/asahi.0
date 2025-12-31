Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38F726CE25
	for <asahi@lists.linux.dev>; Wed, 31 Dec 2025 15:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767195769; cv=none; b=giG7YflBw4KNSXGbenPQzVQ3mSb9/4Y6m+/ZnVSQQzOubLB+yL+wQM/U9LZDANQaJYke25zEy6z0kLlgjjkjhE2HPC22OVd5xMuJ6NtLBTjq8skrq2tO8KOwLYLOd6qI9E3x5/hFiW/x1pN9kuuNjk4VDd3Xl2EzB0ZMXkneOCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767195769; c=relaxed/simple;
	bh=Uw09thzVOOvg9JNmBSGqTgng4jYapQ8QHlGPEMlOegU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mn+sI/RTUNTm7YDSc7qU7uCP4W9s3UntcLPdnPNBQ8DSTd3m0lOjuIdfggCfsirCSGkQhzXNf819xIi4+cxrIypkCc12fiMRYEjt03p3TKMfG6N0eXwe+HqIxMBkqY1HAbb2gkzmF6E47MGY8zuPq7Um2hqlGlvfk5eImaWWR2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=DQ/H+DSZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hgQqoRK6; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="DQ/H+DSZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hgQqoRK6"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3EE3B7A001F;
	Wed, 31 Dec 2025 10:42:46 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 31 Dec 2025 10:42:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1767195766;
	 x=1767282166; bh=H/4tOhKzvmXBJvbN6rQ3tIZcm6ERDEOoE4JXkiLEUlg=; b=
	DQ/H+DSZKAFZoHrGy1eCUIud8FA8k8qiateBVg/v2CGFGDBHh0pxGQin/6J1KiP9
	AUIdmGrKP/0nSYJNeQGAlxNA+CjjCNNSYbWADpwCzin/lR5nbSH+KPHpRrBt0KJC
	kuEB1AkZbnb2SBRzYyahHJCmBWOAo1C56ro0fwr0FDp/SNadGkT+0iz1BAJcP5Dg
	yiKzKvKtMdonSatbZ8/OnCMxETp56FLQ24wIO/fgqryzJ+R23x0NYwfWO10bh0Tu
	1WRHSciHeI0W5KGVUPZh+AqGc4pLM81kbODXb9wrg64p+d/FfRiuOUhncRacvxzL
	Ix2K8ODDbOemx4jWM2SCIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767195766; x=
	1767282166; bh=H/4tOhKzvmXBJvbN6rQ3tIZcm6ERDEOoE4JXkiLEUlg=; b=h
	gQqoRK6gdnfLo6FdDcvoLdOb1iGq6JpA5er/cbflJRCqyw1jMgnUbj/l1GTJFsMG
	v0Jh7wHxjcR7szijzaSCEFBWnOpKQriwDcC5bdgAlLYrmtJYZJ756CDEVxv+psO5
	vSO5Qlk98w5vREDuTLhDfsMPhWsgGwDzlNy2VgDZ8wOfGJavdAA0fv2xkpwKvMkf
	GhHA8tSHxhn7gOWS1FAjvGBpHx+UbUhurAhf5oT5KWp4cDRAyV3TxUv4KWS51EOg
	NF7rmvARs9zDz8Anv2BFMC0kgZKG6t4nB1bX/tVrgXsJEitBS6Ne0k7GuD+7yFRt
	3YvZbpdlxHonzn+Dnq1xw==
X-ME-Sender: <xms:dkRVaWocZwpKY06znzqoz6G00kXHCrvh0s2EzslLKfsv1FK1cFeB6g>
    <xme:dkRVaQpT3g_GxpTvAoX8EqZ50HSVJuT5RN34xhd2wsKsR3e-nO9IN3w1jfB-9WD82
    Vkx6BHHUGIfR9gwb5uE9U8ZyTjv2Ws6gFetMGbqXTjasf0-YdaqEg>
X-ME-Received: <xmr:dkRVadanPzweAEV9yNhR3-vSwuARnPsHVC25h4PXRV98zddmzJl4pxsQ2zK9GnrMRmgGlL2MbCz2r0Ae56As-HXQsUHMFxGYk1h1RA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekfedvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeevke
    ekgfejtedtudeujeegueetudfffeetjedugeeiveeuvdeiffetleejlefgkeenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopeek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoh
    epfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtrghtrghlihhnrdhmrghr
    ihhnrghssegrrhhmrdgtohhmpdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrh
    hmrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhs
    rdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:dkRVaW-a4FcOH0XfD9Zb2qPzMjIjVsGT-8tTUQDkff_AeK9bLKEmXQ>
    <xmx:dkRVaTlQ01zVth3J6MNBHjMmly9G-KaUqjKcUnpDHL6iO3ODsrs3Ww>
    <xmx:dkRVabwTJdATNwXWqfj_J_qxuoHcfP4GMIImVZZFIMrJXueoNb5ypw>
    <xmx:dkRVad5-VKqaAS4AKAQZKppoP26Dt8ixe87jywWUOX18NMjssxYqaQ>
    <xmx:dkRVaQ7bU4eyj3EZ3RiJ1JnkNSVF1RMmYkOcHLDmWNpJMjDtayP-3PhC>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Dec 2025 10:42:45 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Wed, 31 Dec 2025 16:42:38 +0100
Subject: [PATCH 1/2] arm64: select APPLE_PMGR_PWRSTATE for ARCH_APPLE
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-arch-arm64-apple-defconfig-v1-1-4ff19805ba39@jannau.net>
References: <20251231-arch-arm64-apple-defconfig-v1-0-4ff19805ba39@jannau.net>
In-Reply-To: <20251231-arch-arm64-apple-defconfig-v1-0-4ff19805ba39@jannau.net>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Sven Peter <sven@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=Uw09thzVOOvg9JNmBSGqTgng4jYapQ8QHlGPEMlOegU=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxQl0Lux/Muntnfty/6Xb0gc8uMCcrHlM4qxmw2/eUsW
 ZwyL9+5o5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwES2CzH8d3s3I+d6wJwy1U0B
 tl/5jj+zuJC3x61Ewmwm70LftY+7pBj+uxRUVLh6hTdtUdiX5qK60G3Dx5Rn59dwlHGbHzi6/oI
 uEwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Critical devices like the NVMe on Apple silicon systems depend on
APPLE_PMGR_PWRSTATE and others are powered down coming out of reset so
select APPLE_PMGR_PWRSTATE to ensure these devices work. Since the
systems are not totally unsusable (boot to initramfs is expected to
work) allow !PM builds without APPLE_PMGR_PWRSTATE.

Link: https://lore.kernel.org/asahi/2e022f4e-4c87-4da1-9d02-f7a3ae7c5798@arm.com/
Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index fff14807c965a19cd5ba7a2445be5fd77d94e7a8..200e5067560e4ac2cfeda01c97cfae112954a0fc 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -36,6 +36,7 @@ config ARCH_ALPINE
 config ARCH_APPLE
 	bool "Apple Silicon SoC family"
 	select APPLE_AIC
+	select APPLE_PMGR_PWRSTATE if PM
 	help
 	  This enables support for Apple's in-house ARM SoC family, such
 	  as the Apple M1.

-- 
2.52.0

