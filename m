Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE66122CBD9
	for <asahi@lists.linux.dev>; Tue,  3 Jun 2025 11:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951850; cv=none; b=mDnWgFHasL3MIN0BArTsket6lX6ubWtMPPz1HB6Jht016PEvSwaRfbEEoV3G1pP+g/qGDnkagjnwhTZ+ITmQsLIjePJD8kNxIX4MI95XoHw65FNnkjuZOGib+I+vwxKj7bn7vFYlw4GRDmFU3vnNVPnHVXvk8T1iLNWuKjKcV2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951850; c=relaxed/simple;
	bh=8VGdoBQnsW1Y8fk4p9+RrKW9XWt9gACX/CPbdQ0dOb8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OzAs1ElG8yhfIcdi2RZC0aes2VPUfxdyuwZy63KYB++4A5KCTeXOJfX0qhCuoeoO8COvaltIdLwgKBBlsIrp3/jSe4ddGA2c8R7vh305uxqjHZa3ktAGjXHvX23I7OzCiuGBxbbugqFB0XbAy0GvK6zwz6YQA5cFY0gORAA7Nrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZhpNAaYb; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZhpNAaYb"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450d15e2d25so1114325e9.2
        for <asahi@lists.linux.dev>; Tue, 03 Jun 2025 04:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951845; x=1749556645; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1IBFWQj94F31lf6usd6PCcvd2+aXV7FOAOa4N/LRiuA=;
        b=ZhpNAaYbDRsy9wF7WkTopyKJBTfVU5ssMRICBy6HvgBJ5va2BysZ3jW1JB20FJuILs
         lnrr2V11rGgmuBf7NoTfXNd9oNf7a8DjVqAAWcw24hjMQ75IzhFDntZDdpT74xEGVXUm
         prdG/tUZXitLTyujWunEJ/SSBxjKHp0/ng0FsH/I/Ntv+uIXU2YoOfN9AiZAdMgppHMA
         MVQeHTfzhKpkOICKl+/Mwu2f4MaLHYRh997kYZESGHy9vJjTI41RyRWyuxG42GYAS/DG
         MBONMbEMcnj8+DarZcJaRbrT4yR/wBpvG1hx8OWaf/UfFHa3yKxTUV6MvxxVnP8yM5Px
         xrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951845; x=1749556645;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1IBFWQj94F31lf6usd6PCcvd2+aXV7FOAOa4N/LRiuA=;
        b=w5J5znb7buprW3eAlEIUPUL7tgcppier3MGcD2ULeC1TEuIv2QRl8Y+zBjGpry4Wkv
         doH9XF9kklxZDfxZaqWypc6Sf2lZ2LOxOQIBjMdpSh5XZST/ReT3IDvSWhHlFjKsgkEV
         ZPXOfcSurpZy0lEVR44tUyi5azx+SESevgbngqV+FqFlAFpRqZ+sUFDuIetlCeXN0gz1
         IbDc5qGbvJWPr270q6lboMlIS8J63GIfpzODoLWO5K2XlFuCyo3AVXGcHLsogV1zBBpU
         hgw/TRdf05EE097U71KxIaASo2yqIDea71sUuw+uX5thVut5XdNj2DclKDfNRuEztTKB
         KiGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvj99WZDlT36R8jtt5OmJPyxY/hLSPizN7UsIPuBBeHyVpGkbgCJPoS1b9LR5xw78Q4faHpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEUJf+D2u7q03Wv7ckqtpzBLQLbCnZ7aBYZGB7GjtFOJUTKKJQ
	XwLFT7VUf1EpLr4aQ7jX22zyJyPYCpKN2kx5QHGnbQ6X8Kl9f5DAVrIjY3cf5bjRgro=
X-Gm-Gg: ASbGncu15W0eUNbcYUqWr9DGurNOnnIAN7PYlyx84rf7XlSSn3evOf+o0vm91C5Pv6D
	+SjvcrdJlXJV2VacTmDiszy6Mwhsw3IsUBCN+1l74Eu9qaAalA72fajgb2ugWV6EKXMFQ9TlxaH
	r0i2eejw3+3t9TPO/9qSEhiGN90Td1bpNyKRbVqoocrqvr4+9PsYzZYREoC5kIE/EQHrfXSSmTs
	fbo+GBPvLsvfxku/9HEh7acQvxLzpnXk2EluWr4D3e2Ca2xa/zraYj7OWS9ZWY7QMuLj/bwDFpo
	IGmyZaQ1IDTTuhwWl3VIflFxST9M2HLJvhPjBZaIXTOK9wkRElPnPdTWcEvC+/HvWyq4/ojC07y
	AGovXFuoVdI4qRMWLd/raBQ==
