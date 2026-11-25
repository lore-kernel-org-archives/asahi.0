Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612325;
	b=DEgqmoBe7mIqbWWBVBkkhiYXQ68MN/8hQML0vTSMj0By0sAyNn5O5K7RMtTmwpxBUE7l
	 zKwQ0MCL8AVOOyBB8Esa2V5Zds7y17ijYEs4p3cpB0mxzE7hN0OD9KaBA84QwWgWsCVmv
	 V9D8S/ht98W2pgOayeIdVWbhDRs2W90VEyKFRZ7EBX3qWUMbyMFymH7QUFJNwaNfJGbVZ
	 GRvb9xZTPUhdAevtq47jfDhOiBu1wIn2BjDjROEQW7mcgcFihaALkFLau3RR/hUzILAa3
	 tG8O8GqyZnmKwYqEr+Hyzbdinf10tXMKOE6trzHoKE05GtwrydOkeq7fJ9s1j7b5Q0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612325;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=0qNRbsSam6uMz1bB2zIu/O5SW5C6QVHg6ITH+0RRZ6w=;
	b=ou+m6znk0FAfiGCQhmcevR2PMCBrCydDpgU8eI+qU9jBZIJdyNHQlmBpaNv5Dt8aybPC
	 nisTnZsL05iX7LXxuYWI8rJwxIDGHbz9svtpJ3SXKje6Wv4Xdt5Vtw5tnBdMlASv1jJXL
	 IrmoiqOdSyHTD/dSW+AlLpny851RgIjRg4UsCoImWv0jD0q9HIe7jFw2FVLaNDWsE5BSi
	 TdYoiI7MjeHYxniYlK4AWWzyqza/M1D/UE3/hdwDPH4+mYE+mW0FPPydm6U2qCGtINK2l
	 lzPP19C7QORN4SvIuDRXqtXNurkrIOzvJJsOpo8upfUPvsGuS3t0KBdeo9VBbnVhVMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=mLpvQ6rZ;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE64606A32C
	for <asahi@lists.linux.dev>; Wed, 25 Nov 2026 13:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AE64606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=mLpvQ6rZ
Received: by chaosmail.tech (Postfix) id 6D4DA1C84A7;
	Wed, 25 Nov 2026 13:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1795612316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0qNRbsSam6uMz1bB2zIu/O5SW5C6QVHg6ITH+0RRZ6w=;
	b=mLpvQ6rZuIG1kXE2m8uVZDPO5SDV7Qwzkir60q2RouAiSs/bHT54Az3iRjzn4+gI1nL7l/
	dAqE6xYyLbq46hZJRXATbPmdoS17Y50xNs9ACOfQRacVZtI27QyhxkUTH/eGMzJBWq7f0D
	KgTFXaHxD3u4NAZr6PaVoFaP1brn8bA=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v3 0/5] phy: apple: atc: Add M3 support
Date: Wed, 25 Nov 2026 14:11:44 +0100
Message-Id: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/22OQQ7CIBBFr9KwFgODVXTlPYwLmIJgtG0KEpumd
 xfqpokuf/Lem5lIMIM3gZyqiQwm+eC7Ng+xqQg61d4M9U3eBBjsOWeSRskBaO9GqlHwI0ONFnc
 k8/1grH8vrcv1u8NL3w3GEiiE8yF2w7gcS7xw/7qJU0YRDlJoULVQ8pw/6cJT+cc2GnSkxBOs9
 CyudMi6bGqUtrGCa/Wjz/P8AR+YnPD4AAAA
X-Change-ID: 20261108-t8122-phy-bc3190cbcfc4
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Ramzi Abdiche <abdicheramzi@gmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795612315; l=1826;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=waPGOD2xSosSdMrFUP3y7HhHynHugsWaholoSPFixrY=;
 b=sjkcCppqltoziHPpY4ybetWs9dkRwRu2hG/yslTXTJtiZEoPtSk2ql6IGNZw05qoAoQwgfiKs
 fFa11zLRTplAevaek/wayozmqyKnCKtDfO+WvEtxDhDyi6zP4Gf83B7
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

The M3 series introduced a new Type-C phy. Add support for initializing
and configuring it. This is one of the puzzle pieces needed for
USB3/TB/DP support on those devices.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v3:
- Fix a git surgery fail
- Fix reliance on transitive includes
- Sink defines into .c files where possible
- Merge atcphy_dp_ops into atcphy_hw
- Link to v2: https://patch.msgid.link/20261122-t8122-phy-v2-0-8d5c8fdf31ba@chaosmail.tech

Changes in v2:
- Split atc.c into generation-specific files
- Improve error handling
- dt-binding fixes
- Link to v1: https://patch.msgid.link/20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech

---
Ramzi Abdiche (1):
      phy: apple: atc: Add T8122 DisplayPort support

Sasha Finkelstein (4):
      dt-bindings: phy: atcphy: Add M3 series
      soc: apple: tunable: Allow passing NULL to tunable_apply
      phy: apple: atc: Add initial M3 series support
      phy: apple: atc: Split generation-specific code

 .../devicetree/bindings/phy/apple,atcphy.yaml      |   9 +-
 drivers/phy/apple/Makefile                         |   2 +-
 drivers/phy/apple/atc-t8103.c                      | 273 ++++++++
 drivers/phy/apple/atc-t8122.c                      | 713 +++++++++++++++++++++
 drivers/phy/apple/atc.c                            | 654 +++----------------
 drivers/phy/apple/atc.h                            | 340 ++++++++++
 drivers/soc/apple/tunable.c                        |   2 +
 7 files changed, 1443 insertions(+), 550 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-t8122-phy-bc3190cbcfc4

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

