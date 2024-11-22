Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049664207A
	for <asahi@lists.linux.dev>; Fri, 22 Nov 2024 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732269277; cv=none; b=nGo2023vmq0z1t2xKah3UQpoIxXSKZ9Ba7aWAgBcPUk68AEPR/1geRgyKOTHgWk1ua35Xopy4Zxjnu6NfzDo2/ZBTcUW6dq/rIr/Vgam2KmCCqG6hV2NResvbFeNa2f0mWw7b2v7Ov/ObfgMATgU8hg5BO2oWF0c9+7wAl7xh78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732269277; c=relaxed/simple;
	bh=4r/AQaOmKgXOK7Xpqvsxu30yzczQ3+695c7PBSnrjUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ikWNOymvoYQg7fZtFXYVHq8N7763TdgwMelBlpAdXzJDXKHGHqIQ41qUVhVHNcnjH25oQeHFMvHY+cbFHxJPEpWb+TAPr1Ft96cSckOjnSHO4zpBS70vLiJNZPJ6fd/o3Kdmjw9vO0wo5xxOX+SSHdwgDxeNlojzUi/NUTm0G0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jscxTbkV; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jscxTbkV"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-724ea6a8cf4so104737b3a.1
        for <asahi@lists.linux.dev>; Fri, 22 Nov 2024 01:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732269275; x=1732874075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jMwyC39icc4IvLpJGYFqdt3FBTe+CoSHG8g9XwWwf/M=;
        b=jscxTbkVqTLC2TCLjttPfJwpgyrfKmTjNlYh0Egn40/NO50v1ywsr+de3WLqveO+5w
         m++aBHrXKGfbHz5FkAScvoOaUpMspYsBzcpwoZyV0jUqZ2tmNWx3T4BmKNqQeTBeCm3P
         K/58OBYjn+dxQJvAzwjQ60VUlR6wZ8/eXqHBH/SjUO4ChS/j3EIznrMhHlc/7/Uh1/zp
         C3n2lnFPkL/FDuXt7nAZXnSkNq04XwROr22a8T610bYi7gn2r7jkZ3ORWRwAjPFs3sJe
         bO1NiaAQcjRA2Zdc9plxjwF7vkWqWutIfovSJtO0aFzi+PZWU4Yo6AfClpe1PkezKT3T
         YN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732269275; x=1732874075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMwyC39icc4IvLpJGYFqdt3FBTe+CoSHG8g9XwWwf/M=;
        b=kHqYeekyXlQQZv22h4iL8l1K701bLlh/bl5ZMbxdrBnN9W3G2v5Liltx0udIMrjWPv
         uq9y866mffxHVJX/HmMx/qD9kdTsSQ2fitz31597OaQ4+aaJ7JVxuCZ1dnW1T9uDg/L2
         R34doiQF2yENxgvJt4uOlZf/gZmWi7o+2xhJzNfiK0zKtFGn/jIFyRaICiyWToJXnEvq
         yXLWOa2phWjBtUeixPmLQcunKrLzylyjctZw/IsoosyOdzUuKSi8UFXWj3FGVJgU9Rbl
         mnGtpSYG+cpB48fccaU4r3ERqsjLpnO5WkwEy54OJa2s1CfTWO506nxw/Bvstn7Ydlij
         RFEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM9Y+HSkRO2xvbaPps6ur4e/6P9+Q4EGa9w2rw380eKub0SJUFpVxHJA0W5xrWuq/scIUqVg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj//nZH/nK6aFThkVLDL90IStsJO7oUS9pDUulKhcmHfMP+Tx6
	D5N2Uo/R6ANuVXVUvGdOfHHEFWWVop7dQjA6JaO1SNZMVzpUepN/
X-Gm-Gg: ASbGncubGC+2gOXcIVjUwLzqilCvBN8pRkWycQYhmpaCgvaqyUdLJh7Vpb41ao9NSxX
	7ZhESCOh6brt6MczOWyItEwdV9o8Onpz1MAUc1wEunssTIm1cwwbDodOhwq6ofrmUy+DzGvYug/
	IIhh7GpF+o/ZogllsTz0kImKALmkMQeJqdVU9BwmguQP+iept1hz4ruZYeTy3hDZ4ecNhBTiU/c
	2pETxtsOgIxhTcm4lLCWtcJPlh83wpFMEYGCR8Sx/KzaOgBuVmdU8ABFW+ew5YeMok=
