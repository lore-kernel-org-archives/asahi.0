Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5051E205AB9
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 12:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585143; cv=none; b=fQqXBBWOG10GZJgwmVc1OJQCJ7xs0tUtXxKhryiEbWIyCz/pMrV8DIXUbySbFD4ul6wU49a2NBI/k6TwdsJk5QmMtKTg3uCKTNrkpgmmecfApU/dQSMIZyJ119o3K6I9GT1klNJN5XPk22WohUwFtcj2zONSCVgEFkFWHw3l7CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585143; c=relaxed/simple;
	bh=gYKcWXUm7TPtu7fSQ5BLEikLENt9Y26EUFJAZBOTauM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvTDLdZlbyluZKV2KBjyhqLx/QHxZeeuvBDO+4W08QswQZbVVYDZ0RpIC9rMkgIvzhsSj9ZcKQYN36NgoE4SAlYFJyVVOrhuTCyUL49HvdLvHjF1lqvzKfpLMIbOkNxheIFIjYaDl3M3Wek9TpqGA4ql2VfHIsGhBw89QFY6P4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ht8g/PDZ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ht8g/PDZ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2166f1e589cso4284875ad.3
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 04:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738585141; x=1739189941; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mze8hotAEoOrviGEmjQLJnjbwR2Hb09Vtb4oE1gzfPQ=;
        b=Ht8g/PDZMVHb9Fu/M61IWm1BlFuZ71cLYrnfNs0pZGb5Bs7CVdviVmO38IL7fprYOT
         2KQeSUh93lV3/2Pfhn10BrAyeaGDvcjkznlH/BFSfbrTQcshGyCeLWEZBnjyFqYr/aZe
         O3IHUMthNEmJTKIr0kZWEpUXoUyny9v7B4zvhbw2BGbN9Ymmf5LKgNyDsDqFeD6wtc6g
         xcV118/x3qEsySlYm9PeiHCwNZIAGxQ2BqRZ91U7jjCbBkfvrlhqlawvYA3Sw+ftUHWP
         ERgHLiVdAbZNVZ66BD8v6LyUfbaMgR1uXGQ2hQZgjUmqqQ2iQfnMaGE9F0dVbYTjPRCj
         wjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585141; x=1739189941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mze8hotAEoOrviGEmjQLJnjbwR2Hb09Vtb4oE1gzfPQ=;
        b=SG6vVb7KhZYXmYSRnEZ+P4Pp9TWZWXXoQNQvZ+aBWsRcJpTW+yqydfzvsPp9KqKc3e
         0mhoANB2ufA6s36Wx+2Hmmq4FOGqxOKrI33d+zWxQa7/uyLtaBe6RGyEzvX/nluir7rn
         bbg+MtlFYyIdL2+PLPkxhbv9nCMqcSHJCZtOc3lJMxvhY+OUAsLEB0A/qHVDpQ1nRARH
         8dLyGwjXfn/6hTwsZt/vbEBjXGUNhEj7DLdqgcINjswT6fGEtTX9tJNyf2PmvsSeddHb
         9RqkytzGAdW4yGP5FN6I2MwkEQv48813kgJCXJmSJiM6DdEhmM/6H8oATuzxqB85qRWc
         qNtw==
X-Forwarded-Encrypted: i=1; AJvYcCXmiht1fX/JHm6q58nJUyvczpfMCeDkDczg5LaNF7B0xpi0U/AiFuLG2ZJBbP726/JXmg5HIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuT4meZSiTLzFcGIJtSocqWJ/5NSBdjg/K+a1AUoBKTPMZzUdO
	L7wHNaNuRgzhyM0rw4uRH2RWggqKoar39L2ni9gZyhrxhfJXvqm9
X-Gm-Gg: ASbGncsxnJOzDGJH/7aHu0amlo1ZvZxjmh5aJWen8AUyJQ5POtdSQEcI5B6OetevKfF
	9LQ4EVfpRbxbemDIqyfgBC3/DendH+RFoGPtUGOPd3/YvVzgcMJd1I5EVUNm8ha/3e4NiVlbVPl
	ma+8kxuj52ISf1XyOYkaiolKL6VvxJewJpcEqeNQyR+C1PkiaAhH8BEP1LJYqNimb9X0927pcok
	3BRrLTgHv8qCOo3ikqCUqcK6IU0re3QFFPFE/AyIyiOGx+Gj5pIJwYTBHDiZqs1c3P1Zg4rYymE
	yt8utqrbkEdZqBe9
X-Google-Smtp-Source: AGHT+IF++I9XnXiFEGYHA9dEu9o41bfGAtiDlH7AxvFI/EqWBiAjKHlfZu5h6CMES1Hx6Nig3VrSwA==
X-Received: by 2002:a17:903:2f84:b0:216:3dc0:c8ab with SMTP id d9443c01a7336-21dd7c4976fmr343221115ad.9.1738585141430;
        Mon, 03 Feb 2025 04:19:01 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f8489aefc4sm8789225a91.12.2025.02.03.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:19:01 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v7 RESEND 01/11] dt-bindings: arm: apple: apple,pmgr: Add A7-A11, T2 compatibles
Date: Mon,  3 Feb 2025 20:15:45 +0800
Message-ID: <20250203121831.36053-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203121831.36053-1-towinchenmi@gmail.com>
References: <20250203121831.36053-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatibles.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Acked-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index 673277a7a224..5001f4d5a0dc 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -22,6 +22,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr
+          - apple,t7000-pmgr
+          - apple,s8000-pmgr
+          - apple,t8010-pmgr
+          - apple,t8015-pmgr
           - apple,t8103-pmgr
           - apple,t8112-pmgr
           - apple,t6000-pmgr
-- 
2.48.1

