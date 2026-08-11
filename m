Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C82B4756DF
	for <asahi@lists.linux.dev>; Tue, 11 Aug 2026 20:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786481402; cv=none; b=mbHa/zQ/rLRr4i67RiPEQRFz3aJzzSujEt7JwwlarrMbTeqQb3syRPsaUOqsYTgW+50+qAIcATs00Of6P7CkitZo0BZzFG1u7RoSVfI7CM61m/NRDWYAJYFapLX+zHklUHPkkJ0kBJldLbF6eyxDXO8wyvn2c7H/S9NJeB0mm7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786481402; c=relaxed/simple;
	bh=5ztsccDY3V1El8txWyMoTnqjSjFWDRESPrjtzgZQMtU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hFke3XiBLihuF+kWG5SjcjtpkbncVT/DKsbEoQ3FyHEjloqvVK4tkmSYuEjGUdSdB7D1Qz1kPyxKqezH8C+GlAxUMd9Kiba1WTZPctpX5x3rM/DlySpyMZ3wbtPNQQw1oZv1b84qun4mIt4kBmNrTIuZi9qbTJPU3bk4F89z7d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=IQuxDKpN; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="IQuxDKpN"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1786481397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sbjeC/eKrwmIFAfzQH2WILNTc8GDCe8HMwCd5dXp2nU=;
	b=IQuxDKpNze4lFSwtxbxx9nq/s8sMdqHksqio3+yXw3gMAToFagtPg9pfH0TZJkvjibMZkr
	AGZe+MPaN54tj6Hitu2nIk3AnIEXBZhQVmtCcMMdnGf5hiklX79+K8wJFrvI694rX2fppR
	H5b3/iI2vXIVEVApmj6Fb9hsE4no6a0=
Subject: [PATCH 0/2] nvme: apple: add t8132 (M4) ANS2 NVMe support
Date: Tue, 11 Aug 2026 22:49:46 +0200
Message-Id: <20260811-apple-nvme-t8132-v1-0-865be32e42c3@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02OwQ6CMBBEf6XZs2u6hUDprxgOLSxaI4htQRPCv
 4viweNLZt7MApGD5whGLBB49tHfhw3oIKC52OHM6NuNQUlVSE2EdhxvjMPcMyZNmcKMsqpqi06
 TtbDVxsCdf32Vp3rnOLkrN+nj+SUCP6ZtK+0xcDYyNve+98mIuTwqDE0J/x+M2B/IAl2+z3dP6
 zxKKTNdUK6dIjMT1Ov6BjESF1HVAAAA
X-Change-ID: 20260811-apple-nvme-t8132-31399d6f81aa
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-nvme@lists.infradead.org, Yureka Lilian <yureka@cyberchaos.dev>

This patch series adds dt-bindings and driver support for ANS2 NVMe on
the Apple t8132 (M4) SoC.

This variant uses a separate MMIO base for its NVMMU and requires the IO
queues to be registered using an additional MMIO write.  Otherwise it is
largerly the same as the ANS2 NVMe variants present on Apple M1-M3 SoCs.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Yureka Lilian (2):
      dt-bindings: nvme: Add apple,t8132-nvme-ans2 compatible
      nvme: apple: add t8132 (M4) ANS2 NVMe support

 .../devicetree/bindings/nvme/apple,nvme-ans.yaml   | 77 ++++++++++++++--------
 drivers/nvme/host/apple.c                          | 41 ++++++++++--
 2 files changed, 84 insertions(+), 34 deletions(-)
---
base-commit: 2ee859ebf156157609f71060ae472711c8cbc326
change-id: 20260811-apple-nvme-t8132-31399d6f81aa
prerequisite-change-id: 20260806-b4-nvme-fwabi-000386148b21:v1
prerequisite-patch-id: 6a5b048dc5206a5a885a48101737a4ef714b3daa
prerequisite-patch-id: 51dcb523ea7e4d3695599db362e9d93c00a35c72
prerequisite-patch-id: 2f55dd6933c9a1b7078da3cbaae848ec920b542d
prerequisite-patch-id: cd3d7c56f3a943d199838e6b1214110aa8e47a72
prerequisite-patch-id: 7e3fc920a0336ef3946d970a2d5517eee49997e5
prerequisite-patch-id: 92f6d325b1f4118311fa3bb8a9a762cadab027f9

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>

