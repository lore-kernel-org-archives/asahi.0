Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5010F18D656
	for <asahi@lists.linux.dev>; Sat, 25 Oct 2025 00:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351934; cv=none; b=ljJx6U5IiojXCK973qXxHy9Ww5n4R12sci7GczgqXhHwpq6b/ld86v+IwgMobUKYjpFg6Y82BAQjf5VBAKNQDdBfFsWF8S+47P0NYWYhT4Zr1Q/4/WY9nyg4gnNUEx2kXpnaZ4qF7PkGYXRD2mzp5/CfMIHX/JxFacZYnv+BOe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351934; c=relaxed/simple;
	bh=DV+93RqA20zYsiZVil2ilvoMWgypauFCp2tp4wJbtLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PO9HB8TzxoKQSqYL4sgMPsI7yOMlZi76HX5+a6P7DBRC3Gs9++HHiggxQpdrTVpnSnuF0pSUoEHa2E5jgJ9Ish3URRyj9ynYAI78pwASAj9sIspPDwWGg4Ys7fpdHzlKyYfeGv5MMpY4dh2qd4dJxBOhTtAvs8YB4damfs0hMmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghICjABc; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghICjABc"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-27eec33b737so37919825ad.1
        for <asahi@lists.linux.dev>; Fri, 24 Oct 2025 17:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351932; x=1761956732; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yg5EzbqpAhrvR1YouHoLR93Qim7L8FFl5LtkM7LFT7g=;
        b=ghICjABcaqyGuICxgzrPIYI56oGzTVWEaTA1zJxJPReKN+HIkXC760fKfsaMgH48HL
         smLDIBieuHNHCtPAl8VUrp5/y+dkX92rlaqbelU5WzIi1C0wAufGJ4LZks5LKnunwjGk
         6cDoeXXxtOlgSlbfq0IOul2WMPWRmikk8+Rx7A7NIWkqFyOGN63san2HDw6CUfHPGTcT
         NAgBQDwiKNKDWsgHkiYeV3PmanfZDE+/lZyUYAgGvKtf3hZr3G3zfaIC1WBszagUJ394
         AmFLmJxcxZ5JZhcunP9t9ZyZOcqPnM22SLZRNWyF0/Ox6cOoMsrPljd8Tuh+sDAZOD1q
         puvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351932; x=1761956732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yg5EzbqpAhrvR1YouHoLR93Qim7L8FFl5LtkM7LFT7g=;
        b=ClM9xapdcbtH+vI27xoH1zVp2a8kXY6/6L06z6NA3dHj3CDrS5RGvfSJq68ExzcpGF
         IrwWPl5FJ/ow3Q0k8BExPKVNzXmN55r5lyoYOsng0NF6p9EfzUm7p6qlUmeatfG3AE1V
         LxbGbG0rp4wxD/X8cjegdpCQHK3OBZ7p2jU+QXxUTixbW2JxylxoaL2QRMX9gBR5oLlq
         AqW+9VvkKLru4xVXjlnKCMEIjWbviA3UoMgA7pfiItkcjmmcLmjVFi6te+kfse1CfUnL
         ApGeJspqbOEdw9k7DUyyeddpE1F91UlOPiLI/55diob7VCpMbqJ4vgSkAMJ9UIohxZBR
         C5ZA==
X-Gm-Message-State: AOJu0Yz7cgtdRP6hd5AAWgNB9aZstXyj/c6wf5NkIIIQDE1o4eawBwU0
	zS346hgChuRcTI3T8rsLik9IM7qrK9L02uskwoD3DSSrwD0wGla4hE0R
X-Gm-Gg: ASbGncsKYdsDcMVpLs5/r6kWO7ZMAYlv5syd3wSsHA1ooCzWZD2tFWUZB3anyBQ4+Et
	HapODOcIsM/gSPzixmwTu8KQc2aZ+PpPJbZ/5u3rq1CMPDUJH3WikmSMVskhlpvSfy2tpX/ioeV
	gQfy/AIhVS/tvHB3MKFcYAOKmfPoPM54zAjhi4uwH6vysnT3AFcSL55xLbLaYSnmBkxjAh5+PUv
	OLRogGFuy/8n1+vhgjQx1ZoQSEijBuMLHIfg+8lj8dqnNSCSK7cv5TuyOel/t59UCeg3UI3XLgF
	ibG4M2fE1DOBUBIVbyGVM4rcB9qqv0g1haisQZGBjKlIwP4E0/WQooZHAqvXUZNtdQZZWy44K1R
	go33w/7nLk+mnDHFHVgRDNl/ncKx1Hvb+OAgtm63wTO6uzJ5XNRSyotbskxmGQML+rq26iRN0ew
	3Btc1cEu+wNg9xlj2WMiXpnH3xikEKXV4l6Dy4ynwo+DZEAm/oxdOw+B6buePk/YfB2IYap4FKT
	R68IuNWqltnuH1XA0kWsuCBOvLEtDSFw2EEm0rRnFG/aERqJraApw==
X-Google-Smtp-Source: AGHT+IEmYwFaqV8z42kKVpm+csA5lgwwLVTZWeE7isuCiwv14jZl51eAVuMpwZ1A5qrZNvfHQofXdg==
X-Received: by 2002:a17:902:ce81:b0:294:918e:d230 with SMTP id d9443c01a7336-294918ed5edmr33375155ad.56.1761351932492;
        Fri, 24 Oct 2025 17:25:32 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:36 +1000
Subject: [PATCH v4 05/11] mfd: macsmc: Add new __SMC_KEY macro
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-5-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=DV+93RqA20zYsiZVil2ilvoMWgypauFCp2tp4wJbtLo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM7uT5j/5uLhmIJrXj0R4mce1dxacTk7SWbXtmDFt
 k1TQ7V0OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFNddpvhf8lXBsaJthzWLl7P+442dhqmB2rFujvXrvAzjZq0s8yAn5FhY5v2Wqd
 9hjPq9/XOutZTeMc+OfwDH1vU9kDLgg1Mbzh4AA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 errors
out with 'case label does not reduce to an integer constant'. Introduce
a new __SMC_KEY macro that can be used instead.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/linux/mfd/macsmc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
index 6b13f01a8592..f6f80c33b5cf 100644
--- a/include/linux/mfd/macsmc.h
+++ b/include/linux/mfd/macsmc.h
@@ -41,6 +41,7 @@ typedef u32 smc_key;
  */
 #define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
 #define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])
+#define __SMC_KEY(a, b, c, d) (((u32)(a) << 24) | ((u32)(b) << 16) | ((u32)(c) << 8) | ((u32)(d)))
 
 #define APPLE_SMC_READABLE BIT(7)
 #define APPLE_SMC_WRITABLE BIT(6)

-- 
2.51.0

