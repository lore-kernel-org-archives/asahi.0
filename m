Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C211E49F
	for <asahi@lists.linux.dev>; Fri, 12 Jul 2024 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720793104; cv=none; b=mXZyJtgQ+yat4LaPcYWBAq6vBuDGKtNoP8k/mgcs4aH5464czEUURdmbVgta6+Webn4XfLUBsGPmgcdGJ0nKouXxQwz3cBbqC+FL5VwB6f1TyYMD3wn5cpwPrbrZQBqWIhqFdcC9ydbkyw6XAvSJnaCovYZMQqsVtomihPQwUII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720793104; c=relaxed/simple;
	bh=IKwu4IeO4ctIHCAUeLuXDVYmpaVD4J5Qf/i0s0LEYt4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qK3sYGlGlWMeOwfXD+Rb5oR8gF4ENb9YYRN7l9ZZvea42TZlZhIo5JqRdVLBnRYOAAZ4LC+CF4qE1uc2iEiYUkWVE+83U/BwXaIJD1EWMR/8a/0SiP9hH0x8MPXvFEU9W31rHj84GwL0cXCoMQPYodHE2R01DS5fmHq+4U+0QYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FVhL9ZlG; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FVhL9ZlG"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7036e383089so1148356a34.2
        for <asahi@lists.linux.dev>; Fri, 12 Jul 2024 07:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720793102; x=1721397902; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VghSScXg0SnQ65hjRgRRdsd386IPCF3v3rBLbMWrDA4=;
        b=FVhL9ZlGhb1nuJhtPIUzY12vT6d+In8Md403WTR0iuWQphAPJN//x2xdzHdawUCh9P
         W0V+ykrCpkmBe0rhge6MO8M6QnaEv2PYd3RclRSiQVWFkLpB4y+vXcQ8baL8XqMWEHb1
         tm7k5F6SblxyyV0eoXDgftGTMD57cJLb4wOUsMiZvyhaCSvTYMgCvWEwJhhg7uo0aeIF
         uanVtO5hvK6nB5t9YTnlLaVUO8kwB1/rPNVB5M0iJMZ039LhZPMy+bEp5g6Em1fXZoEs
         7kw+Kzr933KFjtuKRg6g4h/pA5iyytGQVt6A3pZ8NRHOkvjMUe5QRcBG9fVYlIq2Dned
         cx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720793102; x=1721397902;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VghSScXg0SnQ65hjRgRRdsd386IPCF3v3rBLbMWrDA4=;
        b=pZpFL8qwyxJTVldg91wHQXUtLpcNZchXju/K4VdH4jtfn6+/yBUVlILAPkNY7raS8+
         OwZefgCdMUZ1hMCoVsHxrW71rsBY0KV8tMdYUQISRq8pVQZYVwbIH5ZOjJZ0Fan16jYC
         ENdqg91+AkLYIcRtkci7XgYbF0q0BQroceGrxM1DZ03zI6ZP0A04On5EEtvJz2nMoCWn
         9aWQmmd36ALx8Yyv/EBCVgJFVkSfUlCaLPd+Ys1egYlZ/RCnonjFmAHLk4c5j5L6UTih
         N3psp/hrNykUh8kbEvzeHZcM54gvcewO6bgX0L7vlgCJEdMDQ4klLJcWN00QhtvHDYbz
         oNfw==
X-Forwarded-Encrypted: i=1; AJvYcCU7vpLk53qoRzuvDgVZ5Y6h89fxnmuPHaKk1zZ9P/1r+n6IEZDRdxTlB2+lUSkCr+ca2JWL+b3DCV11bQ3X1SjOpw6JvBc=
X-Gm-Message-State: AOJu0Ywldfadaz7cNPTzqVrFTNa3ZWSzz6d5BpkOtOPpJpAC29GQE2e1
	Jk3MdIycN5eyzuEpNwXXuU7cM+uqgTaUCWHPb1h30PW98NSZQ4pN5DCvU8RjnFI=
X-Google-Smtp-Source: AGHT+IFA0p4jpx4ZTZg5gSmdCsyYovFZ3XvuMQom8jLmz1vaX/2ViXszD44aiF1MHSHh4j1LYznztQ==
X-Received: by 2002:a9d:759a:0:b0:703:7a17:f267 with SMTP id 46e09a7af769-7037a17f53dmr12708239a34.26.1720793102310;
        Fri, 12 Jul 2024 07:05:02 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:d26:9826:56eb:a2e5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70559902e6esm847390a34.35.2024.07.12.07.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 07:05:02 -0700 (PDT)
Date: Fri, 12 Jul 2024 09:04:59 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hector Martin <marcan@marcan.st>
Cc: Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] nvme: apple: remove some dead code
Message-ID: <124bbda3-7ccf-4e6b-b30d-7115e1c2620f@stanley.mountain>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

platform_get_irq() never returns zero so we can remove his dead code.
Checking for zero is a historical artifact from over ten years ago.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/nvme/host/apple.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index b1387dc459a3..f5a3a4e8b1e5 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -1417,10 +1417,6 @@ static struct apple_nvme *apple_nvme_alloc(struct platform_device *pdev)
 		ret = anv->irq;
 		goto put_dev;
 	}
-	if (!anv->irq) {
-		ret = -ENXIO;
-		goto put_dev;
-	}
 
 	anv->mmio_coproc = devm_platform_ioremap_resource_byname(pdev, "ans");
 	if (IS_ERR(anv->mmio_coproc)) {
-- 
2.43.0

