Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794152640;
	b=qHK2AMqaolkinop4TmmZCaOtKYqdJM1333pdrepqHbOwMSK5zTjfVXhwkonRtrZgf4+o
	 aO4WiKdwWC00aKwp76R1LfbBDtOhI5v5a06EDcV+465DRWO/x2Ev/Z5QOSg8JCIOQUzt/
	 lPDatgFRF0yo/A4tvdU789dXHZ7m5lDXZ0zBjNVeBb7m/doYqU5993VR4uxSWI5Q0HWS7
	 Brbm+LN9DsyD5utUoV2+lVLiUPCMKiMCCGxLTymPsFBg2St1xDxpUZ0HQmv5W9IAnLtb+
	 6AWUvHzjBBtn8lZzZuV/tKSCSKqlHE5klLeJZMx5Tc1lm8FVdR5ZRBJ8AEapQYzAqwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794152640;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=BbD1zRVt830j/6FEa37AOCaw0v+voPN0QhLYn1eKXlw=;
	b=GY6+obI351AWxB/BYwfi3mtTDRcf2BSrLLxhUgETA/JIfZ9xfJVARyrVpqGR1ntqFFWj
	 7mrteWJUPm5iOcXKqZ8l9Fi/z+xE/Ofw9s5KNOpzF3WpYvx1xZwFZaVguB5G4WUIWi+Kk
	 AqI241o+QOUuP9LsKBo+5j5fade6znNoA2gi5Ii23kQttjFRyQYvhyCQnacKp/Vdr6+QK
	 VmUHAqVAL+2FWgnpB+nQ6PJ8s5TGFgOSptuFNsJzpyp3p2y4XqEx4brMx3Swd6S5wFxsH
	 XGgz59bS+ZNug2Nw6sStRgqMnPjsABqX/hMgR1eQ1rOcuq2S7lAzh1kdqgYE520tITA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=huDZ8nUu;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4573F606A32A
	for <asahi@lists.linux.dev>; Sun,  8 Nov 2026 15:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4573F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=huDZ8nUu
Received: by chaosmail.tech (Postfix) id C78E41C9690;
	Sun, 08 Nov 2026 15:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1794152636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BbD1zRVt830j/6FEa37AOCaw0v+voPN0QhLYn1eKXlw=;
	b=huDZ8nUuPuZlPb6rGLkG1O4TRZLhCNdhU3ucOKG6n0lWUUx2S5JsWS5CJngKz9jYDsQKNI
	RTBqGyiSCAm/z+ocJdazN8jIFEQ5VF/sql5oCbWyBWbCPU+zTq8EHnRJOQbzVTF8LPG+sg
	ajjFyLbumfQ+fc622LVdi19Pj2amQks=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sun, 08 Nov 2026 16:43:41 +0100
Subject: [PATCH 2/4] soc: apple: tunable: Allow passing NULL to
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
Message-Id: <20261108-t8122-phy-v1-2-c2783b2a53a8@chaosmail.tech>
References: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
In-Reply-To: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794152633; l=646;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=tJNNb61/4tJlpWC0322q+2yhiEktKqEr06Kk4Nb8njs=;
 b=Q8GuumKxSRJxH3/hIEU8kY4tFaiOjpFlNYj/mZ2ub8pRKuOc3ltoadcpa/bQmxdShKxgw3ZBX
 /LrSZ2tyatlDpIPr0JELHxr0HnoY+DCdWyp7P+Phi1JlHndc2XMp4nG
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Make it easier to have optional tunables by tolerating NULL entries and
doing nothing when one is passed

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
2.56.0

