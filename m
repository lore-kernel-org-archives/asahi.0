Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795350540;
	b=2SwdzrNX3ijFTb364uApDQw1CM8d42hvTYOsk2ssoLwJJ7ZNIzMyj72CdGUowXaLawT0
	 3akxIx3EDv+wTzOXaNa37Zc8pR/uuaFLXXmu0XsufJJDpS8dEpUWKJJbi/cJ+RN/jctFq
	 izmpRrJLQbDBXz/8rAKX7XEPGbuAjmudEFD5yjZTFuDBrbkn2AnXg9LfUlJEXy1qpCykf
	 ezY1IVUmUOX/3OH+AJ+L/h6iF4UmtPPxdcfijCdi+78IBv14JJil1LdLaFAW4Xqyzwy2r
	 V81oIXooSqoh0L4385KXkhHbRSphpS6aagUa+oIgyI7sbQruwGt/Y03fLM0mGmd0Ajw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795350540;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=h75aEkUrkcxTbFO0cw5uCyPfhp/ssg9PnW+LsVNZA04=;
	b=R08N6ResRKvrQ8o4gtfaTKkYZIzAaOcI5laZRjnDwnqAX8cvQFkXivXsqmwYPTEDXFo7
	 r5vGzBuTp+v2rnXLTRIBzbekaGaxUHD8RwNDzLVhXRamVW0SSmBl8ZIKI143yRtglYbWA
	 HAYZEjOVv/q+Cd2PQc9x7c/LbWJjhhle+LaV/F/7yVTvioAOnagJiYh/+7zQacfqun4U6
	 FYjw9edpXD44r+4o90KAigYlTFuXKgh3wxW+0mQnhxQakzFCL0U+dTFsO/1eysJHMl6B3
	 dVxGwoJ1UgsSiNFCMmH4Oq6a00EOwZphoOWHy/yBNRWDiU8RIsdmQ7KHCdEleEbRBHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=iNRkE0GT;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175CE606A331
	for <asahi@lists.linux.dev>; Sun, 22 Nov 2026 12:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 175CE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=iNRkE0GT
Received: by chaosmail.tech (Postfix) id 378841C8A07;
	Sun, 22 Nov 2026 12:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1795350538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h75aEkUrkcxTbFO0cw5uCyPfhp/ssg9PnW+LsVNZA04=;
	b=iNRkE0GT/c2pHOFDIFLAYDrjwwfN7LhfCbK5QfHFh7pZAYC9iNuZDK4Zetq5MI3aK1XsKq
	mB+B/+M05BWh1Kxey+0U5prnpUiS+pkZ5Xm9Wx6PcziBzYvapPx2FhDHgQzOe8CC8oN6UN
	e5auh9Qehe3+AIpBihhNnrdY736FFC0=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sun, 22 Nov 2026 13:27:58 +0100
Subject: [PATCH v2 2/5] soc: apple: tunable: Allow passing NULL to
 tunable_apply
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
Message-Id: <20261122-t8122-phy-v2-2-8d5c8fdf31ba@chaosmail.tech>
References: <20261122-t8122-phy-v2-0-8d5c8fdf31ba@chaosmail.tech>
In-Reply-To: <20261122-t8122-phy-v2-0-8d5c8fdf31ba@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795350536; l=686;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=6r5CB8eIrYPysJHrZefwLcauhrBv1L4lVD2FHBotaw0=;
 b=DulbLg78Z8L89fh3v/KHZ+EdoUN6XeH472y6cUCC9orxgl6dBjJ24Xfxpb5prFk6j4Sy37oTm
 HE2jxXxVtDnDJutYsiahpSH8E6f0RTXZg8FuRuSO5a5D6SfIjW02r6E
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Make it easier to have optional tunables by tolerating NULL entries and
doing nothing when one is passed

Acked-by: Sven Peter <sven@kernel.org>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/soc/apple/tunable.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/apple/tunable.c b/drivers/soc/apple/tunable.c
index 659323839171..e89e8f9bb455 100644
--- a/drivers/soc/apple/tunable.c
+++ b/drivers/soc/apple/tunable.c
@@ -63,6 +63,8 @@ void apple_tunable_apply(void __iomem *regs, struct apple_tunable *tunable)
 {
 	size_t i;
 
+	if (!tunable)
+		return;
 	for (i = 0; i < tunable->sz; ++i) {
 		u32 val, old_val;
 

-- 
2.56.1

