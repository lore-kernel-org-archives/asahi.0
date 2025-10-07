Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777972D9EC2
	for <asahi@lists.linux.dev>; Tue,  7 Oct 2025 11:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835894; cv=none; b=ND0e9DdIM3gCUWuzMWzbUD0NmvkyoHcX4iwMoIIGkpdD6R65psUTD1PFvCFn5w/mKjN/uP/FJa6MrS10nZOLZ28akbk7HQT2oziu1h3OAABMNejpwaSX91YfjYrkpRTLMfwcioTIWxECe4DmdKU56E0HQBWjePwOMutaTPvBcY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835894; c=relaxed/simple;
	bh=EBXsHgi+TPtnux5Mjfvq3s8Tobe6+wN+A1W9K6WofCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eGMopSM0PcMXxNNuoZ9e0+8VSqlVHLWZJwyLCf27dfxeHNm0aRID7EnppSxqGcDBVdbYKuSdbb+U1mvchVKrn/9ToFdXLVi+RNE6JaMp4jOe5y9kQa2GRjNXNhDE4zcHwqD/HObTWrUVhPXVDPQKuy6Bc+etg5Tui4FowKroH78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDQAEpVi; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDQAEpVi"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-28e7cd34047so51354535ad.2
        for <asahi@lists.linux.dev>; Tue, 07 Oct 2025 04:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835892; x=1760440692; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfRZW1u7QrD8wKs/E/qokjfPak76+Jqb1NI8oZKYmR8=;
        b=PDQAEpViV4tZ25AskBFYNsRd6UE9/9MnxNdokcbyHvjAtso8LLiehz379kRcmimAWg
         aIeWX9PtzsPEQSPBFZaTdrxW06OQWVEXnCshIZVi9PNNepx16/rgnQz+zdGG32W5X+BI
         n56zI6tmGo3MfDHHqRCMDJJLfokhoVRV8xVkqlrlheG+ZyPPnp2m9R7IOgsteH2Qa4fY
         jEj5hMb1/QGnJrer8amkSLM9u288Zi2kabh5SoOOvv5Y3AhGwxk+VcAEw+pv2EikCqA0
         ya5y0x4KZnl4ZcDoWU8jZCzx2nREBjuTWwyrj72hUZ6ufka4bgTOZtrVhJ3vE+yCWaUv
         RglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835892; x=1760440692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfRZW1u7QrD8wKs/E/qokjfPak76+Jqb1NI8oZKYmR8=;
        b=kv3cbaOtkogTvdTmBo6Nl3NMtovYgWHyt1ewZej7MQDeuYU4ZGhoKXQfnXfNuaoQLc
         rAy7Rg+Nq5uNBAIWGfLxlmC6bNAyUTJUUrKy1xJlAwlY3cjJ/tl4uJFWIYckgRIJqZl/
         x1voh9vxTdKsPBhsB/SteFiS5f8QPEoeylDvhVOWoTKgH2ZgxaXXbGLtQkGIRjm/Wx2W
         Z7gdozmkGWa68UwdxEgb1+eoHzJjHaeeMVqKKgFj3Jn0qUu7ZnLBWhuyqcSxRe7HHKYx
         4sM2un3riVLpAWid3YUNSDKKejKXtbCdtm7YT4SDtgGjb6QohNfwdXHORt6qWV/H1CPp
         b8Ew==
X-Gm-Message-State: AOJu0YwkYXQrgE6P7XsF9mc92WWUGc1lczLqTtEAEfJttRX/My1GT7SQ
	Ea267lx7h1Zt/YnyAmTsqXIAxsAEazg6Kio3E+T8A3bpP5M/1ISpBwQc
X-Gm-Gg: ASbGnctzRuG+tM7NzYerUrvll3mpHn6zle4a1PX57QL8VaUV7f7m3IUMFpleZtna/XE
	YTTevQBUqxg/9VETJ/c9EW0Fa/siJGUlgM+H1daiBgFS1wKpqfcgpgfhzY8A/s8fVNxGWlumCH7
	39/JuGLHEXw7fhDTKJaoe2eYSUPgVqhH7AeAhmYm89UUSV9uod3LoaiD0jtdyUy08Z8wU4QYm9C
	iRTMxnwC2177mNWWBo9BXoNG8Avrrm1ARp2WZjjMrboct44YHJmR6gofxqRnLHd0zN/stUIZctc
	kPYtmjeDIirzjyhwyehQNAhFyNiap66s5tsCEa/wr8s/wrM3HmDKFAXtJzXVJe5pbryDx5wxx1F
	P3XGft+cafLSAiQoFa5dQb32pMGfn5t3/hZVoF6D8s7xGM52SsxdfPVcGTeEG0bgvbqjuFd/Pd2
	5s7+sOAPISw7yyoLBs+UFdZk9+HcoUeegmjmkOghxevA==
X-Google-Smtp-Source: AGHT+IGtobxlQxOmzElmeLrz6XbtLmYqUVeHEzRkuSFLIl/0CLj9uRwuwV2m/uCsqAKd9lcGvF8YVA==
X-Received: by 2002:a17:902:ef0c:b0:28e:cc3a:371b with SMTP id d9443c01a7336-28ecc3a3963mr25458815ad.57.1759835891715;
        Tue, 07 Oct 2025 04:18:11 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:18:11 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:48 +1000
Subject: [PATCH v3 07/13] mfd: macsmc: Wire up Apple SMC hwmon subdevice
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-7-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=EBXsHgi+TPtnux5Mjfvq3s8Tobe6+wN+A1W9K6WofCg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm1dVi8Ud3Oy5Jr9b70ezTox1bZcTX7RxhNtd28es
 6nxv3nxUUcpC4MYF4OsmCLLhiYhj9lGbDf7RSr3wsxhZQIZwsDFKQATWanJyLC3I+z5shiFivn/
 fhV4mitU2Nmznvq/6W5DGuupxz6KdRsZGX6JH93744nU5dT2JfGTeufsYWn+etDq6ZXeTB6t3T8
 s7TkA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon functionality to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 500395bb48da..51dd667d3b5f 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
+	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };

-- 
2.51.0

