Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB43F21148A
	for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 17:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739380982; cv=none; b=N1cPgOhpITd9WAFwh/dvGTO/4xPeseTZFytWUBC7JHoI7yumAxY3WxUA0/h62PQ3gAV01wqWe8quYXLLvZB/f4n6g8QelOtUeIWAMWjpuzDNmdEfbBwwpSq5U0vMaek6iIbzw9OQiyhhBRo4Y/hwVveOdc1cpmfMLQUg/DeM+N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739380982; c=relaxed/simple;
	bh=1xhseV3eZQGwx01B1GvNTQYFNKov2efQn4y8njwtipI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WSD14CHrCocg9A7d7bNVnKB0xNFX0Jq/FxjrHz2NvbVznxgHjIgf5OQN7GO7iQj5UciWHHs+FllmpRvW3f/h2P5Ha4wXYePIEVeLFM9AkxpwM6nObcYc59+c/w93Br58nk4L0XPs7lQv60S7rUdDkCLyOiQOC98ePIwM8/3Z8Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKuS6c/r; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKuS6c/r"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fa0c039d47so30263a91.1
        for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 09:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739380980; x=1739985780; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1lFTrP+BonqZ6RE+K7BgikeM2R5BYOXIWvccxtapFFA=;
        b=dKuS6c/r5frw0R433lDUnEo4HXopzxwOjE+7K2g2VQ95Bx1lnZbrKhyfQu/pUgJU7o
         1e1IiJmqm91LYAbc5Fm15c0GDdbp/HfW6j/MQZT1e2pG9k+dV+CmjDyQmFtvNiDk78y+
         EbtWPVCb8BjXn0QrdF7EO/Vp2PpGyd47yhrll/S+sV6sKAl3jl5xaScAlZrhEr5Jn6dr
         AKwmfYN6IpB70wTcOvKtEqXKyz9hFTySWXONdyPXEM6vezpEYlHR+4vUvk4518odtabj
         3LEakrdIZOUz97FMu4iutNfMLfAmFF56RPIX/DPVOH5UvYIkk1K9/7bC92uj3Tj/BCIV
         RnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380980; x=1739985780;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lFTrP+BonqZ6RE+K7BgikeM2R5BYOXIWvccxtapFFA=;
        b=FJSkn82/Pgyvu5b2cu5G4IYf7Oa4Zkhnzi8PsR1+6n1LZWUIP2CtbPXJbXPGMp9AD4
         gp90bNudfjFWlRvMNHyOSR6dijb7jPaTlZzAvAa+wYS/Zuli8Hj1UB8Vh0R1vctRfd7q
         ZOTo+cNFyS1UX7uDEAfaGlLf22Sz/tqP4uO2sGZRVZez9fTCmbpa9jcR+AYZmU12C1la
         qRh9GkLtGpC5L5VDxo9weLUGh9wWXM30UBKFlG3J8WR+jMAAQ6ZcbBdSqRl3+i+oGYSn
         kwETotQwLhKdmi2ZthrRrshC5x8XgIOVRpfD0b+oO+xoScswvFkhTxTYYEt4OqGIRAJy
         lraQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtA1p0zMMBwO+Y4dhYgmRHccZYwzatH6F8gHVS0XLg+H68jKJ+ER/YHAJ4EcxH1Xt/AExD9A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/lfNY37/CqJ1wE8XOXDFzkjjPPj8P0WyNIVPuOO65l+RqAqaR
	iu9qbLf5wNpaT+pMcdBlDbgjB9PSGt+bDcrnwBcg+6u6rKdq8JHL
X-Gm-Gg: ASbGncuuIwC8leVnn4fDbtLiVF5yxmdl4M4zJLD7hWYIMd41tBM4O6mVop/2FCX5pDL
	M9GRLvN3G4jSDHS8aVgajHhoWdyS+JnGE1iZ0/kJDvzHQWu53Yc4Ts6Khc39hL24AilE4HLfdKi
	o6C1fxd/wC7bJKfv9pA8rTquVkY06S7MCd2R3pZdJFGPnzAo4jpDqj93wW7Ce2v7qo04wySe0ng
	XB8+Np7UaV88pbcP22X6BhdXKgzqaSvvA/TVEXy8NBg0hzsS4X6pbPrWE9QmiT1gLc8ubcp1fuk
	R5Tri4Fy/wx2AMNGgw==
