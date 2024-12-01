Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FD2134A8
	for <asahi@lists.linux.dev>; Sun,  1 Dec 2024 16:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733070003; cv=none; b=Xj8kMlzJ7VoeaA9vNR1f22bTeYdhdA1R0dzUYp2dxkjTcvPPc8Ypmc4enh9+hoYSpkFG+Fx+XWzI1mRydn4jrXPSTLU1GB5qtwlVSjBg08WU+gZO2jV8Upl+DgcdRkCZ6GTE2yD/1DKia+NMzlCaKg+ktjCSVpVAhBC50ygZuVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733070003; c=relaxed/simple;
	bh=t7Q+03i+HqFkSl0C+vB7LQyazeimNAlISe/PiGjYgn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fAO9fbYALZ9oCjK34sjlhMDUO00ZrCUUib8EjeSfiPPW8Ch0ZWA0M+NtHWgS2x/4ce3kdgre/kLGMZLx3C5d9pB/QrVuK2t8dwp2aBHKdPenxNzPt39VRhwCLgOdY3XV+1jCh4MbStb+NJUn3qFymg8Rx/tVpRMLRVWD0v1Yh3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOStPdp6; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOStPdp6"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ee8e8e29f6so697035a91.0
        for <asahi@lists.linux.dev>; Sun, 01 Dec 2024 08:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733070001; x=1733674801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8fmmWFuj2QXwlMa+xJCOftPfiVKkyTzOSJowte4eFEQ=;
        b=gOStPdp6LjOi8nr7GHJ9IxPThyjGLWNHcUnBGoAst9CWuQm1V8Hc90je1kNS2Y6hn5
         pAQ5yK+Kis4yKr6tt9bWbCjqon2yvi9Iqd3JDHisIFQZV2UmcnPN/5VN7cSaw+px7sW/
         HZik5V+5tLLdyj1LeGbaV/OWffogivKmqB+e45BtzGHdUbhHPt61nJhGRyTL70T6N7GI
         WlRp6ha+/2Ae8T721+q22lRX2tTj7/0JlQluu95s0uwXgasq2uBDzbWmG7eG114zrsLw
         sP9uK9GllWjNJZviiU6hq7IcaxyfSIc9ChJjzDhmUmRXHVmJg/IXl9DIKfaw4do27AGL
         SSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733070001; x=1733674801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fmmWFuj2QXwlMa+xJCOftPfiVKkyTzOSJowte4eFEQ=;
        b=NAXQ9Mc8hYk9/T/StK8Fsx/vcHoWkQVUsEWFVyJ4tAK++wXGs9vaqE5wrHn4qSYxmo
         B6oR3p5NS608N3HxIF1TTcRhhULg/eeJFp8wsFdagqzmGjHzJQ+hrEo8fiGCg2nstjz0
         MMz/Q/zRUnIbS7uxeToqJypWIqx/tIqSliIIOliL2WDAQ4xt3AZxs3MmfAjIZ60XQ8xx
         oQixBC/z8iX7//0bNuEtqnFEHa8n9GriWIhES8efa9J6CiyZrqVX+CMb3T2MiOtOGYsA
         KUEJ3ljIbX+ik5/rrg/DIhzrcn1n0/AtWCLXQdP0u2bswmwUuB/v6JCpBz93UNVXvWBN
         1m/A==
X-Forwarded-Encrypted: i=1; AJvYcCXPmz+3ZQ05msi0ymazE0yr7TGM4atdXr/qYMh3nkEdMk224N1C4hc09oMgGbIsHnmOz1N1DA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfHsMIWgQhUjhJbLDFdAjq6AT0oO3Z37Ons7c6vI+OSX02iO+V
	s2e0+0d76Ls3Ctsxg7ai6RSgnVW+XyJKKaG/bo1M/COdR3CcszGH
X-Gm-Gg: ASbGncvcHB6LjUP7sHMw9MC+vqTMJ6lrw4+VuCc03QtAXV2JmsMJA4CHaQB3IT7mBLM
	ivopx0qk45i8F+rJmSDIwYICnTvIlSFbUnRaQ1HXGWOclnIy8z+DhKf7K2t+YpNPSd281xbXC5G
	xVwqBKqW4Bzo1kFs8HWHBCGCnLwjfkljdXI22aefVQAvJLP6IBtp4qabxKvuPDtu9Ot8qKVUaAD
	kACw1OSo/lxZhPsW07BMO3B2PUWy1hKNWfEAlXePJiAhOY5OsQt5izXtevy6Un8zw==
X-Google-Smtp-Source: AGHT+IET+u5LDNMyzPy/22Zfz08qiTYsCD7kHsmPaZYvpfT40p0BJktpcCR4QS21645GpQRzwE7Yww==
X-Received: by 2002:a17:90b:384e:b0:2ee:3fa7:ef4d with SMTP id 98e67ed59e1d1-2ee3fa7f57fmr17772287a91.24.1733070001043;
        Sun, 01 Dec 2024 08:20:01 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2ee78834450sm3007392a91.6.2024.12.01.08.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 08:20:00 -0800 (PST)
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
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/3] Device Tree for Apple T2 (T8012) SoC devices
Date: Mon,  2 Dec 2024 00:18:40 +0800
Message-ID: <20241201161942.36027-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds device trees for the Apple T2 Security Chip found on
some Intel Macs released after 2017. This SoC is based on Apple A10
(T8010) SoC and, for many hardware blocks, can share the A10 compatibles.

This series requires the PMGR power domains series for A7-A11[1] for
the "apple,t8010-pmgr-pwrstate" and "apple,t8010-pmgr" compaibles,
but otherwise can be applied cleanly.

[1]: https://lore.kernel.org/asahi/20241201155820.29259-1-towinchenmi@gmail.com/T

Nick Chan
---

Nick Chan (3):
  dt-bindings: arm: apple: Add T2 devices
  arm64: dts: apple: Add T2 devices
  arm64: dts: apple: t8012: Add PMGR nodes

 .../devicetree/bindings/arm/apple.yaml        |  41 +
 arch/arm64/boot/dts/apple/Makefile            |  16 +
 arch/arm64/boot/dts/apple/t8012-j132.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j137.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j140a.dts     |  14 +
 arch/arm64/boot/dts/apple/t8012-j140k.dts     |  14 +
 arch/arm64/boot/dts/apple/t8012-j152f.dts     |  15 +
 arch/arm64/boot/dts/apple/t8012-j160.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j174.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j185.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j185f.dts     |  14 +
 arch/arm64/boot/dts/apple/t8012-j213.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-j214k.dts     |  15 +
 arch/arm64/boot/dts/apple/t8012-j215.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-j223.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-j230k.dts     |  14 +
 arch/arm64/boot/dts/apple/t8012-j680.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-j780.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi     |  44 +
 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi     | 837 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |  20 +
 arch/arm64/boot/dts/apple/t8012.dtsi          | 198 +++++
 22 files changed, 1387 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j132.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j137.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j140a.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j140k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j152f.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j160.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j174.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j185.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j185f.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j213.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j214k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j215.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j223.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j230k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j680.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j780.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012.dtsi


base-commit: fb4ec083bbf366f092f9064b18531be92756745b
-- 
2.47.1

