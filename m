Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC8315748E
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 07:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248838; cv=none; b=m4OBMgAqWUgiklZdPs2WBGxe8YlfxeMfJBDM0ZE6pEW57gAmuGR9pxMDfbCirrUEOc5QDgFQt+lYg6F/ZX4/NKQxAideUc21B4jrZ7SXw0zcqrE1FYC/pJ+5Xm61K8AaHwWRY1xIPCMhJPUZhd6NfMXiB7ENyWSQOR5RVrY5nl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248838; c=relaxed/simple;
	bh=lQtFITJOuPvxbaWstT1RN3wF1VX1/vCX/p5vjoOyqxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdZWwZjo8Uw6OaghXbs9pPga2xbhBAZNrlC/i5akbQxVdloqGOxa4pqUOK4M4Voz2Rn7xw8hc2dDT/g6Ac3eYXTsXqzQuM6gIogvYwxgfa7l09EtgKSUgOtI2W8o0Vks3y44cpcwyrbuPVhWgmYuDNC/wao0CjaPid6WQJuZpuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTiTr0G0; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTiTr0G0"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7db54269325so4846967a12.2
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 00:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248836; x=1727853636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9X76GEZCSbbQMLh1zTwBYREf8Y/orIPTUNjYgvpcww=;
        b=CTiTr0G0vNoopb+dCoVmDMG4OmUu+khWsppL0tdlTVUCOUjfGx4nhy4B7qYPX3BL06
         h5QS5RVLv0/Y+U/3ssrHyjIEpG76P2UAFUdp+KzQqosJFvrITY+gKskRe8Lw12L35COy
         iuZH4UBgZ5N6hTiu+cdFJiWfGEfKWTj6cicXhYrqNnbGmb6sfzrAH+BAJ7ioY7mTN8jy
         oTiYlEmdpgkXlQ4Pfh4/gD+6spDsskqovu1q+iA6laCUtTt0KxtyY2uw2rerEvqOVD+m
         pmgZ4+LOCtyjEZPUnTfJmq3UvtZIt5ykajSXjdXgbmSECspr0J/LHk/td4quiOqdhcOt
         JCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248836; x=1727853636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9X76GEZCSbbQMLh1zTwBYREf8Y/orIPTUNjYgvpcww=;
        b=sGLwxCKmJjwYOCmA1lsvg6gDKtIp0PXEvsSdx/bR9Jsl9NhsTtNOW+v49/16DlHF06
         PcyADRcQp/e+AhPl9nlSttp5uKhVnUiN8y03flwYU+PlRt9kDFzUyGz4TdTl6liIZc+j
         2ylFStkJZwwB64Fmv+EGLtNng7N6PtNrKIQNFIZxbKFxXP9LSQ+y22NjcpFC7MvADblM
         sqqDlMZoRUk3YtsFnuRN0Z+u3lHxw12PQilDaSOXGQqP3XRU6n6E71CV4CS6Cc+UHLsi
         MpXUKyjIYMD6OVi/m4hcfmYBM3JPEZoT3rNkv+rb3iBcC/B+R3uZe3x1xMRdvY8zzDOF
         RhCA==
X-Forwarded-Encrypted: i=1; AJvYcCUvfi3CABHKFp2UOzMWRg0gMdCwO6s41/t5VRL6iOBikBEwd8Q3yR6juasJWTbMFHJvbgkjrg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKVyyu1IPND6mzTmKhVLA5TcHyAxUGuuYNeOmBMbEx7E2eNMCy
	HgcDNwn9GYByv4Qca7ZCJPcW7AQjntPjFWkGhC24+vB/Qgk+hfjgoudgyw==
X-Google-Smtp-Source: AGHT+IH4ZTOu3iwcMbsOiy8lnH932jmvb7oQHZvCphTqnx77rhJ9L/p07Unj+TBA82B6gWJ7zTsNRQ==
X-Received: by 2002:a05:6a20:d049:b0:1d2:e889:1513 with SMTP id adf61e73a8af0-1d4d4aaee41mr2386218637.17.1727248836160;
        Wed, 25 Sep 2024 00:20:36 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:20:35 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v5 02/20] dt-bindings: watchdog: apple,wdt: Add A7-A11 compatibles
Date: Wed, 25 Sep 2024 15:18:00 +0800
Message-ID: <20240925071939.6107-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925071939.6107-1-towinchenmi@gmail.com>
References: <20240925071939.6107-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks on A7-A11 SoCs are compatible with the existing driver so
add their per-SoC compatibles.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
index 21872e15916c..310832fa8c28 100644
--- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -16,6 +16,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-wdt
+          - apple,t7000-wdt
+          - apple,s8000-wdt
+          - apple,t8010-wdt
+          - apple,t8015-wdt
           - apple,t8103-wdt
           - apple,t8112-wdt
           - apple,t6000-wdt
-- 
2.46.0

