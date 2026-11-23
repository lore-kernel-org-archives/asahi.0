Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449876;
	b=PICjGrtpUnUX8tqAgoHjVFrDVEl8zXa9KaCQHMAxSLqLNJ/sibbC8DBA70Bg+AEVlYqT
	 OHpTuZlfbo/NIgVNfhonWHnIuh3rTn4JpppxDe949wSBWm7TafLub5ktqq+OP0+Pg5fTh
	 kpq8QNU8c5mt5YI8jftkS2LY/f/tNwWlVjWVzQMSEwtHpWTxWPfnQdslPc1Hl9i74Toan
	 fEcDN5quQcnKtBdjwuyIzIsbhq955AJ25adx+nGfLmjpYqoUrPCqlWUs5q+0dy2npCMtv
	 uEkGVqrW4hWoLylL/DDQNau6HmDWiKaH8uPLeTkLMSOp0lzoLMk8IFCXN1fwXNkOeSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=BM0F8B0uZIrlmAuRI2NRKM/dmk5YstSmP3No9fJQH38=;
	b=Q7PyvWM9AANZ/08vPDwJwqN9kPs7Njl7AxEaf1k9VlnPqYBTt5OgadYAgVN6T1ScXOe/
	 dAt3POmnJz0Kc7mLKMJrIuvyaxtr2wmY9Qmkykip7jsi+klrgVG/o+I5yK5LjvGIOwBHF
	 U2jtFopHKSsVprykZNBW3rp6UfmpSPSs5tUulC78n2nHlyQ0SSU6w3mVCOGAjE8vyNrZM
	 Bt+4DzWPRTQLECXY7ROaN3SaOryvuUQo/nGYgDeGl/NzUoaQR3jsJOw96CDehvlbrVbGY
	 z9JNRE5s4ku/PVFglwzUku6AdX9hGVonzl+WDlUnfQDu6Jchac/5vplQbbdTdGg/+NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bnQcan8M;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FD6606A32C
	for <asahi@lists.linux.dev>; Mon, 23 Nov 2026 16:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23FD6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bnQcan8M
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso414238f8f.1
        for <asahi@lists.linux.dev>; Mon, 23 Nov 2026 08:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795449873; x=1796054673; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BM0F8B0uZIrlmAuRI2NRKM/dmk5YstSmP3No9fJQH38=;
        b=bnQcan8MkzamLsU7F0tjhx4OpJBmKazlW3vfoa3z42/f8z6vh63PqMV5EEohocpCNF
         VEdtZonmbxuxkXQho7zw4j9L4h2QyPqu2xaUug4hLEZUyHT6lE1WXLrghmeHZ5CdgaSC
         Ua11ioR7chbm9iEzj+zr2g8iNHqbIJq5o5hqe6NN8G6Jvi6swdr379dQqq9k5qAgopI8
         KPwJ+eJYeg6SZvm9TYzIoxcNqkZHHcMu6GnrIkKowGLFAP0p2pJ1DK6uJrf6yrIvsGZV
         yIOy/07XjXGWLfk3UGmqEWMXc3cD1yvgzqdAwCjZ681itU2By53YVyeWCsTIjHLYN6sz
         7YZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449873; x=1796054673;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BM0F8B0uZIrlmAuRI2NRKM/dmk5YstSmP3No9fJQH38=;
        b=dMFnbaURPHtsyfj8kCk1RsrtYwl9gx/eOQj1NBe9jGErSVAVHb3wYcOtT5OPTQVcnp
         o2AH8cGvGAGb33K8iuOBrcO6x+vJ//MvNvCUdfAWjVMjJZ84OtDV8nk2OcaVMWcbko0I
         txtT42frDkaEUR45JNvQEKbqtz7Y/dGxanX0r+tiYnD8n07KxJ9X9WEJg550rvcGobE+
         9+9ux9v4Gdx/zohA9DTRCNjbIvYYfqhIWC44QUqE272D7G8f3zBf/8rHtIShKbYqPZ6G
         cR7xf/lkfrVoIuNDAIn54vUickB6Qk3hinSN3PMr3h3ihafl9TDScNc5tn6QgXzz4Kx9
         YikA==
X-Forwarded-Encrypted: i=1; AL+hErHLHv8v+XwUES87PS/Hqy0y6x8OpSBWrmgwlG36Ki4Vs8zvEOZu2TVJNCAgzGMZbcZretINtA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+M+xoSL8IoCCIWPz/hB6bn/GcQWaTQsVXJg8x2dHTsTuyS5CjG
	DlLh8lU+VnHwNuRutSkfHSH6rcy+7jSM+UClfSxHU6mKwscG0ulyl/pNpe7eGWobHrg=
