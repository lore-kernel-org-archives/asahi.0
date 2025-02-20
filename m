Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26701F8BBC
	for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 12:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740054162; cv=none; b=udkZ46Y2w8WqgqQCGik0Lza43WZ1c8PAGkSaKoZpJrOuRu6Djw2bU0XduTlR6fxhJl01JrlTEg9WepPBNsaew/7IXm6arV0k0IoRgbqgNIPrNjU9rH+YQb00Ic7JBSHHK/4ihVv0Ze8k6Utq9T/JEpB9/N3OA+b29Mskua/ficQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740054162; c=relaxed/simple;
	bh=iKAQVbN6H8LNJ4L0t5TJAQywaYEBuG3C40azpKpmjE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZuytECVFmyrLg/PTfkOAd7sX2HjW19+FVrdaVGQ1xa5JEvuru4chvHFWGMXc/UWjipttpUhKnXINeFTQOyhEgK/dll/9xYxGSr/UimS+SFYeFrKolWVAwfoJ4QwIADc/qg1oqn6EvE7Ylsz/kiYOu44woqtERZm8vHJjp0ARSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X68Oo/3j; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X68Oo/3j"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220e6028214so16604695ad.0
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 04:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054160; x=1740658960; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7chlsLty0Lpa7lAJqauh8CHAEbBBaJTQJHxpJ2xXoRo=;
        b=X68Oo/3jp/aEP721h94iKl2kUxm986uhi5KnoQjLOKBADG3Br7sQUi9BslPAExwVQA
         ORTHBSGu+WhYbMz/YnqFlhZ27md/vQqSPjsmDeiI8yeFCHZODh4dRbnJusc4iFMX4nXI
         K9vHTHhIORRg4LnCTEcVwsPJUyoXv0j3aIaCYmqKAdR3dX1mySrKh2pFXCoOAv7PR9K8
         cxlaYpthBbXq74rO3by6f45W2qSc0kMeyVzfN6GUrLjdt1dQm4TbRn6CE/DKgW6rgzaM
         r6HqVmRmp4jy4XGWbYIvfKCWxx+EsMP4lgPgDB/0QMBnzM33CEKkC+8qRa8ELrnfNBsd
         OpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054160; x=1740658960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7chlsLty0Lpa7lAJqauh8CHAEbBBaJTQJHxpJ2xXoRo=;
        b=wgswMPkv7F/r4Q42Kj1LUJc2V52ZUxV/BezD7CZgCbJDF3sG+CcW0MRZcYOib5CFvj
         8f4lwr2m/icb4c521w1vqPWuODUTkzp01YGuE7FN7XUwO56xnREPCWFpIwGdQADKsYOL
         cJLWa/qOzOHODVz2UTUCt7sPSbiypcyAwVEwEdi2Qe5QYt13TQ3Yy1Bt2zk7Mw1iTwZi
         COu6NS/gelxL2so5bJJjEv7Iuic+BiziYuQY1TsbhBo0LrBWNBFWfA4ZQONVf38MH+8o
         YKOXdq2smXCNtfD8GwRwPpn2HKO61Ch9/PuY0HpXwn3Hwu6eOUB39Df/mdGdl0N4qFIu
         9xPQ==
X-Gm-Message-State: AOJu0YyU+T6Zi/5/gC9wuSeU9+QaQQsgY+ucO0pBsGtAgdR8JORIpaSS
	mSpmHeY99t+R8/pRDBoBdY4xYde/OmDpRzkjiCLf/doTylBKbZ2q
X-Gm-Gg: ASbGnctX1h/2Yn9owwb5r19/9zz8bMorr0O4KqWgz5wrorC3zzyluAHucL5uPPLVVRp
	Rj86YpuQn7Y+WUI5QbdMcQCI72AZ4AfhrGOYoQUgiAUGBSx4ykOsF6WPmLwM2s/0wAU1x8fyF6A
	yMSuV5ew0vfcwTJFe9MiWdDUFaVUo0GckArvOLldIrzeMRhxY4h0lNt00gRCtcWx4kgyxGYw89X
	s8s4Ggip82ULhLBgUh4kwKyllOt5jbzhBnho9WCaZRmxoG2U9k1WC3TgWebNht5t+pU2L13i/yQ
	lGPbxgVzeYCKzhRP9A==
X-Google-Smtp-Source: AGHT+IGn28HCvIx9WJAp2s2tdPFeSijrFvqwGRpoloAKTjGl2JNSmwjJVADce8Yn4bnaEnt7kaxqTg==
X-Received: by 2002:a05:6a21:7011:b0:1e1:b60c:5bcf with SMTP id adf61e73a8af0-1eee5d68ba3mr5323432637.32.1740054159908;
        Thu, 20 Feb 2025 04:22:39 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:39 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 20:21:46 +0800
Subject: [PATCH 5/9] arm64: dts: apple: s8001: Add CPU caches
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-caches-v1-5-2c7011097768@gmail.com>
References: <20250220-caches-v1-0-2c7011097768@gmail.com>
In-Reply-To: <20250220-caches-v1-0-2c7011097768@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=iKAQVbN6H8LNJ4L0t5TJAQywaYEBuG3C40azpKpmjE4=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx5+NPjeURwiNzAzZwx+4KYBipsYXVdqfZo8J
 bphtR8GE3eJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7cefgAKCRABygi3psUI
 JO22D/49OTwRyfjXN0ZLwJOwuqVuNXrhFrd/9B7/xmgUAgstIWuD72YkGK6u+jBzquNjMxCCBaa
 rofULIp28eH/iRTKp/KwVLZLPR1QvbgMR3wHzb7k+mCfM03uwH8+0Z0cWkoBsEonT5gNI378NWG
 EoNCrFK/318jyMX7qDJm+zAFiQYeQOcMs13xcXvROY4o3kXajsPlBO1o4PklMsatD50v6Zpq5G3
 MpqKprgUxia7SGQZw4N/6B6cTBf7eoPQ1ZYeKJmtL3r6nIxTNMU+S35wQG3rUcXzVGzKaF7rhNi
 TpztKyGuVIvvlRRPLP+MRzptCCKujaLGWFqA3QHsA6bnKjWWCQQJrhVVAq6E/o9UORfe2bY2JiP
 amz4gpRMhLt8YU6qJJAntdHZj+tpeEwDKpN6IUTmuTyck+nlZKJD4GfDBTD5up5/Pfp04CDv7ox
 /bMRH1mX0duXQVtPVWaV9jGfATYfB/mvqSftktheaOm2l+vEJW+1ELqPU6cUkoR6n4Pqi8AT+Yi
 Uo8d3oK6YSMIBX/ykn3+wdQXLGiaROOm1TJrtM1i1tWR5c5j7F7Uyeo2yHsrFKwF/Q6oaED2xZW
 r88pwbxAvHO5/1dUchprQRWGQJWbfmlo8OwuFVOwUyFJFikZOQe2w/zh3VuChlOf/TdgxrKS1AM
 P3eyhYJrjvKfpzw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add information about CPU caches in Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index d56d49c048bbf55e5f2edf40f6fd1fcff6342a9f..fee3507658948a9b4db6a185665fdff9f5acc446 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -36,6 +36,9 @@ cpu0: cpu@0 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
 		};
 
 		cpu1: cpu@1 {
@@ -46,6 +49,16 @@ cpu1: cpu@1 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
+		};
+
+		l2_cache: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x300000>;
 		};
 	};
 

-- 
2.48.1

