Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37F53793D5
	for <asahi@lists.linux.dev>; Mon,  4 May 2026 16:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777910992; cv=none; b=r9KoqTF01guy+qTQYd5OeTen00oA1DLQyNTF/gxLARvIm6DJQ9ZlHAPzkAbgXYfMbFkeHPmmaoHQtKzfAWGmWMuPPa3YixBdmw+5sT2eYpxDGADApuldkt9gSvQElTU9r8meGlzWGb0+jQ0Zgnzgn8edw14AaSzyZ50tSsr+ufY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777910992; c=relaxed/simple;
	bh=CmTMxazb9aucCLhZKKjA+cLLZtaezjGo/cD+BLSKmaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UhSK/I2iwLUp4BHcJULaSsr5M5Bxn9jvoLc7yDHbEAMpWmwgqbCM/d+IINsqesZ95tzgQ3kNsc314xP3V89vvyHP1sSbVOWtJyKZF0VBXHKBkwDK8O4RFHg/G1rv7HuvT5tZOmXHcBzAwTIOzGU5Knzt1WlPyhJ0vbVVuHTVSIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=DpWbnbfu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="DpWbnbfu"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso48530465e9.1
        for <asahi@lists.linux.dev>; Mon, 04 May 2026 09:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777910988; x=1778515788; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r927EdXxquUzRi784TQe7IBsAleX51QDV6fOSE5krwM=;
        b=DpWbnbfurJMEmNKDmV9+a8E2Ky0BnaH8ldQGVvvH67NTc+9uzYakyj0KfEHjtLx9i9
         1MtQDDvDJSuiSyhWNYl7EZnMNOERm9Wuhig3ABy8RLMYBl8sYFAAC9NGyOZWUYBxy6cO
         BYYmDr4o2YhEi+XFNuiZtm4KUvN6gyBbj0iR094CcsrLIa+AiE7F/nYd769mh83BEoTE
         Lfk6O+hcTVA9fJ3LSNYEnRysBlLsp98CzLtQbrW85O2l0yx7tzDaS6MlqAsqM340Vk03
         fsYVZVztGhiyKPpwt0/6LhyvU/HvHshR8wyhicvWLNJlJQKr3uqHSleyHUxSfLhsRK5Y
         HXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777910988; x=1778515788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r927EdXxquUzRi784TQe7IBsAleX51QDV6fOSE5krwM=;
        b=bVR2ECNzA3YpbiUlzkptYsQqePUsvjAiXTi4dMcYuZLQj2liNEV4+SGZvuglax3Bs9
         li+GxJfi1XjZYAfCP4qgwcp+gnyj+AggFF89Sk8GYnvkfdGwPdvl75ZE7GqXYNgafiiU
         j0EU8zO7REaKqL8I4q41qrLS9eDbxscRa+AJx+RI9PPwGcCMGAHAtr7W80aJuiNzhtq/
         JK7FLmvHU8GvgbkDbuaATKdApjDNAGo9JcpoGgjHykBC0xZbt+DCknd3NyV6IbLm0TKq
         qQD9hh/3yB0V3bIw+Gd/Ajhw8INbgAsT3qRGoGZvAfO8RlTjLNNBJYRIEXdtznR3Mozd
         bHOA==
X-Forwarded-Encrypted: i=1; AFNElJ9E0iuTZvxXiBHTT9d64DWc/kX35aRKu9stOpBQYO/EvifT+KEK6R9CmeHrCaSevmiKoXvAXA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3qmxWRKVRsfTKN/s62iowuHk5GNfHO54D+0Bce9oHVZR6W5sv
	S+2nl/202uSWoFAPkUfmy0ndmteKDJnZdIqbj5ZXfsOL8OprLmcn8DlzKXPGIX1ZrIY=
X-Gm-Gg: AeBDieurCzbQerkTFJ+GWEuVxRYh0pprzrkuJaj8PSDqgaArN1p3vUak+vttHAKlqBa
	oT4QB6iPB7laZe0LMcCp3mdoyIR5gjSGo2DJMLKu5aScjBAHKCLU8j+PDcw3nuFS3hP26uj+73F
	owHHzi/2GODvzZRSL2yRko1TlkLtdVFRZWxGCs4uJShrlV+Gm/BUL9x7xBWLikARd8JOGLC2qFp
	qHPCp/pYPTqPVW6YdBtY26FnPd+QMei5tGdKPityn/s+LxJdntUz6B1XbyCrSNZyH9IKohyvTOB
	UE4QyDgOdnQM0lr7uIohKVxVA/OpsJglpy4qTy5hXLGlBD54sxb7eTIuWIzGWn5t5oe1viZpw+h
	dnccTsfHsEZION+0mKn3uZub+f5wfb6EXnBoOs7TNLeJcXFTrZn83MmTjUpwxjnd4pdHic8QJ6e
	OSSWygehC10CTZjlk4uK3rIKYImdzOCymbp4GMgzzSkI92KdL5rGRO8/AWqwJopE2x91TWcjx7M
	YNpYurPU4MDe1RjVhRZnW7Xmg==
X-Received: by 2002:a05:600c:3f06:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48d1424a351mr2853855e9.8.1777910988389;
        Mon, 04 May 2026 09:09:48 -0700 (PDT)
Received: from localhost (p200300f65f114e08197264a4bf9e813f.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:1972:64a4:bf9e:813f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48a8eb75fe8sm289596725e9.8.2026.05.04.09.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:09:48 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: hci_bcm4377: Use named initializers for pci_device_id array
Date: Mon,  4 May 2026 18:09:40 +0200
Message-ID: <20260504160940.2168650-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2452; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=CmTMxazb9aucCLhZKKjA+cLLZtaezjGo/cD+BLSKmaM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp+MTETAj4MRLVp6upKPuoUtwbYrRf1PX5wwFma Js/XyqYbzyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCafjExAAKCRCPgPtYfRL+ Tt6hB/9GjwroVu3uHf9J5uqO7394zE0RlEuyZHf2ytSxaeZ16RG/COodYGALkZjDEOlV6COy5I1 yQB7Fg68R4mmQOYH7E4RCFHCeYeretFYKljhvo1s+2Aaaym0PmpgIoEmc6LdUNXu6NGoYb0wg20 hes/00WwxShmGb8k20rErHdNWJ4ToOjM3nMqKUbk6PJ328vLDXcIjh5FweI54NuVkibPOgUA4V9 yTF7bM59tVHMc7FFAu2eQW/mWFDOkJDKyYAua9UhUmaXYM0JWpws2CUP8ZZimqurA2t7OrU1+AY zB8QFRTyuHnXjw2lm3Ow4/KWsQhLYy01aID6U6vOHRUCfoW9
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

this is a preparing change for making struct pci_device_id::driver_data an
anonymous union (similar to
https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylibre.com/).
This requires named initializers for .driver_data. But even without that
this is a nice cleanup making the macro better readable.

Gcc is happy with simplifying the assignment further using
PCI_VDEVICE(BROADCOM, BCM ## id ## _DEVICE_ID), but this is a bit fishy
because PCI_VDEVICE also assigns .class and .class_mask (using list
initializers), so I didn't convert that. Once all pci_device_id use
named initializers, the two zeros can be dropped from PCI_VDEVICE and
this entry simplified accordingly.

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

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3

