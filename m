Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7CA522A
	for <asahi@lists.linux.dev>; Fri, 20 Jun 2025 09:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750412984; cv=none; b=IBJzfUZcOnzLOuMkZoJw8pzKjfqiV1uogf1Gk+Ku19uh7RUox/fvwl8uTzWCZ8icRi9HsjlysXft3IyXk9i6f2IU6ZYgwKvdwI1V19to/Fs0fW94BMTVGpiB+kEDACRjC70oC8a1PoxEq4H9LlIEWi0iGH4lOr1P/PH9u3910ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750412984; c=relaxed/simple;
	bh=qTnLGaYE4mSJe4XGJd9c1paMNelCcWBLch1kHcCtYSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U6Vtp29dtAwFGb3ctVR3JQYYelz7LIBpcTe/vyXA+aaN1jA453o9Pls4hF6BubUGYVULC4Fq+bWGDVQfxd34BA16T5wq93oh5GbQMSUN5uKHLTphq3Ds5qj4KYgt0x/7cGTlwzk/HOw/3u8BODFzfWz+veN8vRyiSUKTOHErzLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDNhQLj2; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDNhQLj2"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2350fc2591dso13450805ad.1
        for <asahi@lists.linux.dev>; Fri, 20 Jun 2025 02:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750412982; x=1751017782; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wm9uNcsgLmLy2CTce8UTPVgm6JKmZNFE7FHPVZSoHGI=;
        b=IDNhQLj2nxVha9sgbTU7zQvbGms0WL1SBc4gtqEet3DSa0BOETQ3z07OCEWdqSdRnu
         XjNpOTz1VJk9enSQnj4DWuKfe3N2iZqOizu2Kncu9Z9NUqUaLk0W3FLcQui3sWnKGNj+
         w0Dk5PBKotiDX6rzCWKaDU+AQw+P5g/J34But2ZL1dkZpNZWuJYOhPh8qGKtzDfWg7PZ
         4sZyIKjzTJDJCqbh2okF37IyPQjI+uL8zOtuqMKp0unjVIMPO8EaoVkpENWxPW80g+Yh
         RjlQ8i17YoQtNjfI9i4V1JbV/V2WBkEAF+12QuE24agxXEzua6eEfNFdzh+yhbZXxXcX
         NFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750412982; x=1751017782;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wm9uNcsgLmLy2CTce8UTPVgm6JKmZNFE7FHPVZSoHGI=;
        b=qR1ZMck66gGepfW1dJOersyJI7fuNFU+vHgYJ26qtLVwzeDFsedKhNr4Z7ynScVS5y
         6vkyOpVwih+JbkTar4Gkd9gVHvOtDPF/QgFPYcYJ27g73wjOC5z1T93eDJ7T+qb1XnTw
         kU/sC306YrFCB7yBSs7ihOtenNe8seIFqYD9BDj0OnJLkTdEZ1M+miaPWh412k+e89uY
         JRhX2+Jb/ESmXYg89mp4kN1aPNMcv6W3boosetoh62q8LJGQQ7Hcx4CW04EihdME7Ngs
         a2UDoejbFsP8irifdlvffdAM91r6KPuy6TYZcx0Ro2y0YQzdBhT3spE82ZoRRPAZ/gKU
         aW8w==
X-Gm-Message-State: AOJu0YyVSwlo/IUKDE7wWb0PBzQ9ijfSVQXGv6kSSkQEk094B5XJ3fKL
	NHKrcc23v5mp7K0EvlA8GGtgvQESJzB7rwVf3HGJKhV1Y0F0cgm5dRRN
X-Gm-Gg: ASbGncu8jjMDH5mlUqE3rf/qTY/RSKGTefLvu+TvU9pTtKdO4sMmp6GcR3vQeMIlEHz
	y9YJMShGT02me8RXrodO6lN+elVvkSjV61uQxt+wfpDdn69IgpBJtNQ/PK9170bWFrjWAcHxruL
	EAGy8m4i/gG16KndKGqoV1hG2T6cVND6m0SGVm+4zXzWdhs7fc1/jy/2Jd4DcsLiI6IBY4i886F
	OjE9cQpsfw6Vbv4QvNnnV6FeKasbrF+B9G/U04Qkl35QM+8zBnz+slTsmC5YizKoinJ1uojFwww
	nAAZ9i+gTPXWO+2Cxzn2+WoodR5WQbOCRQRvKIWH0fEd77XvnO8I+JlsZOX84fW53EX2FvNvK9s
	hb9aMuboJVvw=