X-Google-Smtp-Source: AGHT+IHcDKEnQI0iAe8KmJOAN+5AyRCThhejg+k63FaCsSnbGWGPgYCXX5i11cKOm0Js9aE/AZP8Og==
X-Received: by 2002:a05:6000:2dc6:b0:3a4:e8c8:fb89 with SMTP id ffacd0b85a97d-3a4f892f306mr4455673f8f.0.1748951845084;
        Tue, 03 Jun 2025 04:57:25 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] dt-bindings: mailbox: Few cleanups
Date: Tue, 03 Jun 2025 13:57:07 +0200
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABPjPmgC/x3MSwqDMBAA0KvIrB1IU5OqV5Eu8hl1QEdJbBHEu
 zd0+TbvgkyJKUNfXZDoy5k3KXjUFYTZyUTIsRi00kZZ9cR4oGeJLFPG1fHitxPDQk4+O4a2bUx
 jtH1RB2XYE418/vfhfd8/Li2Ljm0AAAA=
X-Change-ID: 20250603-dt-bindings-mailbox-cleanup-c884545267e9
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8VGdoBQnsW1Y8fk4p9+RrKW9XWt9gACX/CPbdQ0dOb8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMWnfe5utyaUx5gvALmsxmruk7JbV/krIhA4
 j8qvLrJLFCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jFgAKCRDBN2bmhouD
 15ILD/910b+r8xCBseUJF1YO+j/IHLYwnq2p99ZLKQrjJPODK2Hsa8PvABhsMOVX7NEhd45xauB
 1gokachMmddL3QTHvT2SwZxCkXOkbMCydACOrC/fTJt47ZMqSJVTQddnBcQSgLyjNGm4CeOEnp9
 PNBoEYnzvybXEkQACPTe80hUYBPNMff0l9H1886se4gDoMTuKflotBkuNAKnzK+8kiDBgxNOH9h
 bZsCvRJodQOSAPreMvq0IihcpWlEs34BWltovMVcvF9aAUp083WRW+KVQYmOhWlos+j/T4BRIbR
 CwPlyHjcGOVLxKnlJKijLA9qGkIsezGqUQ2SPYxLPKlc2qzyajNrDlj84gdKweskDeOpiBvLN+B
 KyqdmGfxbd7NpRwX3CTYh4w/0CtWItIAUr9Ys7jFtXr/VsuA0YOCgJjVX1uEFU1xkudoFs1rAth
 RJ/8B3UMC55EENVrV4M2L4siLZlqy2RcczsoTJFZF2waT+o7rvR+fmeeJf0wybsj1f/u9znmagT
 kQ8ZnJpha5iIwXpe+p1xsFf82A53nj0jMMo0yNx2V3WeXOWMo7LyjgxfIAQHTUVhIFc4TIZqJVB
 +kMs1/3Ubq5gPtCQo6w7qymB7PfuxwdaWvtwnw2jPw7zgEtHYR+5EiDbtFhXsuuiB3VyuoxS3ez
 N7pia2kgSwXPEsw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Few cleanups for Mailbox bindings.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      dt-bindings: mailbox: amlogic,meson-gxbb-mhu: Add missing interrupts maxItems
      dt-bindings: mailbox: ti,secure-proxy: Add missing reg maxItems
      dt-bindings: mailbox: Correct example indentation
      dt-bindings: mailbox: nvidia,tegra186-hsp: Use generic node name
      dt-bindings: mailbox: Drop consumers example DTS

 .../bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml   | 14 +++++++-------
 .../bindings/mailbox/amlogic,meson-gxbb-mhu.yaml       | 10 +++++-----
 .../devicetree/bindings/mailbox/apple,mailbox.yaml     | 16 ++++++++--------
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml          |  9 +--------
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml        |  9 +--------
 .../devicetree/bindings/mailbox/ti,omap-mailbox.yaml   | 10 +++-------
 .../devicetree/bindings/mailbox/ti,secure-proxy.yaml   | 18 +++++++++---------
 7 files changed, 34 insertions(+), 52 deletions(-)
---
base-commit: 3be1a7a31fbda82f3604b6c31e4f390110de1b46
change-id: 20250603-dt-bindings-mailbox-cleanup-c884545267e9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

