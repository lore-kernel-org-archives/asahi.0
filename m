Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B2A3845C0
	for <asahi@lists.linux.dev>; Thu, 14 May 2026 13:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764596; cv=none; b=QZDGUru2Ls4fBf+y1mFlvZY2sXBpIu0JIN63UYabbx1Z2kTYzVlP/wnXZ8iK3LNKc9r2YgdYi0+CLWRR/VO3h+OA4oUbbFh7Oq4DfkWhB4wf3ooW99UO2ejyXCtFzSYEwUzGnuLYHhGWrbWW3NS3yTJd0ioURf2amGem9FrbNVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764596; c=relaxed/simple;
	bh=jl08X3NCLgmcZoiX/JRkZFjNthe8bvfBiVgfd+XVW5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QldawVMzRMgeu1PyGjW5AP85EgnwtHVhlhaFHZiIhZJewiy3a93e6TKQBMSO9BKyC4w1QRnSypGNK9XZaKisjnnvLou8ylyKvlu3xNBT/K6WkLz7L9tpqpQFgvFdZ6miV3zatWnXLFm956QkV/e0oI9M+NdvD+30GeLkYpsd5Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oCwSt3gp; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCwSt3gp"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b9fcf7c91bso79064665ad.0
        for <asahi@lists.linux.dev>; Thu, 14 May 2026 06:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778764594; x=1779369394; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dxjsDTEPx7x+FMifRYMV1hqCeB1iIjDkPxo6+pakXPM=;
        b=oCwSt3gpfMt5Kg96V93zgaDfFoxvlIrnUvxpspS1fM9s466vUeTaRpDDMqXdPEAIkL
         R52DT32KwB3jO00+wVhzZSETPR/rOg6WLNzLblEy+8lWIbbvNf0RlgKNxx7fCbgNsb77
         RPudOiQwpxQPsUycUb47lbnHcgUAmAXB+y2CxogmSBvYQgfV9tJTg1RaE6vdPYhZw3wy
         X3768x3pNCpB+LsgQpknSC0+mUEVrD/PHGDVMZkcwJRm26I2J81tfggf5uhlBRuwG45G
         jci6m90cF/cEb+owVakiQBqgApV5g8zD00E24dJ/m2TiQfmuRNJVQUbe04V7R/2W1tcp
         jRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778764594; x=1779369394;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxjsDTEPx7x+FMifRYMV1hqCeB1iIjDkPxo6+pakXPM=;
        b=M1gC/q4DjcMy0N+Jbw+oHcDHFKA8HI5R/qlo6bw8ii8W7KikjsAC7zeZJYmRS01tr4
         4yAQ9Q/F2tGlgRnWBsIDeQGEityKWky2/Tat0Qu00hA+XBkl5dwkgYG8lcxLgEfV27dh
         koYjP6QMTc+h2Ji/+Ve82CHSDbHqd3V8ZOFCDvdUYGhO393DskqKg6ISCkoY8OZelSLS
         DaEa3TTHwGM639xpDhR4onC+y5MNM4VN+xYtn15LlT3UGJZdjKIqXOzWqymz2TeGrdzL
         9B00dHRc2Aj7wFT1t4N5fuei/TRxe39dJQ2sKCI5drdCY/53USZuUBLvu5vVlds8Oayt
         Xe+Q==
X-Gm-Message-State: AOJu0YyqXlcLqFHtWZI27R8q0Fue6ZI+C0Nf0cLQg31gZOoisu2Dz7v0
	KEfMYpuz4WB6VRTYW6GPykxhEOw6AGWCy3qRo+FB4AVz5V/p1nOqGUVf