X-Google-Smtp-Source: AGHT+IEjVX8VWWWGoeSVP64ft86gsom9aoLkVu92O9mQT+9mQ+XFMKlDJE5V2OCvy3SC3WAbz6IS8Q==
X-Received: by 2002:a05:6a00:c81:b0:71e:cc7:c511 with SMTP id d2e1a72fcca58-724df68f1a3mr2932208b3a.23.1732269275199;
        Fri, 22 Nov 2024 01:54:35 -0800 (PST)
Received: from localhost.localdomain ([182.152.110.125])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7fbcc218a87sm1236332a12.39.2024.11.22.01.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:54:34 -0800 (PST)
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
Subject: [PATCH v3 RESEND 00/10] Add PMGR nodes for Apple A7-A11 SoCs
Date: Fri, 22 Nov 2024 17:50:29 +0800
Message-ID: <20241122095136.35046-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the PMGR nodes and all known power state subnodes for
Apple A7-A11 SoCs, along with the associated dt-bindings.

Changes since v2:
- Removed "apple,always-on" property from "ps_pmp" from s8001, t8011,
t8015 power domains. It is not on at boot. (Mixed up with ps_pms which
is required to be on)
- Add asahi-soc/dt back into the subject prefix, missing from v2.

Link to v2: https://lore.kernel.org/asahi/20241102011004.59339-1-towinchenmi@gmail.com

Changes since v1:
- Removed "framebuffer0" dt aliases. It is not standard and not needed.

Link to v1: https://lore.kernel.org/asahi/20241029010526.42052-1-towinchenmi@gmail.com

Nick Chan

---
Nick Chan (10):
  dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
  dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
  arm64: dts: apple: s5l8960x: Add PMGR node
  arm64: dts: apple: t7000: Add PMGR node
  arm64: dts: apple: t7001: Add PMGR node
  arm64: dts: apple: s8000: Add PMGR nodes
  arm64: dts: apple: s8001: Add PMGR nodes
  arm64: dts: apple: t8010: Add PMGR nodes
  arm64: dts: apple: t8011: Add PMGR nodes
  arm64: dts: apple: t8015: Add PMGR nodes

 .../bindings/arm/apple/apple,pmgr.yaml        |   5 +
 .../bindings/power/apple,pmgr-pwrstate.yaml   |   5 +
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi  | 610 ++++++++++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  13 +
 arch/arm64/boot/dts/apple/s8000-pmgr.dtsi     | 757 ++++++++++++++
 arch/arm64/boot/dts/apple/s8000.dtsi          |  22 +
 arch/arm64/boot/dts/apple/s8001-common.dtsi   |   1 +
 .../arm64/boot/dts/apple/s8001-j98a-j99a.dtsi |  26 +
 arch/arm64/boot/dts/apple/s8001-j98a.dts      |   1 +
 arch/arm64/boot/dts/apple/s8001-j99a.dts      |   1 +
 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi     | 822 ++++++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi          |  22 +
 arch/arm64/boot/dts/apple/s800x-6s.dtsi       |   4 +
 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |   4 +
 arch/arm64/boot/dts/apple/s800x-se.dtsi       |   4 +
 arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
 arch/arm64/boot/dts/apple/t7000-j42d.dts      |   1 +
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
 arch/arm64/boot/dts/apple/t7000-n102.dts      |   4 +
 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi     | 641 ++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi          |  14 +
 arch/arm64/boot/dts/apple/t7001-air2.dtsi     |   1 +
 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi     | 650 ++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi          |  13 +
 arch/arm64/boot/dts/apple/t8010-7.dtsi        |   4 +
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   4 +
 arch/arm64/boot/dts/apple/t8010-n112.dts      |   4 +
 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi     | 772 +++++++++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8011-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi     | 806 +++++++++++++++
 arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |   8 +
 arch/arm64/boot/dts/apple/t8011.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8015-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 930 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
 39 files changed, 6236 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8000-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi


base-commit: 28eb75e178d389d325f1666e422bc13bbbb9804c
-- 
2.47.0

