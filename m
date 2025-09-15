Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB6C1BD4F7
	for <asahi@lists.linux.dev>; Mon, 15 Sep 2025 01:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757901174; cv=none; b=WAV/9Z4BxXOzu6xObLhDO0VnXjjlHl/AEzHwsS/+FAzOlOkH2ZlL2Do2sU1Q89kJOf6HB/4BXtuehi2yxYBuXZSzgW5LWndxrPRDnrR4+sAaYEJfGV/EBJMvMjqnRiGCP4HmSNbvBuGKZSUedCnBVHncRanmy5kpBsdWKPRZYXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757901174; c=relaxed/simple;
	bh=oSreoU6ZmkSN75RCTco6kgjieWSOH7uDaMA8CsUlAvI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Txm8p8Ab0xvjK0Yvq0frdJ3W4GPIe2aHimEpWuxNxKcD9AlaVE+lqyz5qhv+SAdblb+TUGau+/QdYOgODdkqzTupvrjKprvSAHpbazSdEOBPhqsb2H15iz9mDEuIsuvvtSFUQDkunxvTixcLb8tSVDiU9YJ4UumTGWDuoeT9jrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vu4qJKUM; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vu4qJKUM"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7761e1fc3faso1493206b3a.1
        for <asahi@lists.linux.dev>; Sun, 14 Sep 2025 18:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757901172; x=1758505972; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wPKyOmuQWUf8l01OnPw9ehRNwWWfONhetwr0Nv+M8qA=;
        b=Vu4qJKUMDa3p/7GepISnF75vRqe6+SfT1S5MvcFI7EUxA6WpZ+x4PMjcuf7x4+Lyx1
         FxxZnzWNXFARf8118boWpOBuoJ9fC3DnLJX/4nE1fwyKQoQDLObgENY+p9Wu65dvsCH+
         dqkY3SP+3KmhEZUrseW7hQOTl4hWLaLj3AAAxVpxVj08aFnfoPYoguMs/IfaZdtbcbtN
         IPGKluh7HBx0wEzAdxr2dJHHHEpuTapc1oYZKv3U6XwjZBNMBz/YSlac7ae7OY3VT0qK
         c0f0Wb3ktS0JVqocJ8r5Q+xpLYf17MGL74oU1oXUCqo28Go7j9NJwDIyYBlw+laHAVrB
         YRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757901172; x=1758505972;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPKyOmuQWUf8l01OnPw9ehRNwWWfONhetwr0Nv+M8qA=;
        b=xSO88No8xG75YH1R2XUoLthFrhw0CTtptDPvCyYtgKQSmkmOHvliubLysqj2zul6Im
         t9arTN7t2nn7FFk+3iNKlhLblM3eWkgf4m4IVgT2EZx06aRgXbrPXDd9C6lxeP9L+Tu8
         TD8ADB+nkgSx5gCgby+YLp96iNF8yU8YtHgL8Jnoj5XRcbXrk1nP6iw/sJb1qlyGdW9g
         HLnnRzxcCHWhjSuwpHY4BBS5rap3VW2WN799Ty3GlkiTABFM6j2W34Ed0gF+VFwh1vBR
         jsNoxSA7fLJltsPSR5QY7VOCfy4Ne3F2+dK/H8afw9zG77gPxFi5ARfIuFtuIU8yklgy
         0d7w==
X-Gm-Message-State: AOJu0Yy4wyIOryAjG5apbk+irDmCUpnJrWy7E3TxHFjaQqhjuSaUGNU6
	2aafLBOFtnATgnqzotKS6F0uAVBIuoCy6fD1C7oY+AUDVYjinRm7KIgp
X-Gm-Gg: ASbGncvMze93TWKj1tZljIHS9ZdPl2Oj16ISGgrdCi9qN3dZoECCHDHI1YTkSuH+0y4
	uJj1wF98H9boZqsxlFP2kGqBZc11/mTIj/K/ozEjtp2oGHU+SawEbNTYsPxUpejR8dIYgbMnosU
	7ZTLQEnQ4KyrfEhFxMjyOsxfBEHUoRMMuctNByQlrFc696h4TbG1d3wgcWyM84MhFGAed3kSzOX
	KIawJdeD8WH540ncNJG0GgMREGieu3KTf3aHtUSU+OyNhSPQgR2EzH96aluIN1XdI7ZAf8dQ1SJ
	gEOjphW9y+E8Lf37s0WfvtkUjmhtdF1kFcZLxYQKua5YFg5uEritD7O9eR7S93UIfpOTNJ8bKL+
	FhRjoikAWKNS1SpOgm/0m8eEY
X-Google-Smtp-Source: AGHT+IHSOwGuo1mjiMMrQl+gIqoo7GvpRSlfzpkOluezFbkbqTJG+XOx1NJf2/A3WdLWc5HVCdLdHQ==
X-Received: by 2002:a17:902:cecf:b0:254:70cb:5b36 with SMTP id d9443c01a7336-25d23d1c98cmr116237135ad.8.1757901172208;
        Sun, 14 Sep 2025 18:52:52 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-262df893ec5sm41565255ad.46.2025.09.14.18.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 18:52:51 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v4 0/3] SPMI dt-bindings and nodes for Apple A11 and T2
 SoCs
