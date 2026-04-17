Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC39E3B4EBB
	for <asahi@lists.linux.dev>; Fri, 17 Apr 2026 10:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776422805; cv=none; b=YO+6Kz9OlklBKKiUPzjWrzmCle7LcKClrMYWPT5PbopZmYgXP6U2ch8nQ9q3r6f5Bg9Hrw6wSL7PWvkuLu7TKfskn3/KvW75kF24WWwrK1JHeUzH9NxkN8gx4j5wTyBC0juI/EUGkbST755bb77aMBrsPI5xY32AU0eOQZDtIxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776422805; c=relaxed/simple;
	bh=xxPE7p8J+Km72Fu9cE2Qxt25fuNU7Me/NosNShaHNjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VRnYVlXJhKx4YgwgItQCuokwYv9a9bjznemsbgNLY164e8d+aVsOGZeEgFgfff0Ont6PWbr7jNGrdQH6v/F2FpSMfpRdImvPuq+JnUZoX3T4JDNacgsN09acbAnw7dLjmLdbpdKEIuwGWZGAGJ3wYkyJpHFON5gY6DF3f6LH3Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeThj9v+; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeThj9v+"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d77f60944so391592f8f.3
        for <asahi@lists.linux.dev>; Fri, 17 Apr 2026 03:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776422801; x=1777027601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QNXTybxJ7WUCuHtax9bzQlVrZGGr1HrE+ejN+oTzKns=;
        b=UeThj9v+v4EyXBw9wVVjo+czS90vKcis7XXKOGpZu0ve/1L3vM4jDZ/3XXKWVzJU0L
         Gd1r8m6AZUB5BURHorraWSjv3f/qMgJ6nchIVdQIRcHpzMn2CzlVrUx0BtNSKd2kOpTk
         1KymGtI6J/K0W+ewev8ksyXFnGxxwAmVyQPhs6DrpWdSWOObUO3DgfTCGxGlTTy0jZBZ
         6cSzdIOmY+U3E6PG4X87MGN3SI2Zv8TmVXYi3X5Z0ieWvo4zR6T6DZwWcPvK5yfkD0Jt
         OwjoiIaoTEZLgqexwg8T8pMYi9ZzYQg2MPaKornahY9wayhFNKOQaIUxMZ9yvcH5DUY3
         Lt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776422801; x=1777027601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNXTybxJ7WUCuHtax9bzQlVrZGGr1HrE+ejN+oTzKns=;
        b=hFWt35n+2kIJ3sSwYgUVyxlX1gEirEL4tsf342zDnxAz2qwk8QPqNCvuzzxWwvahDZ
         JDB5qsCUMe9bANFWMgMpudI2ULbm8XN+9Ru+RqxjbhwYUeCg69e0kOdLOYur/nS2L0fY
         96ZFueWSBwfIvn8PuGWEOgcu8eARvjbzvN0SngcXHbbwd4/Fyby0D3jUU9TMG4agW0HY
         yGE8Ixk/NYL8uz4Jh1ts+afVSRGuBP1Akzp1MpL8Xwg3YgzzlBxQAIKembk5VoUDCPLK
         /REl8TlPT1534yFNx+Z8xn3MD6DsREydEmexwTZNa4iksuPWQhcYhii6nXTqX5I1Lnx/
         ZIbw==
X-Forwarded-Encrypted: i=1; AFNElJ++Jq7IgjtXBr5YHAlcWdQgbaOhgY7hRyQuif32CcZD1uV+VmrSIi6/O4cTzfzd13NbfVoPYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMS20Jz6uU9P70NDkK2FJz2Q7y7nV6NU8g3zz+ew7WniV/djGs
	uim4g22CNAl9MNnULkSrRo416WjmkQmiJieHP74M/lKorQM3OSmoKX0gS7+7Lck=
X-Gm-Gg: AeBDievSs8vPv7QDDGlq9FoZKIHnZ6PU21Ks2cOsXLHohhYde849dVPepaiL1EHJdXi
	+fbAr8A/CASBU1oWghFdBsS3oJKyUkza+R3tfOpkqwdP8bOCIP9phJQFDDvqX7GVqZADYuFrebY
	YIv5Dvk1HCfqZn3nes6vxJqwU7fk//N+hPhaVgkmlS+5PtxN2U6WDamrhht5E38QNBekhIUYhUk
	WFwt3V9u6b6D8v7Ws00C6PxRyg+4BSAesRO1n705GS6qE/PngEhJVkKLWqR+jxhXWhG/E4Hozg8
	EoiM/Uke6NLKrWXW1UkeW+ZE8xmjEDJwtP6P1hueIaduxUsEFv2yK78AVO0KyEeiQK01i/XyOB4
	Epnd7w4+iBwO9kLPz31fqjb8szty6DZ3lrkHYkFaJQv96J30GTWb0uqtk9jC8J9fFR2bmvWCcRA
	i/XC8=
X-Received: by 2002:a05:6000:2387:b0:43d:7c91:49c with SMTP id ffacd0b85a97d-43fe3e255ccmr3448516f8f.44.1776422800911;
        Fri, 17 Apr 2026 03:46:40 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb13a0sm3699809f8f.8.2026.04.17.03.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 03:46:40 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: luiz.dentz@gmail.com,
	marcel@holtmann.org,
	sven@svenpeter.dev,
	marcan@marcan.st,
	asahi@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v3] Bluetooth: hci_bcm4377: validate firmware event length in completion ring
Date: Fri, 17 Apr 2026 10:46:39 +0000
Message-ID: <20260417104639.2608008-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

The firmware-controlled entry->len is used as the memcpy size for inline
payload data without bounds checking when the PAYLOAD_MAPPED flag is not
set. This causes out-of-bounds reads from the completion ring DMA memory
for the HCI_D2H and SCO_D2H transfer rings.

Add a length validation against the completion ring payload_size.

Fixes: 8a06127602de ("Bluetooth: hci_bcm4377: Add new driver for BCM4377 PCIe boards")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/bluetooth/hci_bcm4377.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 925d0a635..5d2f594c2 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -755,6 +755,13 @@ static void bcm4377_handle_completion(struct bcm4377_data *bcm4377,
 	msg_id = le16_to_cpu(entry->msg_id);
 	transfer_ring = le16_to_cpu(entry->ring_id);
 
+	if (data_len > ring->payload_size) {
+		dev_warn(&bcm4377->pdev->dev,
+			 "event data len %zu exceeds payload size %zu for ring %d\n",
+			 data_len, ring->payload_size, ring->ring_id);
+		return;
+	}
+
 	if ((ring->transfer_rings & BIT(transfer_ring)) == 0) {
 		dev_warn(
 			&bcm4377->pdev->dev,
-- 
2.47.3

