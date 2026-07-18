Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A81733F390
	for <asahi@lists.linux.dev>; Sat, 18 Jul 2026 17:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784395526; cv=none; b=iBy5mnGSanmqsxIPZHbDIL6F0QQ18SY2MEWBKR7HOijQydohLmZmLOJ6bEnTpFuQP4MjHQJDjOUL7dVMYay+vhbwE9C0GjZHwKmDdtR+0FGJuvhlW8/tCT/CjYupEzuGjb4i5zqFIFqmZbwBRxZbZ9l7ofUtwxvyUTSPlGmVclQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784395526; c=relaxed/simple;
	bh=szLs5CcDZwYWzOei8Q+NZivNVZp3qcW3phKkPE5EB1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KvcHRzQ8SxZdrGCYyuOIR9mIWqPiEKyu4rI76MKxvMzsJo7HB08j1N94Avp1y4V1boj9yXHNWO8CZuZHrCSFnWQOdB3u9nyGyA1+r25eKlVTFecJWPZwIdH2AtDH0L8Ml3GNq8YcbVhTfA/NyRV3Tp+1IjKUCIScMcrXrUtQ34A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=h6sucMOY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="h6sucMOY"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c733f15aso76604365e9.0
        for <asahi@lists.linux.dev>; Sat, 18 Jul 2026 10:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784395521; x=1785000321; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oiJo0XVJPw2rjt+rcIvwSaUqFzjRlb/yk8buMFhbHKw=;
        b=h6sucMOY4uXzRuh89De6JsEFAMrPjvlM4DlpIwzAPL2Xm9L13yjcxV+epOBUfydCHq
         M84VWPG8d+fPdHeqlQ4aYc817NHtKnPrq6ps4g+uVxSFjY6AdsJHuwril8irtruuEnYc
         mQMCbYEG545eM1WT2QBuirDEQmpCS1P9xHrJFZ/JAfwHD7yQhG6XiGPgRa1dv7DuXrfa
         3IpUh5VBNdkmv4SfoUKk3c9sW22HfzgSq8yXUQ6VkOQWdVeWTDT37OCdlJnOAueQ9jzN
         c4y1G4tfX5F6o9kiwceOzE0YFMIxzkLXtH846PrSfPW/EBDycBFtBBJv8Bgzl/7dJKCC
         vOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784395521; x=1785000321;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oiJo0XVJPw2rjt+rcIvwSaUqFzjRlb/yk8buMFhbHKw=;
        b=F5e9Kw5PGSyccZGus5DTXfw9F4QGwid1t8nsJgj9X3orR3uXlD4H7V5usO5R6Djo+Q
         mectFK5BAvb8aoRXLKthTBToCHJZLYSW4p6PZ3+G517aYWTiS1ypzVJZVZKvqk1xHkZz
         FhUrwcoNKnuTgytYC1THr41c94LtXdAmv7ELdugwRhUFZeV5Nl9A74v3EtX5uD8SZdyj
         mbVdZFEWxvop1CPJFSZ/BQb7YI7uG7R31fsv5eBWI01Q6u8NAJ8XlRk/4EvXzwlaqWv1
         g6ywEoPxbE7IirbS2TeVc0HWSZTzqfm8feqPTPZ/kbI/huf4KsGdBmVjKevwslBGNwgr
         1DIw==
X-Forwarded-Encrypted: i=1; AHgh+Rqly6xJxQ4LXlKAlHxXUdPtY6UtaFCOnl42SaUHX/nd7GOsb7+NJOBlfNFqBEr3UGqF+Rbkug==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+QEv/ASKvZ6hL1vGwx1qWUJtYQcJiL/RKCtaYzhmsr7Z8HMq1
	4aL5Yi7mXLgnOvB/0JAs1511GjjCc8ykpY/8U2mdrjswo/p5t3kpliUcvWvNaugvZJA=
X-Gm-Gg: AfdE7cm6+fD1h6ZmBxH97T+hZ7UIxRUQgxixp9peT8ShII+OUY0GMtyvLRGwM2o95nA
	/qUZSHy0S+BnVrzY3zfNmSVsinfj7n3rdl7xoSUOBrl90m8WLU7WymdV3JM0Ha9R119bbpwmwol
	r7CxSwOeI3Sm1CueONm1OT+PjFfaFHN0BKg0y3KYnSqryFa5ZcPvQJ+oFzXBiLTmJspOYkn6v2w
	T17uhV+3sv2nZuz/pa2m+6/L1IJRdjfX/P3Xs+mnNxAWEN6znyvgYMNhXIBIFpS5D/voe0UTm6t
	RPht0NdnFodrGhiNsIS1LGpth5vt6nU7Oww/79h2EMCNF/GOXszbSKLbyjzIAsfw0rjAkEYd6xQ
	J0zIL3H6e00sSUEDVX2iopv1fe53E5jWiWTv6CZrEA1kdMKXPavKsgwOsa1jysWT6i4zdnCBmdV
	ZeFe4jyxw=
X-Received: by 2002:a05:600c:1551:b0:495:5858:e163 with SMTP id 5b1f17b1804b1-4955858e1damr1152765e9.27.1784395521571;
        Sat, 18 Jul 2026 10:25:21 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-495499a5847sm102758895e9.2.2026.07.18.10.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 10:25:21 -0700 (PDT)
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
Subject: [PATCH RESEND] Bluetooth: hci_bcm4377: Use named initializers for pci_device_id array
Date: Sat, 18 Jul 2026 19:25:12 +0200
Message-ID: <20260718172513.986134-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2277; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=szLs5CcDZwYWzOei8Q+NZivNVZp3qcW3phKkPE5EB1U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqW7b5l0Xf7DwIpP+bsrs2vbQ/0/z6agzIC30mc po64ff2EqSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalu2+QAKCRCPgPtYfRL+ To50CACKAOW2gW2kAvbfG1qPbjTY5veMSIusBRt/vgLy1JwBLwrE3YL1Vr8xDm480Vo5R8Y564E 6h5yd/+HFf7L6zW2S9ed9J5TMpsfK959oUZj3p9v754oxy2N0Y9UDo2g5BRzuaGOjlVk0LHxpHW 7Q55+MdVLRvZTVkoqBfhWjatzbaDmqkUoNJI24uqTwCmPoUEDtQiUUQkGuVbOX/josyADAf+4Te nAaMpGU/X7oEjt+akpqneCOqxkgnwh0RN3VAz6KZG6x1WC4K9wx3h7vxwOnmfbTfVCFJlSj1tKw CWi6ngKPT6xfbRklyiBSkGWz8eKGq+moaY9vUUeaaZTTE5y0
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Initializing a struct using list initializers is hard to read, compared
to that using named initializers is more ideomatic. Convert the macro
used to assign values in the driver's pci_device_id array accordingly.

This change doesn't introduce any changes to the compiled array on an
x86 and an arm64 build.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

it seems in the bluetooth patchwork patches are archived automatically
after a month. And that even if there is recent activity. I consider
that very annoying for contributors.

So to get back on the list of considered patches, here comes a resend.
The original submission can be found at
https://lore.kernel.org/linux-bluetooth/20260504160940.2168650-2-u.kleine-koenig@baylibre.com
or 
https://patchwork.kernel.org/project/bluetooth/patch/20260504160940.2168650-2-u.kleine-koenig@baylibre.com/
.

Best regards
Uwe

 drivers/bluetooth/hci_bcm4377.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 925d0a635945..89c317561bfb 100644
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

base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
-- 
2.55.0.11.g153666a7d9bb

