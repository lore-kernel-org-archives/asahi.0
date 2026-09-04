Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D2F3B5305
	for <asahi@lists.linux.dev>; Fri,  4 Sep 2026 19:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788549779; cv=none; b=KKYP9TkRpPDmi//Vf/yT5wKVBUVHLCE7h9oPvS2Xct5H4d87GIM52f/g7/VKbBGdsRVn4NBQX0NqTkIiYpydJCZKmMg6V+XwAPSooiEUOy8jZA9zWrQvUe9zYSi7tZSZGCNFjX5bji3rc2LtxX8HYrvrJRwjPuMrMSlASB+K9xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788549779; c=relaxed/simple;
	bh=gXjNtUOcdkzdOvxdJgDeknxiO+8qXYStItBYPIu4jeA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WBP56D6BwlQTXk86Vcg4PbqArbM+bwmAdn9u3Pw8L1W9l6L7rhzjiWSxAXDfdOVB2M0LCxyRSevstZKz1OQvcXjQZ0c3/QmCJAvA0BtDIw/y6oOSzsDxoLrD6HXdY1c3AmjQXLIb3yCDqcAYzlwZWXoqgGotILqC0p4qGSXv7LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=PgsZ0bJ8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rms2asmk; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="PgsZ0bJ8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rms2asmk"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id CA7C51D000C3;
	Fri,  4 Sep 2026 15:22:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Fri, 04 Sep 2026 15:22:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1788549776; x=1788636176; bh=U8
	77ZCIZ/e70cT0rg4zUHyZGqdJZNFZoXhNR2wQvndE=; b=PgsZ0bJ80Pi4JzUSez
	RFckXdKjsAYYc3MfdeV1IO79Hx304TtqULgL9V8wrGr8h++ycs04Dr3JuTAQe+Gn
	F/N8KyxcfPO/HRkSxDL76RJ8fvFNtO9Bnw5K0FByO65P+b772PhHA8ogyc+cJ624
	/ouZPx1/1dDA7XB/olT+pPHeyYB+04jRAkdLULBqz1sV2oCa702xhkSEg8FSjnmh
	jUCD/5JLKcbrh3cH39Uv2SANfvX/2yJh1JdFdomGiYEwEenWoMCNdXAy8fm6Mr/s
	FM+AvOfxmTYQuxEHql0hNeAnunpzGSMnlHoKEl6Zj7tX5MN7n5+TT561B+TUSYQR
	2Mpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1788549776; x=1788636176; bh=U877ZCIZ/e70cT0rg4zUHyZGqdJZ
	NFZoXhNR2wQvndE=; b=rms2asmkV/Lj0xkbSqoqAJMHSrfII9fGyST4Hxr3hw7m
	U5s/PK0B8YJ0Impu/EG6aFdyVraGQQgqvA0YPJKxNWSa+bGA47FLKgQ743lz9a0j
	tpFTVpBA4Euk7xk7QCXfHuPtn/6vTEJMYcBctgH5IMp7mmItb+Omo+WdZvHhGSFX
	Qm9OyKiOQ6LkxISJ/mUYOSbJKtHgVqvEWmrWmZFD3i/4s9A+KLgGC1uUd/W96YPu
	OqgtYMZTr/EjN+mmIZDsR6MTLi0+TdLL9NBMo30dDPNm9PzQ4d4BJB2oBNxmzV2S
	o41RbdcJGo+nun3NaCoE4V++lJZfqylV9u1MMaNIIQ==
X-ME-Sender: <xms:kBqbahBU7B-11ob4Bpa5dylRtTI6Dh2bBWWaxu5h5AneMoZYAzN_Dw>
    <xme:kBqbakfgclfdewR2rUaxVv_HV-ad9yNRaArQwdXBV7UmxuwqsUtFT-_zYhaaeNihp
    SBocIWZhYhwTgCxrUBtec12TZD3utHnSvTxY27FZAuztX0__T57gj4>