X-Gm-Gg: Acq92OGexqIFwJ7LqjSZep1QZFyEsvIfS8cI88F2CSAywZPaFjU3MtpNY2aNIqkf+sA
	ke4zfk8DloGsK0Fxn8XFGOIldPqlQjNxS6EBTknwnAjVuKbNmm9uy2WQKa5zCAdukFIkeP8Rojr
	NpA3KY0TdFYu+U0leTEZXvcgxFmA3e6NuJSd2zxfjUqugXg1yzZdpYklAt3J6k6ClbU8P0LujVT
	I4JiUYn50l1u+rLUNNI9eKZfzQT7BQknpawBIgVffIvyMZb6Gp/ro0KAQxEC23mLc2VcfViCYTT
	A+J8yoJI1YdVTbdXjF2epeQ/uS/FyR91bc6CcIel6pBcmzh3DWuin0chKCx9J2/xVEry8QfNfMf
	3RZBLif1faXL9qHARkUyyAaWbp+ViClyDR89Q14vrV8eLVWQ2HGf3k+wHdMOA4F/SJ+x98FNRIa
	KMq5dVO99NnY9djK1jcW630eKQINQMKBJHpGY=
X-Received: by 2002:a17:903:388c:b0:2bc:e62a:979b with SMTP id d9443c01a7336-2bd30333de6mr80854555ad.30.1778764594127;
        Thu, 14 May 2026 06:16:34 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2bd5bd5f30bsm30953275ad.16.2026.05.14.06.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:16:33 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 14 May 2026 21:16:01 +0800
Subject: [PATCH v2] nvme-apple: Reset q->sq_tail during queue init
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-nvme-apple-sq-reset-v2-1-84cbb5c70bf5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7RhaqFZW3sOwQPzCJECxJY2Gc
 HcrB3D5XvLfXynACwJV2UoeUYK4KYE+ZNT2zdSB5ZGYdK5PuVElT3EEN/M8gMOLPQIWNgW0hrX
 t+Z5TWs4eT3nv1VuduJewOP/ZT6L62f+9qFixvRQKpTHaKly7sZHh2LqR6m3bvmtHeGy2AAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=jl08X3NCLgmcZoiX/JRkZFjNthe8bvfBiVgfd+XVW5g=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBqBcsvQUZgV7lMIoBJkU6SplIAUQALX59m3rswM
 Ju0qI6zlQ6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCagXLLwAKCRABygi3psUI
 JN8JEACwOZAPoKWuJZMLfBID3QAgWkZEOfVVIl1hXXM5d17MAF1zrTZA8DDoNnOxJJhQJiRsOlp
 +QA8rVCZkVF2d3eukmBADzOGA2sLHHgzFHdHsMiC1TzaVmyOyHlosVYQ4QpCOrntfYn8Ief+kf1
 dU2C8V6wfmrP69rmjJWBOxIWG/ITq2+A+PgNZFJw8rvIYw7EmdvudX8Ad+9YnsgyRlsTUEBg1zE
 SPe4LTeH1C9DL0SFhyCuAOsQ3YGr7L0E923wAgUPYmUzmATooVEhyGVouKE0p80jPPTSWjkTq+2
 sIBrK9qlOFgLaWFxUgYP6/Y2R6NFal9KSyn9nQtcuc+JrnbXisbX2XRYRnW4T3zIFqBPJeIwaBr
 HEKQfto0SI0mOrxyueKQsge5FMYjDF5noX0ZqsOmPs9j9yJOI2lAk0PBlAa2trKC3NL1Giz5XuV
 6pyftpibUZeTTMDlCKryZCaa7P2htuazpMHGUktU6f3mlGDXKPXLu2KW5kZwRovQFlp6HaMR9/1
 4q+WnDsfn8R3j0qo7VGd1uXtbS4gAGtOJHimc54QP82uq/92L8GUEQu2THl1jhNTbPmZ0XSD1Qq
 JE32qAW2gU2Bskqmit3QUg9ywWgIG/qsW0aqk+BVCKXsASJL2YkOZxQQP1YuKftd/zp6yR95cvp
 29qFsWAWPK+XS6Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Fixes a "duplicate tag error for tag 0" firmware crash during controller
reset while setting up the admin queue on Apple A11 / T8015.

Fixes: 04d8ecf37b5e ("nvme: apple: Add Apple A11 support")
Cc: stable@vger.kernel.org
Suggested-by: Yuriy Havrylyuk <yhavry@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v2:
- Cc stable
- Details on how controller reset is fixed
- Link to v1: https://lore.kernel.org/r/20260514-nvme-apple-sq-reset-v1-1-8931e455281e@gmail.com
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

