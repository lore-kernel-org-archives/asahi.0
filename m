Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033552D323E
	for <asahi@lists.linux.dev>; Mon, 25 Aug 2025 09:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756113369; cv=none; b=EsAFmjRk4gzink52x2WjGPo0zCVqJNy0iSjpryZxazIcopjokB85eRfYbA8iEZMhpiSgcFhr//b2ccw09ptI8ivxCc2DUSQDFAiPCpRwyh+9IZ8BX98SExbSH4smFfCLqgSfxQGyBI3o+Cex3v2wQ7ywP2FNbar1JIsj2E+YavQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756113369; c=relaxed/simple;
	bh=Y05HCp2dKH+ELeXJposRHDcITa6nX6lbyaSJ7ik3B5Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ibTyk5YXS4EWdFYjzhoMCN/GyIIAD4GgyooLRfmH9HkfOGYwOBVvtimO6wfeGWsLqf/OKhSi1rNk8KXOz048h+gvQ7vTEzxXePnEpcE4tUkXEI0dwl9YD62R50CMlwI3JKo5sRymu1NmrZNGo2x19TW5Sou9jAd9ZWQq7hFAayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9MscgOz; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9MscgOz"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24622df0d95so22091335ad.2
        for <asahi@lists.linux.dev>; Mon, 25 Aug 2025 02:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756113367; x=1756718167; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zghTXtuCYjnVRSoEXYMypswuA6Dsts2VEXA78wNOPAY=;
        b=R9MscgOz7YRfM+bcsO7sC+2tywAKMq+l5rKTvbOImiDuXKhOCPE3PZuUheusMsP0BW
         ziFMYKU+rvxQK1BgmOxGbB7AV+0wAtjm4t51BG+3Td2gf/F+iQJL5ug9fmJ1WZYh33ck
         GTVLsAO0yDUSHp60MoQsDJ3eQB2PwM+KIP9TUm22wfocwZqpWSVROAIR7Tw7GqyN3b2D
         Ax/GBxtw0d/zlsmquYe1r+BKsJunLaeNIsKjaaxcTVwqKsWLD2pLjSx2M/WP4XBdnnN+
         AwC33DjdDZhAOYxxrSIRoJQXCw8vkVkZcI6+3NHv5CutCurBGA2Rh3DeK+5ksUQLiIqE
         arNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756113367; x=1756718167;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zghTXtuCYjnVRSoEXYMypswuA6Dsts2VEXA78wNOPAY=;
        b=mpB+4VEyuwB2meDRQGm2do4V9QX0THv8U6tCj67U9TNUyqXnqhI7eug/djKGPRZkP0
         WcR2NjZekBLCxx2mENTCqZYa3d45a1Bz0nhaY6Tm+xAEtVPaIO98qlvSQO3DVhD6mOQq
         y/ewIsFObe8OasKH/vXVLrFoJdeC5EBakP4TAEtukJgSfsLMcRtlnjlYyixEz5vjhYjV
         AI8HQs1HmQCBY8dy3oeEjCEJEZQQU47vIYlz7Ho4LiPKceQ7FOLVARq+Z+Xv9EGfm10D
         qK1gucDwJmLXpHMXN8KuwPZJU7CdLEp8LdwosqL1r3n23ZGa7NHB5f52LK02NLZPBkBC
         jmOw==
X-Gm-Message-State: AOJu0YyavRzSy6TEP8tJrhpwnIHOf2bVyy3WX5/+KbUtOdcH84948Ro/
	jNXArtDwJq9mSWu7ns39b/C0rI98CEKEx/u6NrCYo89S7I5nrdn40otJ
X-Gm-Gg: ASbGncvn9FAbnsJrw1KkMcfbL8Oefpbr0zSKtaG+ZVr3tgrt3MXGtPcEmKEqPx+HFRx
	ogpCFojjiUnmMRo3MzetRG5QWXtnAGF7P1b5czZArMcYRgTDA48Mk6+WML7Z1Bw5CIs30P43Qzv
	ANB2zJAntFiFoX7uD5Px6RYGtLlS3EETa6sqzYa1VphZzSwYq0KKROxZqI4WlYxp+OvqDdXU+TK
	CKT+7rRh4PR8JtD3Z2lkWI3THMq7JLtnImWz5709+D55hCMRMJIsjtmLWVE7rFdvpDguvJ+EivI
	gFkjysPbTDT+v0FgYtV4jS8h9eXwNE8IKljwFzrc/gULGQDuompWuG7oin1Hs7f5krJ8p8iO2BV
	sMNv5aIRxc9srl9McTpTIf5pDuSqKUHHn72ILMA==
X-Google-Smtp-Source: AGHT+IGQmvgqTO1Pc+LATLeh/0scu3vAbktfAXwaSdHu+HIQat1iA60/9EZKZDEAckcrYALxg4j33w==
X-Received: by 2002:a17:902:c946:b0:246:c0c9:13a2 with SMTP id d9443c01a7336-246c0c91b6dmr49998085ad.16.1756113366971;
        Mon, 25 Aug 2025 02:16:06 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2466887fc8dsm62873875ad.122.2025.08.25.02.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:16:06 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v4 0/4] Add support ANS2 NVMe on Apple A11
