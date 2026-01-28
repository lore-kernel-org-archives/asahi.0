Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FBA334683
	for <asahi@lists.linux.dev>; Wed, 28 Jan 2026 08:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590644; cv=none; b=pFTJH6FGpv03dvYrJT4tTBydJjIWmFSfeCk3i5jyxES8iwLjvcxX05OD2GN5fDLqDtHZQG8XlnyMSaLQbZEy45eSDYQpHETqOeGRBhyitxL8v6lvh9OOsMsJ0uM1XI4MBD5LgMjWVnuoEeP1iKD8/6QNbE4vUm6O0rmCUEsQsR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590644; c=relaxed/simple;
	bh=lSCd9224ugKISLFYLWd468PqALwjXlK5iifgzV8hY5Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C9MLqfajKkJDZEu/lQmabClSFeAO3eZuoKYOahaY0lXVhigaxSpsRfIqETd2U5OKQVoHkNJ5GoJckdCKLhrzH0PtFEyOSrWEsVQsj0kI1mX0UrRp0gi8Z+O0ApnNoNVyMLr+RGtsvx8tA9GbZ262uDfCi/V65Wi5MGilv7PYnmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=HSw7JYbK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ae9CZ5wu; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="HSw7JYbK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ae9CZ5wu"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id A2A511D00090;
	Wed, 28 Jan 2026 03:57:22 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 28 Jan 2026 03:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1769590642; x=1769677042; bh=AW
	q/HTw1YbVVTLbDtDcQ/JJUIzFiIOVRXqodj5LKW5Q=; b=HSw7JYbK+PBrJm20mW
	/28ngXbf+wjRthIM4pYDD5AdrTQoBVektxX5gEaBE4928XVSRMjXOc6eIkF0osjl
	nzREBD4GIY1o3si1HrtciLsm5yFY0MdYmnzsWn9jBAhBxtSCqfUb5UbadvC9Sunu
	4PE+PRlVCjBsvNhOz+0SqThH0TY50U1jpscMGD6s/0fBb1UTKXJ9zIa2jMXwPTOQ
	yy0YMb6s6lbs5i159N9Ug34C8dxGEyC2DFsbV2GZNove4hC2PqZRLhPdt5kFjMQz
	FU1uqyyDvbMKTj6RONuvoWacXMGJGQ8Kz8Gkr3PpBkThJB7MvxhZrqijCzJ1JwIJ
	x7Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1769590642; x=1769677042; bh=AWq/HTw1YbVVTLbDtDcQ/JJUIzFi
	IOVRXqodj5LKW5Q=; b=Ae9CZ5wufqDtP7AwGtiztITsDPQf2ItJPhd5OjABpZTi
	hbBMcoMJOExkajxDdLbQKJqr14AcJvp7yBU+KIWCQkm1UZXsCWfYAbECelBZILEC
	nFoxUGoZo8S03HWDPOVpv4r41EM7HWGZMjsmBUx+UC3lnpAgwYT9r8CC0D6gberS
	9GNN4VXn5tvnDbckRFoRasYlo1CbFt8ImREV9xg3RLLZn8Bbc1WYajywHRM4yL7C
	Lmq8x+Lq2F5j1zJwhSBVlGs9Z6B8ym7LGf4jbKkVVBU2FWwMIvvx5WkPGPG4W8Qn
	8LnDwlLLfQrdkqLtXULPUoWrlaiahNf/BuFj/qGh+A==
X-ME-Sender: <xms:cs95abPp_AmSkebm8N6W3YpghxAW5v__-hAKruhyfwuVBtCLL6J9LA>
    <xme:cs95aRy-2-L58I259z-UucZHKNP8IEGLQEGJ5HArXHuhiYHL_uTruD3JTao7YSZsO
    c1EFmaqK503GpbD54P85Gtg3hUZn6GkBluwrT1OkfdG3oPEhg7BaaA>