X-Gm-Gg: AZFdTZd7U+B3/2PTK5MJtPmtF3lNFbw3ji63ZnJiIuKq8+1xrm9yW3HnB988usmzdgV
	rvoHFgF8KW9xroIoXHDAydQywrFG2D87rCdmH9f4e4QJJg/DM4TmT70gMmbLzEOKvZWD0UQ7Oqd
	eR73ttPZUBfi9rrIaLpylz4/iezkSxBIBGwmX14VdrF/66H2MBVqj99185b9+tc9uZRRDp5aB45
	DLsNEaWX3D/YCPcpc7tWYDYqMQQV1Jh1leVOyYcfLMO4JU18ruqFc/zINjUCzEV2tCDQm6cHLUl
	mV4FzMujg+WJ7wZhdI1FGxwMrjNpbP2Y48oQ5JwPC96hg1Gn4f6Flo3LOXu207GzUZT2k/kvZyt
	cKNw48GVEjOHaYhjXJk/KYhemSFuiM7GBqQfEFvUWAUWNN48x3F2iKX7EvduGZ0kKJY2GE54EMP
	1NlP4qjZbXq6BgqdMKnA4VQEhYKqvvx3lpxVRoh9wNFz3wCeD08+mrdDnYL6NPVnT8DfF6S/wcc
	/VbzNe9Nqh04x8b9nExeioT3kHfIqRTdhjrb7my48kqUOvQZ7Qvo3AD/wrrSQXAZxZZ0mODcsbG
	H+1A8hIpNDtYX37jOXDEwBWzUeZ4Wy06HMcXu6uqGHLGsmolqYra4zHYsGsJfGUvjrvMgz6P+HB
	kGnQ3WaB0EMdGtVTk
X-Received: by 2002:a05:6000:4310:b0:4a9:6c58:178a with SMTP id ffacd0b85a97d-4aa55bfeb43mr30234907f8f.12.1795449873436;
        Mon, 23 Nov 2026 08:04:33 -0800 (PST)
Received: from localhost (p200300f65f19a90445515a0bd0762d9c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:4551:5a0b:d076:2d9c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6c340df4sm26507719f8f.55.2026.11.23.08.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:04:32 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Bluetooth: hci_bcm4377: Use named initializers for pci_device_id array
Date: Mon, 23 Nov 2026 17:04:21 +0100
Message-ID: <20261123160421.3227994-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2285; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=oBOBpE2L2GptXbojrM0cYbgWlJFm1d0CC7BXFv6hEeo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBGQF87UbSoNY7tEf7OIpBMP8e7ER1F3nxV2e5 /rXR5oY4lqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawRkBQAKCRCPgPtYfRL+ TsNtB/9VbcpdzRp2saBCj7NASZGY7gQVockWHmQ2ik42IgaMyheB2m3F2iJvDHu66R8Vo52mTjs DiDGZuGAxkt1AVME1/0+H9ol8iZ9PxLZu3K8lXElNfiHuiVOG03YQwrAjVgEf9nzKVKugZaf6Th Bby5V63KB0yw3wO5GlvBxuOt2y7m+cu30Pw0RG9+Rw9+f/lbzi76ozzNRPjlzLmxE6JnH26LPjn pSgJ1bw6gSOBiZIxwOMLgX1Qwi4FsN4b4GN4s6hdhniV6bi+yJnzuwxIgp0H6UyOQVD7PB+qopi 70N+dlezC+ptpqzmmG7SgoDKO1oub3JyNF4zngG11HWyz/AA
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Initializing a struct using list initializers is hard to read, compared
to that using named initializers is more ideomatic. Convert the macro
used to assign values in the driver's pci_device_id array accordingly.

This change doesn't introduce any changes to the compiled array on an
x86 and an arm64 build.

Acked-by: Sven Peter <sven@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

this patch was send before back in July (available at
https://lore.kernel.org/linux-bluetooth/20260718172513.986134-2-u.kleine-koenig@baylibre.com)
and before that in May (available at
https://lore.kernel.org/linux-bluetooth/20260504160940.2168650-2-u.kleine-koenig@baylibre.com)

The feedback on that was a linter error due to a trailing whitespace in
the cover text that doesn't make it into git and an Acked-by by Sven
that I added above. I rebased trivially to next-20261120.

Best regards
Uwe

 drivers/bluetooth/hci_bcm4377.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index efd3a6424301..ab5a593ec0ad 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -2525,11 +2525,12 @@ static const struct bcm4377_hw bcm4377_hw_variants[] = {
 	},
 };
 
-#define BCM4377_DEVID_ENTRY(id)                                             \
-	{                                                                   \
-		PCI_VENDOR_ID_BROADCOM, BCM##id##_DEVICE_ID, PCI_ANY_ID,    \
-			PCI_ANY_ID, PCI_CLASS_NETWORK_OTHER << 8, 0xffff00, \
-			BCM##id                                             \
+#define BCM4377_DEVID_ENTRY(id)                                                 \
+	{                                                                       \
+		PCI_DEVICE(PCI_VENDOR_ID_BROADCOM, BCM ## id ## _DEVICE_ID),    \
+		.class = PCI_CLASS_NETWORK_OTHER << 8,                          \
+		.class_mask = 0xffff00,                                         \
+		.driver_data = BCM ## id,                                       \
 	}
 
 static const struct pci_device_id bcm4377_devid_table[] = {

base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.56.0.rc1