Date: Mon, 25 Aug 2025 17:15:03 +0800
Message-Id: <20250825-t8015-nvme-v4-0-6ffc8f891b6e@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJcprGgC/13OQQ6DIBCF4as0rEszIAh21Xs0XRAYlaRqA4a0M
 d69aLrALh/J9w8LiRg8RnI9LSRg8tFPYx7ifCK2N2OH1Lu8CQcuQYOmswYm6ZgGpKoyorXOcOk
 cyeAVsPXvPXZ/5N37OE/hs7cT215/GcbKTGIUKLaN5QCohFG3bjD+ebHTQLZM4iU9/CDxTGtZC
 20d0w3CP60Kyo9Xq0yZMIIpbVxb65Ku6/oF/kwU9hoBAAA=
X-Change-ID: 20250808-t8015-nvme-73a4fcda25dd
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-nvme@lists.infradead.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2826; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=Y05HCp2dKH+ELeXJposRHDcITa6nX6lbyaSJ7ik3B5Y=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBorCnMXLQOuXeccHo9ELkKgF8hXjMfU5ZldMBfc
 YKqkwbeqaCJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaKwpzAAKCRABygi3psUI
 JCnbD/9sC1sqxHWRzIHlu9qKYOKxIXbhYxXbyQ6t/1cDjV3R8+TTx1Vi1JV/eSwIwUoEtUx76mE
 AYCIA73Ni/K6e9GouQoe9QP5+wiF2qjEvbWfP6y9++vyYOPMPRGZraOBMkiAA6oM+avbsYlP0Iw
 zIo+unU0gtwFgXDFiGDY9nWNU9nLCOmNMP7Gm3P1kh9szjB8XMWIUqE74K4ZRHHtK+b1e3Cot3T
 1OxEc01XQGCqmpdChZvVLQI/q69F4vrW4ONEduBd5gkHXbUZzUy1T2y8/8DsjTsYZ6mNeipU6hy
 Tr6u26a/9nvwY60Qzae4J3Ku7DN+PUAg7yPbCKQ70tKBLomOYRpF92vg6L98wU1J/k+Wm3skLZb
 bm9pUlF6bh2IUvhQ+KJCguqm7g5UFsKQBSiwO1PxtS8jIPASn9/wtMDU3kXlq3GfBwA/HJ1OKGc
 NpjNipHKVUIZ1MjeQs7CuCq/f5P18Usnsc4tEG6XKr79FYUNwBEgIbc0KuRjioF2XHDddaTL++k
 mKy9yQ1u6tUg2GsZglucG7PubDw7fHKEHStD1WMeLInxJ2zo6OQ8yWsEWrjS5K3CbzrvdwX8SFx
 eJRMqiei5wuiVba4v6jEbAdC6XDeh563fg2/LPIe4J/76gJXBC2yupC4ywRTNl+j6IlucXmG9kK
 /ovli0Umq5eRrxA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Apple A11 SoC comes with an NVMe controller that is similar to the
NVMe controller in M1, but less customized. Notably, it does not
have NVMMU or Linear SQ.

The controller is wired to an older variant of the SART address filter,
and uses an older variant of ASC mailbox, so add support for them too.

This variant of mailbox is also present on Apple T2 SoC.

This series has everything required to support NVMe on Apple A11 SoC.
However, due to RTKit protocol version support limitation, it will
only work when booted with at least iOS 14 iBoot.

Tested on A11 as well as M1 Pro (to make sure nothing broke).

Patch 1-2 adds support for the older mailbox
Patch 3-5 adds support for the older SART
Patch 6-7 adds support for the NVMe controller found in Apple A11 SoC
Patch 8-9 adds the required device tree nodes.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v4:
- Remove the remaining added long line in drivers/nvme/host/apple.c
- Drop already applied SART and mailbox patches (based on top of
  apple-soc/drivers-6.18)
- Link to v3: https://lore.kernel.org/r/20250821-t8015-nvme-v3-0-14a4178adf68@gmail.com

Changes in v3:
- Update comment about enabling NVMMU and Linear submission queues. It is
  required since T6000 and much of the comment has been removed as it was
  stating the T8015 (A11) code path as a possible alternative.
- Make sure all the code changes are within 80 columns
- Simplify apple_nvme_submit_cmd_t8015()
- Remove unnecessary cast of of_device_get_match_data()
- Use direct function calls for command submission
- Use existing enum in apple,sart binding when adding the "apple,t8015-sart"
  compatible.
- Link to v2: https://lore.kernel.org/r/20250818-t8015-nvme-v2-0-65648cd189e0@gmail.com

Changes in v2:
- Remove bogus command_id decrement followed by increment in apple_nvme_handle_cqe()
- Split apple_nvme_submit_cmd() into two functions for t8015 and t8103 since these
  two code paths were not sharing much code.
- Link to v1: https://lore.kernel.org/r/20250811-t8015-nvme-v1-0-ef9c200e74a7@gmail.com

---
Nick Chan (4):
      dt-bindings: nvme: apple,nvme-ans: Add Apple A11
      nvme: apple: Add Apple A11 support
      arm64: dts: apple: t8015: Fix PCIE power domains dependencies
      arm64: dts: apple: t8015: Add NVMe nodes

 .../devicetree/bindings/nvme/apple,nvme-ans.yaml   |  15 +-
 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi          |   1 +
 arch/arm64/boot/dts/apple/t8015.dtsi               |  34 ++++
 drivers/nvme/host/apple.c                          | 197 ++++++++++++++-------
 4 files changed, 181 insertions(+), 66 deletions(-)
---
base-commit: 58b28ca2e6697d7c4b2c31d9d6dc1f71cd356553
change-id: 20250808-t8015-nvme-73a4fcda25dd

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

