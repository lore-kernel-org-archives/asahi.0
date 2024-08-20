Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F1D18DF60
	for <asahi@lists.linux.dev>; Tue, 20 Aug 2024 10:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724148748; cv=none; b=cK6bpvxOuPbv95JnjjPicuqk6+/QjPgr0ANZ7M/2xQDTyedMoYt77USmDKJmwI1E+zizzqytWAuO9l/gss0v7y9LMd8jLguT3QoX6NbyGFhQZDnQYfZ8sTrWMe0WTfDikKBc/OXT42rw0BK3V/hD3QqSJGZgNfe7xkS84/Zjubg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724148748; c=relaxed/simple;
	bh=rAQMs2nUAujqv3seBbUaUiGHZmRef0b6WBseJYrS+iU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=efX/bc7uGwWHzbu44obI6oK4MoXBxE1SjVluW7ot/IOyUDf/ZBS7NIoda65gJJXDK7tbGIKeFK2c4j2SRfFSrWZHSWlUZZ1dOkOa0OUWpcc/t+sMyF5LvTFDBhmsgQdy73+UVvE5/nDCYqZ/aA/dSi24sWHrWk7V8Nc2YBikUyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=G5PHkDUc; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="G5PHkDUc"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70d1d6369acso4075261b3a.0
        for <asahi@lists.linux.dev>; Tue, 20 Aug 2024 03:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1724148746; x=1724753546; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8mNuHffrbuK1rugdn6v3Dt73nbw6yd9qMrSFwaRLs8=;
        b=G5PHkDUcFxI7/Uk9m2aLwj0ehbUHy2aZioGFdeMD+PuXgEOG90BpVrBTOWShlTZs2w
         QXGcGkvyIWbwJuUO0q68B3SOaa0rHoncHfbTftaD/sZOP21W+OXhS84afQrkSSy9m+WP
         Vr20WfJ9ETWQiVtjvF4Zsm+0+pbbTZGNhPGPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724148746; x=1724753546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8mNuHffrbuK1rugdn6v3Dt73nbw6yd9qMrSFwaRLs8=;
        b=NU0N7hMb6nEYSKbFi0xqjVHUmsbJEfL2aSN5SBDqbnvTjlArh5bFGBgJKU0cDbRr3w
         kAYoqLcSVri+EX0HAG1EamzPYuvV9zL2M0qvOF+iCeMkYsFWCE1772RR7miM5N6GLtCi
         elVGygt3QSCrhcCDmn849NUDr9wczdtGkzuLYZj9vyXW89RW3EJ46a339DWxNtAabT1Q
         DgzJNv9+G2/geqb+M0DuUNYVF/I4eJyh2UwuQ3+ablw1mLbIrmbG0nOUoS4Xg84ZWGbO
         BsOrNn4x3NVVpkR4LSukfQVxAZbBVtl388DwonKRtLaPeR2mth+X6n6e03ml9OZw3sms
         yLMA==
X-Forwarded-Encrypted: i=1; AJvYcCW2OHGhALofChAbmdaFs0LJ73+CqTeVctNFwng+KdGnHfFiBwCjdrWkljhHgx9ShzoFK1dmi0LGQTueY047xCHkDr3o1oc=
X-Gm-Message-State: AOJu0YwxzsPl6bE/wb1HGNzLJST2+O7YEYwdmbqPpfwYDA67R6XyF7AE
	1tZZZoJUGlBKzTbkIVy0yiphDlA1/WKB5ie+f6V6+p+EFAbGbfCNgmQy3lbCCw==
X-Google-Smtp-Source: AGHT+IGVNRr4ycH9yeIC9iSR/lf8TJNHBQHMKw/kpMSfpHTduTtii93oIx25NUBCshqrvVaygPL04g==
X-Received: by 2002:a05:6a20:9150:b0:1c6:8c89:88c9 with SMTP id adf61e73a8af0-1cac714ed81mr3404416637.18.1724148746291;
        Tue, 20 Aug 2024 03:12:26 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-713f3c35cf0sm3111052b3a.173.2024.08.20.03.12.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2024 03:12:25 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Kalle Valo <kvalo@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	asahi@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH 0/2] dt-bindings fixup for brcm,bcm4329-fmac.yaml
Date: Tue, 20 Aug 2024 12:12:14 +0200
Message-Id: <20240820101216.355012-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix to restore the constraint in the json-schema that was lost when
support for the Apple PCIe devices was added in e2e37224e8b3
("dt-bindings: net: bcm4329-fmac: Add Apple properties & chips").
Not sure if the rule of separate patches is the easiest to get
this fixed. If one patch is preferred I can respin.

The patches are based on main branch of the wireless-next repository.

Regards,
Arend

Arend van Spriel (2):
  dt-bindings: wireless: restore constraint for brcm,bcm4329-fmac
    compatible property
  arm64: boot: apple: fixup wifi device specification

 .../net/wireless/brcm,bcm4329-fmac.yaml       | 19 ++++++++++---------
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi     |  2 +-
 arch/arm64/boot/dts/apple/t8112-j413.dts      |  2 +-
 arch/arm64/boot/dts/apple/t8112-j493.dts      |  2 +-
 4 files changed, 13 insertions(+), 12 deletions(-)


base-commit: daaf0dd0398d5e93b7304f35184ca182ed583681
--
2.32.0

