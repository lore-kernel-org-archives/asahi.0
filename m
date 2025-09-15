Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391A620DD75
	for <asahi@lists.linux.dev>; Mon, 15 Sep 2025 01:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757900971; cv=none; b=Zzk5Glq+QVMRWB3SXIyKVsK5eZoQtBbIGQmNmC4yoRPFyNq5HFyC2HLIh2hz5swTJZ5a6iuP9mhCjd+pSYcxRA4n4D5rYWUy1yqbrBCsnoxLTboSuXGBc18qsr7weK9wLcJLAdNl9I4lLZhak5lCLGaL4BKqdch29tMcqZ9N0Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757900971; c=relaxed/simple;
	bh=oSreoU6ZmkSN75RCTco6kgjieWSOH7uDaMA8CsUlAvI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cggHtat6PBcZPoQoWvK13enzuVt6HtJMTnHjxdcQe955xAu9SgTZUeH01hCsMOzUTpGQh4tevQgYRwEPTEVXVyDtJ9wGhwwb+1JLvxgZqGXfHmBrTaxDZemJbNgxAX6lKcy3zPKtAU4f3e8H7F8wlXX/M81a9uwiQm1UUXaT6pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtmrrsgM; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtmrrsgM"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24b13313b1bso24240405ad.2
        for <asahi@lists.linux.dev>; Sun, 14 Sep 2025 18:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757900969; x=1758505769; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wPKyOmuQWUf8l01OnPw9ehRNwWWfONhetwr0Nv+M8qA=;
        b=TtmrrsgMZjPy5lmY2Dkzy12ZgDpulGvOBDzTbmUzx/ImX3zCH2WoUfQx3uIMw7Mj60
         GiM4lr24HnvsfxSWY0ikI/0+dwXGAITOoL49uw2ecOuww6bp9fa7yubUfqYFdvTsiwQe
         At5ID9z8fJayr2v5rbWeSEb0K6+K4G2wF7VqPoxQhBwkZhgaaaSv+hBnCA54Q1h6nWx5
         sHnXRGpMndpNks3+HDieL8JqgOCTO9R/OV2D1XE90UbUcrIavXNfij+Q0K3DYy14twLq
         /PBQK1Z1CO6DEveRrVSxxIQ+Wq8npM2mCHiNPV6zVa/08RG5O6RkUQUbr06yhmnkt/v0
         o3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757900969; x=1758505769;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPKyOmuQWUf8l01OnPw9ehRNwWWfONhetwr0Nv+M8qA=;
        b=Au4P7eTbeChn/NopnPKj6TvQThGhdLiEJwTY6xSzJOPOJNbJ2sUV+GcVVKeKolWl/t
         6vdv6jUeUMnUxeZrVq8Hv08JCL14VsAQ9wsSPBSF8X4b2E+9+QZq1DxuxnGNexEmD6R/
         75Z/CcbFD4KHG91UuvpyF72Dfer6wX/HKURtvMejKNXDA+djwO/Vmk9gDe4NhfZ0Ai+i
         zd+kjfcn1jsFjLXPQG2abUk3biZTbiQq6ghllSXj4+6mjWn6JSBUU3THTSSL5L4QWgpi
         vp7qyr3xeww2wGtnTT3ccNvOw2I9ykYL5GQE+o1zPsdsDVchPU4uShsf9z2443mSc8i3
         3L4g==
X-Gm-Message-State: AOJu0Yy/2/Pc6NEI7MPFGOhG9u92W1Up3PWpmgPQDl5A//QUjlcVoYSQ
	FK8UF1860xPOcGQ9IqlDPF30w3ga807XDFquRy0ENEkkw8g2dzDhyalV
X-Gm-Gg: ASbGncsSOZGPbIdP69oOEv4Ggndj5ySRp2KRHmTHb2sibhWob1IQ8ksy+kEcz6b+AnS
	VK/AobKeTawMbdHgZJTxN1nfTAkaZccSUQvclO0sW0huk7qLv7D9/AlL5Re4JEDUSLSCSB4ELHs
	uAzi7yG+1CNRfcj9OrEM3ui9e/nz+P3CUm7eggyMs0p9vzeo8H+f0rtQK5KdrdGzKrG9okdSwph
	g6nELN2bTxxHmzYEkfS9BIFPiOA6Vw/6HSTIs3SSyB2pRK3tNYxOWr3Gma9PqImq8RsMvxlIMI5
	rmMcCUMZwslDsqYAVAUnbAk3O/ztHgSiCkJNWjWRDjSCYFQMBqiw6s09dzbKofhsE4OaK9yudFk
	DmAy3M/R+zxL3Jw13wi6UsIHn
X-Google-Smtp-Source: AGHT+IHBNABRw3UbSzvGuIrlP87lXKciHZg0JsaKpxSUDEQmCGa7IwYsb8d2vZMsVK2RJ1/SO3YUyQ==
X-Received: by 2002:a17:903:22c9:b0:24c:7bf0:6e6b with SMTP id d9443c01a7336-25d26e47c11mr110147975ad.53.1757900969374;
        Sun, 14 Sep 2025 18:49:29 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-26686623f10sm11523175ad.23.2025.09.14.18.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 18:49:28 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v4 0/3] SPMI dt-bindings and nodes for Apple A11 and T2
 SoCs
Date: Mon, 15 Sep 2025 09:48:53 +0800
Message-Id: <20250915-t8015-spmi-v4-0-0574eda4ba5a@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVwx2gC/12Qy27DIBBFf8ViXSqGhw1Z9T+qLAYYEqQ6TsCxW
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBox3Cg6vCkFtk2gUKfofkTMYN1rFg/vlHOsb70A
 qiMAv3+rPWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaMdwoAAKCRABygi3psUI
 JMeMD/4ry6RelVSMt+gVOgcbYvGaKJQNQepagwG0kBxfvKJSzp2mDb5ioYvyighK9C5Fqazdis/
 NdWRCrGuNzcZY7tIaO3aPyeHf5yTa5148SP11XAPQG3t+rmg9ufFE5tFEJtWFb9YcnhGM32NlR8
 har6l8XzrunRGFCh7T/bO3t6LZLxwPfTx6ZZo0EXEbsKzEGr0im/njL9dvS7q2BUwArPSbvxqio
 am9yN+l1h/TjdWvMi6OTYgwnjEr0aWGly3AGkJ6Xv1R0731Sle5UPZxRnkOVilxe5ywKW3sDJ4i
 VbDygmzgetzxAh/UH37Q4e7mhYaq6/dAS057qXBoASrbTpvVq9mKANKWiL650xF8XvpkxqPF5+f
 VGxS7phVfNZfsQvWjjssk4pFIIqnbo0W/8hVIw/NDaoqP4Dziu6hwecl5JfXaPKrJbLGPxgo6Jq
 c4ySFOtg0h87IMvAh/egNye5z+5ujnSxrx6mcVdpj5/Y8A7BBSbin2RUrLnWp0UTvPa7t/dn751
 rp9i0Fu8URTXXycUpLfSj3n7WjkV6+oaqmEzBN+SVVGv9KpbOdyL6fsR/dSubD509ykCJpl1ZF0
 adYBzhymPqGlJoX8ubNHB6io96cmYd930j/JrtCckSvNC2GL3d25dvejoGTKav0ye73PFMoIYk9
 1fOv1NDd7Yv/9+Q==
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