X-ME-Received: <xmr:kBqbag14XUbVzpzw5teSOYtTneBKiYI3POAGA0ASptljPl-MoqrmJj2C5ndj0pO6UAYrefS3zzVxx44euR3RneHAHxrTpa_iABj1_g>
X-ME-Proxy-Cause: dmFkZTE+ekJ69lfqHb5BQ0m7LaIMVbMjv65iK61w7SOYnxxEulc58zm7mx6o/oAQvIjJkJ
    BwcVa6Ri2NdsxzJaRk0T2iRzoad8L/n/Q1UzWZVeoBNI+vO55zfVmst3RqP/fQURQ/lIkx
    vBIiKuux6W2INvtWYpXLYCmmKBvF9pIgSoyAQKtm9JICq8VxnBKIZTcPsiaeCiXAgXj7af
    QlHB91jhFQUAYdsUDqzklgZXRK+kMWgw8NZwq3MpUj5EjHWVsvpfljgPZ3AS9agKZKz+lr
    EdwADcVTcqsYWpYhZaa7+qp8DIU9ijZaaOBxecCk6lbNPPgpCUD6DCGXsCN4bSlUgYjRAb
    LEnk3GEBttFUiR4yd+TJQnEx6KmrxJqmM6zZE8ImwKFuirkgL/ugrWXMUf878aVsSDbRaa
    lahvEKiSNB7JsPMYsxwOPPdygsE/SQKTaL3ZFL43Fkkp2DB9dzznMMlGUkoQUq7VVG2tih
    A64WuEjPC2q2/9zcjyAuYkLb6VnzRttd/jNFbVaM5Rum9j039YObyd2S5be/jkdZp+oL5r
    P8pdHo9m12jcMVpYNltfWdNqzNIS9RUGHs3Qwcab533QJd+oMopC9hAcznFJweuM1sPjcO
    w0kgKM+fXLlsDBHK+l+3yTQvarW28DYL3nUdLvsVrPSGLl6O8fsanPeu5WSw
X-ME-Proxy: <xmx:kBqbariBRfM8T82jkbOu5WhLqVKafcMTKQZxhHU_7gldee-YEu2Y2Q>
    <xmx:kBqbapmHyvVft8SRKbF5Q5LSCwhz-9I0xHcFrSrRWUmgkYfg2N6m3w>
    <xmx:kBqbahYZ58NERmTp0XIuivVQtQKuh0BpOkmoUkK2pZQCP4EYpnqk6w>
    <xmx:kBqbakGr3bGNq7TIVFjdevWYPUzlUet56lj_IcRbn1GJburx7DvXAQ>
    <xmx:kBqbal_ceC53ghbBhGd0rvKgAwLk17D1whNKFu9gLXpW8OX7oc3ylqdx>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Sep 2026 15:22:55 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH 0/4] Apple NVMe fixes for macOS 15+ firmware / M4 support
Date: Fri, 04 Sep 2026 21:22:38 +0200
Message-Id: <20260904-apple-nvme-fwabi-v1-0-f7ede661c469@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBswkaKuEi3MZmqgTBQqkO6et
 HyL/zMkikIJhipDpEuSnL6gqStwm/UroSzFoJVuVa8M2hB2Qn8dhHzbWdBxZ7hzxNYZKFmIxPL
 8y3F63w8eKbn4YgAAAA==
X-Change-ID: 20260904-apple-nvme-fwabi-cf74f7cefac4
To: u-boot@lists.u-boot-project.org
Cc: asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>, 
 Sven Peter <sven@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Tom Rini <trini@konsulko.com>, 
 Francois Berder <fberder@outlook.fr>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=gXjNtUOcdkzdOvxdJgDeknxiO+8qXYStItBYPIu4jeA=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzZUr15Lgo7prVMrnYOmCFvVcx08I1Q6PEHzvZ9GYkdv
 LrJV6Q7SlkYxLgYZMUUWZK0X3YwrK5RjKl9EAYzh5UJZAgDF6cATCT7P8N/j4j/dxcuuOS57Xie
 YPeMnbZHP7B2r7kty3KcrUfOe/eCZwx/JV7M2Wz2oqTgS6nsicIvKwKdBK/oLIzdF3JE+/Kbtx9
 5OQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Hej,

this series adapts Sven's Linux nvme-apple series of the same name to
u-boot. It fixes bugs which are worked around on M1/M2/M3 based devices
with NVMe firmware from macOS 14.x or earlier. Starting with the NVMe
controller firmware from macOS 15.x (required for M4 support) the
workaround is no longer available.

The quirk to require page-aligned buffers for the admin queue is not
necessary for u-boot. As far as I can see the buffers are always
page-aligned. Add noisy WARN_ON_ONCEs to ensure it's noticed if this
changes or I was mistaken to begin with.

Janne

Link: https://lore.kernel.org/asahi/20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
Janne Grunau (4):
      nvme: apple: Don't set a DMA direction for commands without a data transfer
      nvme: apple: Never set the opcode in the NVMMU TCB
      nvme: apple: Add WARN_ON_ONCE for non page-aligned admin queue buffers
      nvme: apple: Drop the PRP null check chicken bit

 drivers/nvme/nvme_apple.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)
---
base-commit: 964ad5b5c91b7be56e443e899d7f873e6aa8c9fc
change-id: 20260904-apple-nvme-fwabi-cf74f7cefac4

Best regards,
-- 
Janne Grunau <j@jannau.net>