X-ME-Received: <xmr:cs95aVpTflY7dqXXAO2ZmdplCiiHXFg_sbKLRgtA3tcAI_SKYZptNGvNAPPKGXzU2UvVsiICVzZOkjVa-fhVVSBehyXj1rQZksUNEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedvleegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepudffle
    ejffefieeigeeluddvgeeklefhffeigefhudejieevgffgkeeftdffvedunecuffhomhgr
    ihhnpeihrghmlhdrrghpphhlvgdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhn
    sggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhgvrg
    hlsehgohhmphgrrdguvghvpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtghp
    thhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdgu
    vgdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfh
    hrrgguvggrugdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhig
    rdguvghvpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:cs95aZOWUmjwrmikHWfn_JQ6RJUhR_ZX48NjX4lVtHykN9JMKmjF2g>
    <xmx:cs95aRfFgC46CawEmYkvezHnVuQv-XANTjRIC1-Q47zcMauIJqUK-Q>
    <xmx:cs95aXVmGUxsIZDTdUozKWVoitmwom1a7kr9jEb_BmhE9tJlqbegwQ>
    <xmx:cs95aaDLUuz1AdGxWaA4gprdx3DK8CBjwRRYNiPmJ8ObQ5nFNoLUZw>
    <xmx:cs95adeJ6FlANp17K-v_9vr7w4MU3WynIU6MwzLEW4W1mgrJV2JhOz2d>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 03:57:21 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH v2 0/2] Add Apple interrupt controller 3 support
Date: Wed, 28 Jan 2026 09:57:07 +0100
Message-Id: <20260128-irq-apple-aic3-v2-0-b4bc8e16c997@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGPPeWkC/13MwQrCMAzG8VcZORtpOy3Mk+8hO8SZuoh0tZ1FG
 X136/AkOf0D32+BxFE4waFZIHKWJJOvYTYNDCP5K6NcaoNRxiqtO5T4QArhzkgytKhavXOWyNS
 DOgqRnbxW8NTXHiXNU3yvftbf748y+38qa1RYGcfWkqVzd7yR9/Tcep6hL6V8ANXyWSmtAAAA
X-Change-ID: 20260119-irq-apple-aic3-0314f6aa2a2a
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2081; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=lSCd9224ugKISLFYLWd468PqALwjXlK5iifgzV8hY5Q=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhszK8wV/Wau4zuj82sZ4u/p3XeqqZ8smzbpQUzu5/Pvs1
 2pbFrNkdJSyMIhxMciKKbIkab/sYFhdoxhT+yAMZg4rE8gQBi5OAZiI7DtGhiOHsxaeP1pwRFb+
 hPTeiQc8WFacEjlw7970C2czDzo1bH3NyDBtjoSX6MeanW2dshd2fEiym9vyYdMcbhPWupYuto4
 nwdwA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Add yet another variant of Apple's interrupt controller. This one might
to stick for more SoC variants than their predecessors. According to
Apple's device trees it is used on all SoCs since the M3 (t8122) up to
M5 (t8142). This information is not 100% reliable since macOS uses
different kernel builds for each SoC variant.
As far as the functionality implemented in the Linux driver it is almost
identical to AICv2. The only noticeable difference is an increased
IRQ_CFG offset.
AICv3 uses the same device tree bindings as AICv2 so add its compatible
to the existing apple,aic2.yaml.
Apple's device tree added many MMIO offsets as properties for the
"aic,3" node. The offsets are the same for all released SoCs with AICv3
so the Linux driver continues to use hard coded offsets.
Compatible strings for AICv3 will be SoC specific like
"apple,t8122-aic3" so a potential future SoC with different offsets
would use a new base compatible string for which the driver uses
different MMIO offsets.
While the offsets are the same on M4 and later SoCs access to
implementation defined system registers will require different
compatible strings.

Signed-off-by: Janne Grunau <j@jannau.net>
---
Changes in v2:
- allow single "apple,t8122-aic3" compatible in the bindings
- drop leftover #include <linux/of.h> as it's not justified by the
  contents
- comment and white space style fixes
- sort cases by version in switch statement
- Add Sven's Rb:
- Link to v1: https://lore.kernel.org/r/20260125-irq-apple-aic3-v1-0-a2afe66a6ab9@jannau.net

---
Janne Grunau (2):
      dt-bindings: interrupt-controller: apple,aic2: Add AICv3
      irqchip/apple-aic: Add support for "apple,t8122-aic3"

 .../bindings/interrupt-controller/apple,aic2.yaml  | 45 +++++++++++++++++-----
 drivers/irqchip/irq-apple-aic.c                    | 24 ++++++++++--
 2 files changed, 57 insertions(+), 12 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260119-irq-apple-aic3-0314f6aa2a2a

Best regards,
-- 
Janne Grunau <j@jannau.net>