X-Google-Smtp-Source: AGHT+IH6Be5gP3+3exFSkxm22vF5iZh7JCUxNtdjaBLajdekU8Xmj0n59/agYpsJTUMoVM2m4rUZ0Q==
X-Received: by 2002:a17:903:32ca:b0:215:a303:24e9 with SMTP id d9443c01a7336-237daf6593emr27765085ad.3.1750412982159;
        Fri, 20 Jun 2025 02:49:42 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-237d86ef88bsm14167885ad.219.2025.06.20.02.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 02:49:41 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 20 Jun 2025 17:49:11 +0800
Subject: [PATCH] arm64: dts: apple: t8012-j132: Include touchbar
 framebuffer node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-j132-fb-v1-1-bc6937baf0b9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJYuVWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMD3SxDYyPdtCTdFPMUUzML8xRjc4MUJaDqgqLUtMwKsEnRsbW1ADN
 YMSFZAAAA
X-Change-ID: 20250620-j132-fb-d7d5687d370d
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, stable@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=882; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=qTnLGaYE4mSJe4XGJd9c1paMNelCcWBLch1kHcCtYSY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoVS6zKNgfrxDu4IxQuG+XErH6r6Vm9rzm0pebd
 Z3LpvEPtguJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaFUuswAKCRABygi3psUI
 JHJoD/0c+i2KQVhxj9K7upj3umunHHR5iGCOEG7jxFTtrsE+9UuVngAG8qtLOrYp/X9GUmrrZ2t
 YjB8zqTSrGCkMZgDCQSvVnYq7RApDSyigQQ36SWV5Lh0zMI7tuF4rx1m8MgENCWOqRwZKEK64UX
 MBz8IOTYYDcFK+G5Dj9SL2QLI9HQWxAjpS13aSuYZ6+jT0s4U06FeLHcrPlOg8V+5os/NVVo+/q
 Zx4GZs+Gtry/8S1DKD3+TARaqvlCXS5qZiEvnGwCEOochN2Xh/DHTQqUlrjhAVL3XQn1DiN1hMQ
 EBd2Feg6UYw+iXnzywYNLUJZYcYGpD6SGYjwnxXBpJ1iN4izrVDbcXaSYfcrzlLhLBPyFDU1MQE
 oKCoPZco6WkgKXu6Ocnj1rMY7OqrrvGYT4ii2JrimT3DE1hf2BkIwfb1SIh5+aElTHTR056aGOW
 YIy7brULuGRblckBPK5MZZfsKFNaPgrwNN2BEj1C152m/CZgQmFouQG2X3BQZjdMLNtksmVCQ16
 SnmdffQVXD3VCC8cK6iALZdxHjRAhAFBCbTaRGg76wX/Be4wEiOniKeQAwHSAXi17FE+cjwdL3q
 luHN2WxpWowukCRgX/7ADKFDgaLOUxVo95rtVpeUopwEB4llG89OR/eUN4QiImlW+nfZ2mvXQ5a
 1taNYho8VbNMnHg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Apple T2 MacBookPro15,2 (j132) has a touchbar so include the framebuffer
node.

Fixes: 4efbcb623e9bc ("arm64: dts: apple: Add T2 devices")
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012-j132.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t8012-j132.dts b/arch/arm64/boot/dts/apple/t8012-j132.dts
index 778a69be18dd81ab49076fb39ca4bc82f551e40f..7dcac51703ff60e0a6ef0929572a70adb65b580f 100644
--- a/arch/arm64/boot/dts/apple/t8012-j132.dts
+++ b/arch/arm64/boot/dts/apple/t8012-j132.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "t8012-jxxx.dtsi"
+#include "t8012-touchbar.dtsi"
 
 / {
 	model = "Apple T2 MacBookPro15,2 (j132)";

---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250620-j132-fb-d7d5687d370d

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

