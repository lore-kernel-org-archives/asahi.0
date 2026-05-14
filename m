Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8433DC4AF
	for <asahi@lists.linux.dev>; Thu, 14 May 2026 12:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778763316; cv=none; b=QhtPoC+PO0+7eODu2oqqCMKoG9DwG+K40DqMp3dzJ+CKcNUfvDLfIRmmDWHeDF/5p1WXJz6BRgilHpK1IdFJaVaqL/gIEIHYCwzNVIWIBocITGejcZ+/Ip9CCvc8Y0mTfjPnyl2Ou+TucIfox7V6icL38UOsKiaRXEm+911+GZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778763316; c=relaxed/simple;
	bh=nn573OmNpZxrFI75wUW33iuDsPMZUxrP0CYhUYOBpec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=p0t30akgtUkonx9vQCk4Z8pjt46uxo5z62i1axd2mSAHsz3HtEOjvtOoXm31f5A5CwSVpNXpWv9wLVcYM5pnHpCUN77aTajW55MmbiDQu/2Iu6IcPuNChu/L39n6ISoHUCURThhE92gHCJQPqdbtQ0mOeGohfnLgwOQA5+osq7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2Iw9VTO; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2Iw9VTO"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-366375c4076so3804093a91.3
        for <asahi@lists.linux.dev>; Thu, 14 May 2026 05:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778763314; x=1779368114; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1mOb+TPDTl0fQa5/hkU2v6gAp5LJjCUHg1aRjdDAAoU=;
        b=g2Iw9VTORM8l5eUg/oc+cFAUqp1vzVqGVZTj+Cq3vI6DeuIBMqpcP8OQEXKOhDHs/u
         dfnTU9o7Z2t+Y3bLWCcNBCY1WxPa2i7DJKdqmNxFxo3fSaF3yZbs/NVv5JJ/F2B77tYH
         VjzaMXLkVLJ9Es4f0xQAHD87NRxYyOo+iK0NCD7+79U6QTN9PAxMVSD3EAPNfuOWBpyS
         v+I/wgCfbQxO6Uaanjw0ALtSB+fL5jo5nH56pyAdxRdEnnnOJ1nk8Vba5TP2s21I/HHJ
         BFwNy6evC0+v9O27ZNxLsBm2u3JPJeWpN7vD7x3qXQYbIbazH3RbPfy/kAgZ1IEcNDHG
         +oUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778763314; x=1779368114;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mOb+TPDTl0fQa5/hkU2v6gAp5LJjCUHg1aRjdDAAoU=;
        b=MfBmUGshgEI5CqC3kigugG4kSSnDTs+D9csi5V3p48+lCFeF7HOnTj4Jl8iL82hRxT
         OWZE8MCJd5Ec5ekIZc4Zd+Fu3lmmbnzgMGKyeIK2z0LtOCsQnxrIO6XIzoBmm5GGtpKk
         YXF6NiHq8IfixOBzZXAvjnp9DvEDby24mobpMC3uq2QL0xP9AWD525N6yEY+yUUM0PET
         FhuMNjYZ0f6Rj8x/u2JdwITS+GWsumM1ycEE9Dqw5Gv2bMao/XPzu5no1Gw813/PkotE
         SdEg6GcNpmnyzZlgkiGMD7DUK7hIqcey5XwdBRaUpChjg93iDnVpyLMkBDJc8TOL+Vgz
         Vumw==
X-Gm-Message-State: AOJu0Yz0Fq6E8XnPRA5BntNhYBo5xmzwGsXYK7HZ9xS24UrEyqe5Mzrc
	+tJeC+r0OxqEG/pz5GNgDGYI7R7Mu3sn0x+9hyiWJpGjEPswiM9F2Wm7