X-Google-Smtp-Source: AGHT+IHn0FJgAgW3EXqfL57h9xApzlzHjpYghcGnfSVWGl24NW8c0UStwz3RHGsKchK5LzWYax0kIA==
X-Received: by 2002:a05:6a00:f05:b0:730:9334:18f3 with SMTP id d2e1a72fcca58-7322c411b76mr6606040b3a.19.1739380979926;
        Wed, 12 Feb 2025 09:22:59 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ad54f1691ddsm6001705a12.61.2025.02.12.09.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:22:59 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 00/10] drivers/perf: apple_m1: Add Apple A7-A11, T2 SoC
 support
Date: Thu, 13 Feb 2025 01:22:23 +0800
Message-Id: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM/YrGcC/03MSwrCMBSF4a2UOzaSR0OrI/chHVzSpL3QtCHRo
 JTs3VgQHP4HzrdDspFsgmuzQ7SZEm1rDXlqwMy4TpbRWBskl5pLIRiGsFhmgn8yjRrViOrS9gr
 qIUTr6HVg96H2TOmxxfdhZ/Fdf4z8Z7JgnLnedE6iEV2rbpNHWs5m8zCUUj7kPNbTpAAAAA==
X-Change-ID: 20250211-apple-cpmu-5a5a3da39483
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1782; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=1xhseV3eZQGwx01B1GvNTQYFNKov2efQn4y8njwtipI=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrNjvY246j9H6DeRb0g2O3j9o8zgzHfGbZjPdV
 2uKaekESv6JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6zY7wAKCRABygi3psUI
 JDBRD/wLPfzXMs9aVY8on5tPGhLo3DjPOGnM0XC6F2UvrmfaEbLz+D/W/RCe85Ix4/tByB+XDRa
 RuTaDOaDP3NoWXTSNimsNtouZjGpnh1em/d4yG2okJakIfyxR7/dckYimS1bWCKOSqbBggP3TVe
 KWy7qBFEX0czP80k5LS81eNULS5leSKM4Ugqtcu9CqWvEGESred6TdibRRzeby913DG24e6CH5H
 0jIr7ytAOPxEA8ZOzudgUkHWVB3PCI6FKdstJ8BASmjTXKVIp/3JjmSsk/56LeHq5oUYlVu5Xw8
 O0KIXbBDvY3JxD2aEJ7MwH4ArX7FdFZbmyX9B6H454OUiiqJPX83ibfSxzWSIr109vZoktu9jrE
 atXdsvBHrddB6wrEdR+V0fNmXy8wYqSG4c25U7NWsW869tVtqwjK6fPcgllpLy5SctQe4fQ6lEr
 vqu7YzQzmySScXYwKgHBAU0NnXq9UsRG2mKWqY7HlcXpSNvHUBx5MjehHVeZCokMQvv75rdQsyA
 tvDG+STTEz0GmzpXp099fFoyRQLurWn75Vbz7L2eketulKuGCN1R8pY/1ijgLSAlCQ2a4l/+dXl
 pRKGSX++VQF2pbU+ORxY4ULcf+hR/jSgrjDcnayyIEzGm/s99I7//hINoCQrgpvguHG8ivw1l6A
 a52AqZHGNXeH18w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

This series adds support for the CPU PMU in the older Apple A7-A11, T2
SoCs. These PMUs may have a different event layout, less counters, or
deliver their interrupts via IRQ instead of a FIQ. Since some of those
older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
be enabled by the driver where applicable.

Patch 1 adds the DT bindings.
Patch 2-5 prepares the driver to allow adding support for those 
older SoCs.
Patch 6-10 adds support for the older SoCs.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v2:
- Remove unused flags parameter from apple_pmu_init_common()
- Link to v1: https://lore.kernel.org/r/20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com

---
Nick Chan (10):
      dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU PMU compatibles
      drivers/perf: apple_m1: Support per-implementation event tables
      drivers/perf: apple_m1: Support a per-implementation number of counters
      drivers/perf: apple_m1: Support configuring counters for 32-bit EL0
      drivers/perf: apple_m1: Support per-implementation PMU start
      drivers/perf: apple_m1: Add Apple A7 support
      drivers/perf: apple_m1: Add Apple A8/A8X support
      drivers/perf: apple_m1: Add A9/A9X support
      drivers/perf: apple_m1: Add Apple A10/A10X/T2 Support
      drivers/perf: apple_m1: Add Apple A11 Support

 Documentation/devicetree/bindings/arm/pmu.yaml |   6 +
 arch/arm64/include/asm/apple_m1_pmu.h          |   2 +
 drivers/perf/apple_m1_cpu_pmu.c                | 776 ++++++++++++++++++++++++-
 3 files changed, 752 insertions(+), 32 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