Date: Mon, 15 Sep 2025 09:52:23 +0800
Message-Id: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdxx2gC/12Qy27DIBBFf8ViXSqGhw1Z9T+qLAYYEqQ6TsCxW
 kX595J4UafLO6NzRndurFLJVNmuu7FCS655OrWg3zoWjng6EM+xZSaFNMLIgc9WgOH1PGZulfV
 eu6g0EmvAuVDK30/Z577lY67zVH6e7gUe01XTC7fVLMAF9yoYg1GAdvBxGDF/vYdpZA/NIv9QC
 /CCyoaidIAhiah79x9VG1S+XlUNNdaDIZLBSrNF72ubQpdr+8i8VmIeK/G2H/O865x1Aa1RMRI
 ljFpbH5MfBgBQCZMLQVvhVN9k918eiBEbZgEAAA==
X-Change-ID: 20250527-t8015-spmi-838bb49d34ae
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1979; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=oSreoU6ZmkSN75RCTco6kgjieWSOH7uDaMA8CsUlAvI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBox3Fw2Xh4uVtqY9Ml3baPpwriRbH0TuZ8jrguv
 9uyYm1R8KuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaMdxcAAKCRABygi3psUI
 JOepEACRT8iHqO/muQPmqp/E7LKM6qRj9SPGrGA0wsqu4Krnpe/CxFRgMejDQYjX8gQ3uG+Rh26
 HBEd9E8O+9uWAf2wqfBNfRVou33KRJBi9jYKlw7jmxIGBd6NDSHtM5pBH/8Xa6oZ0GBnHTsmjM8
 IKHTTT6fARFEnjA2syjuAmexyaOK7Pqp+gaVNWaR6nIIsxuiZW1gwPbFzmJTvIvTjKTpFb1mvQm
 bNSzK7tsQllsS7MQZxWtBTFcsucS2nGjfk5e3knwLMfGjtfiPjKXywreC9Fj2p1Q6WhLW2vbK7N
 uz7q4hZ5G+OQnCuxJj4uocgeYe2rAc6zr4URDbLOebiWEjl8rpGW6oJqsSWwkYCyc3Gtrs/oE0X
 TsyoA5RPiV6nAEAB7m7HJEoJadlFVjlTuoBBN214CKSfyK99ly5k91efF4189+1cKHj/lT+SsPt
 dTwT7f7iI62JbMWgSvpM/esdhS9xYYU9BG0WHiVE4Tc7P30pi2YWFjaHAjc758mKymcyA2KQ7hL
 U6WbIzIK/ZS6UCwmQ+8an9R1taHMKrDW5WQlvt9LgbVPN6QSsxFO6Ia33MNF0s8q65Lo6HpJEav
 zn+hULTxZHzzvbb9dC8yauwXeUeZ1VcEJ07GQQKdJzXl7Pvg/6okcKhgYXzVkq2B+t7sAbrj/Yp
 ufg12isYcMJ5XEw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Hi,

This series adds dt-bindings and nodes for Apple A11 and T2 SoCs,
and the existing driver appears to be compatible. Drivers for the attached
Dialog DA2422 and DA2449 PMICs will be in a future patch series.

The dt-binding patch depends on other spmi dt-binding patches that are
already applied in apple-soc/drivers-6.18, so it is best for it to be
applied through there.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v4:
- Keep the empty lines as is in the spmi dt-bindings file
- Keep DT includes in alphabetical order
- Drop tags for dt-bindings since they are sigificantly different from v2
- Link to v3: https://lore.kernel.org/r/20250829-t8015-spmi-v3-0-58b15ee2c825@gmail.com

Changes in v3:
- After discussion with the DT maintainers we agreed not to extend the
  generic compatible[1]. Change the series to the agreed-upon style.
- Now depends on a patch[2] adding the t602x spmi compatible.
- Link to v2: https://lore.kernel.org/r/20250811-t8015-spmi-v2-0-a291acf0d469@gmail.com

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
[2]: https://lore.kernel.org/asahi/20250828-dt-apple-t6020-v1-22-507ba4c4b98e@jannau.net/

Changes in v2:
- Rebased on top of v6.17-rc1
- Collect Rob and Sven's tags
- Link to v1: https://lore.kernel.org/r/20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com

---
Nick Chan (3):
      dt-bindings: spmi: Add Apple A11 and T2 compatible
      arm64: dts: apple: t8012: Add SPMI node
      arm64: dts: apple: t8015: Add SPMI node

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 5 ++++-
 arch/arm64/boot/dts/apple/t8012.dtsi                   | 8 ++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi                   | 8 ++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)
---
base-commit: 989ca853ddeefad448bdfb771113faf9cc480936
change-id: 20250527-t8015-spmi-838bb49d34ae

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