X-Gm-Gg: Acq92OH+WEycoGtLKCMkQApjELI+b7A0aCkbs0T5Wy+9PT7gIIoKR+zm0JAr/iQrQPE
	oPWKuYSOla4Mi5PIXssqwILV6tybfxpflsfLfM6PtCVy593JUud7MunsRVferIyCQd8O5gzTU8J
	d9DUjbxl9sB9VB21jLxAYKfle9Tu5ABRitl0TPke3l0k1P2AM+YtrAOw+ytB6YQ44nyvlopyPT4
	T4evPhZ3wVp3y3JOPxhQWIxEHiEA6DTDXqWCjA8WbYanaYZFRpzEf8PQxAjN4tYmcEJ/727Z/Ce
	T+1Y4YjOapeSRhco1Pq7DfVQdE1GKvOG4u3unGgcQCkG24/Zpixw+w4KQlam/0RrPxOb4kc+hP1
	bPfT9X3U1YzMXq96MJAafeEF4G2oLTD2rDJQMOFehFMTBJyu+3p2/KtZfyaTn77gvdYTvGwjK9O
	5HAEH/U5nfu4dUGZ1RDJaQCGDmJTbFVOS7lmo=
X-Received: by 2002:a17:90b:540b:b0:366:4a47:f267 with SMTP id 98e67ed59e1d1-368f3d25591mr8265697a91.16.1778763314268;
        Thu, 14 May 2026 05:55:14 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-368ede204a4sm6464784a91.4.2026.05.14.05.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 05:55:13 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 14 May 2026 20:54:59 +0800
Subject: [PATCH] nvme-apple: Reset q->sq_tail during queue init
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-nvme-apple-sq-reset-v1-1-8931e455281e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0MT3byy3FTdxIKCnFTd4kLdotTi1BJdU+NUI6NUC4tk8yQDJaDOgqL
 UtMwKsKnRsbW1ABy3rQtlAAAA
X-Change-ID: 20260514-nvme-apple-sq-reset-53e22e88c7b0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Yuriy Havrylyuk <yhavry@gmail.com>, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=910; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=nn573OmNpZxrFI75wUW33iuDsPMZUxrP0CYhUYOBpec=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBqBcYnd58loG/sMZgnDZXeeue5linXTCbmSdFv7
 Usj8arhSQKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCagXGJwAKCRABygi3psUI
 JE8sEACSOkv0EB3TanSxWricudH11RnYjW39i89ufhg2B/KmfgK6LwCcWQlCS88vsW2iMGH7C76
 jViheEwfPWQoZqBtU3rTlXpOVbxckR2wovC71lItN8M3LCZ8pbWlh4W7MH4bzV7L7cSxBzBxGfK
 vNRFhGCI5hRheRFMOcTNQ7wVUqQXMYfEoss6qaxUZJcUwtq4lA6zsVGov9uGyMhxACrDZn/OtkG
 p3E+Ew1PYIikq40kUgX/2D6+wlmv32nho4ZX/SchpQJOpesTa5IY3mfW998qY6TuW6lDfSFPvXG
 AGPnBsEh6EChTa7vlkwjRhOegY0rKM0WcVy3RUYd8nGoeyrD61W5GAjSH/iuNG3PUWIPOoZCZwS
 bnjMn4Z0N3ivYg9Ce87FNy2Huiq+13T7geSfxZhbRktPjsvNtku3X9H5w+l6Lr487cG7m8hVDN7
 ISYLTNhdKCWWrT11/J212YFd+F2902x1QhhSbZoGa75UACZ3iYtD6IHMIR9chRj/FFcKKkKAVwb
 vZVb1urcw94MuuJlZGZy/RE7CMpADRgx2zQU69YRcp/zPOufafs2ffge4zm98IEwClXrVwP8a0S
 Hb89KP//znnoY53t0c6L6RTTxOUrE9uNRkSy4EeVYr113m7OV/tqdC8zMlY+LMOnqnPbB2WMOPB
 KD7ZiDqGTRNh0BQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Fixes controller reset on Apple A11 / T8015.

Fixes: 04d8ecf37b5e ("nvme: apple: Add Apple A11 support")
Suggested-by: Yuriy Havrylyuk <yhavry@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/nvme/host/apple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index 423c9c628e7b..c692fc73babf 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -1009,6 +1009,7 @@ static void apple_nvme_init_queue(struct apple_nvme_queue *q)
 	unsigned int depth = apple_nvme_queue_depth(q);
 	struct apple_nvme *anv = queue_to_apple_nvme(q);
 
+	q->sq_tail = 0;
 	q->cq_head = 0;
 	q->cq_phase = 1;
 	if (anv->hw->has_lsq_nvmmu)

---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260514-nvme-apple-sq-reset-53e22e88c7b0

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

