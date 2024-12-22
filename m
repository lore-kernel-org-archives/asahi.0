Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA311192D67
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 17:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734888796; cv=none; b=fOD0FowsSm8Xub8E0rFeZKjUEbbi537+rYjw83GrPD8jgAlHiDjAZcIOG335FfZakSQUwTsKChvs6L1EcCxDSKTfqOlrYokeBzU8Mzeh9b1/KWuFAs1eOxJ44IsQvyVeIDQUW4yKs7toH9laEB/2xkdmviOocKNzj8U+fL/L668=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734888796; c=relaxed/simple;
	bh=usaCNOFtOJ89h9HLbxQysc6MANRxD6iOR984cQtuxW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AkI1JFriRKENHh0wmgHbaoCTxOfh4F0yOHvV49ssilbjKjVdDY4u6t3iv5PXTRwD33sD1w0t/wLbp4iJw0I2LETwxaU4rYzydSr8huiON0T4+XdotYHRwr+4WWclUKs/eYf3MTkTDPwFMrebWOu34DuwFfIYTN5AAmCcR8t78Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDmv5W3L; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDmv5W3L"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so2502593a91.3
        for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 09:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734888794; x=1735493594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HThsFhdrYGz3zN9X3vgN5sb+Y6o8RirTuI9rS65tL3g=;
        b=BDmv5W3LX+D6E0t6F5CHAZRMYuAyPzuVy2vVtUUVyomOBY3dyiPYVmdhPP68mtOIgY
         6YJCP89DrIqG1/QQFmCn9Yo6OfA/J1r402blZQcfHImttPAoqun13M5f7Mui/9jVrm34
         DglwajS5uY+xQIAty+Qb3wAZ+QFMeTmJomCz8Af3jzzpyH0xiP7ckUUD4GULADrYV+Ia
         jEMdChuj7jzit/qVOFJA8ZDBbo0oykG25ynjigHr1nlKKonfXlZ/AzKh3sNcUPR7QSGS
         FeUTe56DTygLdlgEOh7mKKjmIZbL+XIivL70QGXrZVIX9Q25AaI1QJ0TcyrR/2GAG1UW
         nL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734888794; x=1735493594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HThsFhdrYGz3zN9X3vgN5sb+Y6o8RirTuI9rS65tL3g=;
        b=MR62YPm7b6E7k6RDCKwe7QjvS7aoZAMF7a1y20yKEjhcZ73NDqwA9r2iSUrGVttgZQ
         mvyxsqMBgkbjcUhuuoAY/WYeGKDbrUAcBtAlXhadmBoURizwUYPEuRX/6mDMQxcfzXl8
         vi2CJ1h74BX6gEIpK763ULgpyuilKj6Ln4OZHoNwTlIlur4b+Hgwtb/A8J//f2Ue81zt
         wOaQIyZo6iOJJWt7VFqfKeHl9KSfM/t4so3j1tRCKAufqOk8rCaWrR+q8D36tDZUEIfX
         nexTZ/chZN6wLJc23BC8HJDNa9u/TdiSnolxCYr+Nx2bQLwRoNpSZ8Yg0RAP925+gKL5
         T7KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDpMbvrEl1AKnsHsdYKp7RhC6kfTT1gNFRI+wzm+BPq7XwWbvsfKxw+HTb7sGhtXcI9ILGRg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwE6mvHxx4TFib55pBvTO21uC3kL9uTj6d7OO0b6/bg8XecEFtS
	RHhjrVE69q9P8GkcvGXk9pRL/Xw2h6RbOnmpgZdXoOMRIgMSciEy
X-Gm-Gg: ASbGncuW2CWgd74eL96vSggFOxl2FZCf6aBdT2T7TVqYEvwMTl4Yiwc515TWfMM3i4W
	k3YOxjxT8rwsKfw9zeorDx00S6W6JT9ty9beb5VLDkiDWf+n6iaJ880UCf8PdepstcfZGyGButZ
	6MBvICXDdynHQQ8lwuMbz5EKJnN2b9p4522qV43AyHbQeKmbAn9P/mNwCHUkfwlvPVC5+r7qQPa
	NmSJjHAFdrce5yIrXQivOdOdxmeXgD33jZSb0Sy5ByZ66t+7lAgYeU4rg==
X-Google-Smtp-Source: AGHT+IG5lQLHbYxVxhyBqPz1iFz/zgJVxJSHiW4gi8aEnosKH/EPAaRGpfubHe4U/8ia3hBLxAGxfg==
X-Received: by 2002:a17:90b:534b:b0:2ee:c91a:ad05 with SMTP id 98e67ed59e1d1-2f452dfb0c0mr13564716a91.3.1734888793975;
        Sun, 22 Dec 2024 09:33:13 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f4477987f4sm7567552a91.2.2024.12.22.09.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:33:13 -0800 (PST)
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
Subject: [PATCH v3 2/2] arm64: dts: apple: Add T2 devices
Date: Mon, 23 Dec 2024 01:31:48 +0800
Message-ID: <20241222173240.147675-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222173240.147675-1-towinchenmi@gmail.com>
References: <20241222173240.147675-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DTS files for the T2 SoC and the following devices based on it:

- Apple T2 MacBookPro15,2 (j132)
- Apple T2 iMacPro1,1 (j137)
- Apple T2 MacBookAir8,2 (j140a)
- Apple T2 MacBookAir8,1 (j140k)
- Apple T2 MacBookPro16,1 (j152f)
- Apple T2 MacPro7,1 (j160)
- Apple T2 Macmini8,1 (j174)
- Apple T2 iMac20,1 (j185)
- Apple T2 iMac20,2 (j185f)
- Apple T2 MacBookPro15,4 (j213)
- Apple T2 MacBookPro16,2 (j214k)
- Apple T2 MacBookPro16,4 (j215)
- Apple T2 MacBookPro16,3 (j223)
- Apple T2 MacBookAir9,1 (j230k)
- Apple T2 MacBookPro15,1 (j680)
- Apple T2 MacBookPro15,3 (j780)

The Apple T2 is an A10-based security chip found on some Intel Macs
from 2017 onwards. On models with a touchbar, the touchbar's
display is wired to it. These devices have no offical names, the
naming scheme is from libirecovery.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/Makefile            |  16 ++
 arch/arm64/boot/dts/apple/t8012-j132.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j137.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j140a.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j140k.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j152f.dts     |  15 ++
 arch/arm64/boot/dts/apple/t8012-j160.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j174.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j185.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8012-j185f.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j213.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j214k.dts     |  15 ++
 arch/arm64/boot/dts/apple/t8012-j215.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j223.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j230k.dts     |  14 ++
 arch/arm64/boot/dts/apple/t8012-j680.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-j780.dts      |  15 ++
 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi     |  44 +++++
 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |  19 ++
 arch/arm64/boot/dts/apple/t8012.dtsi          | 176 ++++++++++++++++++
 20 files changed, 486 insertions(+)
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
 create mode 100644 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012.dtsi

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index ab6ebb53218a..4f337bff36cd 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -46,6 +46,22 @@ dtb-$(CONFIG_ARCH_APPLE) += t8011-j120.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8011-j121.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8011-j207.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8011-j208.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j132.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j137.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j140a.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j140k.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j152f.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j160.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j174.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j185.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j185f.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j213.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j215.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j223.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j230k.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j214k.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j680.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8012-j780.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8015-d201.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8015-d20.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8015-d211.dtb
diff --git a/arch/arm64/boot/dts/apple/t8012-j132.dts b/arch/arm64/boot/dts/apple/t8012-j132.dts
new file mode 100644
index 000000000000..778a69be18dd
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j132.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookPro15,2 (j132), J132, iBridge2,4
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+
+/ {
+	model = "Apple T2 MacBookPro15,2 (j132)";
+	compatible = "apple,j132", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j137.dts b/arch/arm64/boot/dts/apple/t8012-j137.dts
new file mode 100644
index 000000000000..dbde1ad7ce14
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j137.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 iMacPro1,1 (j137), J137, iBridge2,1
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+
+/ {
+	model = "Apple T2 iMacPro1,1 (j137)";
+	compatible = "apple,j137", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j140a.dts b/arch/arm64/boot/dts/apple/t8012-j140a.dts
new file mode 100644
index 000000000000..5df1ff74d2df
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j140a.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookAir8,2 (j140a), J140a, iBridge2,12
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+
+/ {
+	model = "Apple T2 MacBookAir8,2 (j140a)";
+	compatible = "apple,j140a", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j140k.dts b/arch/arm64/boot/dts/apple/t8012-j140k.dts
new file mode 100644
index 000000000000..a0ef1585e5c2
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j140k.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookAir8,1 (j140k), J140k, iBridge2,8
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+
+/ {
+	model = "Apple T2 MacBookAir8,1 (j140k)";
+	compatible = "apple,j140k", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j152f.dts b/arch/arm64/boot/dts/apple/t8012-j152f.dts
new file mode 100644
index 000000000000..261416eaf97e
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j152f.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookPro16,1 (j152f), J152f, iBridge2,14
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+#include "t8012-touchbar.dtsi"
+
+/ {
+	model = "Apple T2 MacBookPro16,1 (j152f)";
+	compatible = "apple,j152f", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j160.dts b/arch/arm64/boot/dts/apple/t8012-j160.dts
new file mode 100644
index 000000000000..fbcc0604f4a0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j160.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacPro7,1 (j160), J160, iBridge2,6
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+
+/ {
+	model = "Apple T2 MacPro7,1 (j160)";
+	compatible = "apple,j160", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j174.dts b/arch/arm64/boot/dts/apple/t8012-j174.dts
new file mode 100644
index 000000000000..d11c70f84a71
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j174.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 Macmini8,1 (j174), J174, iBridge2,5
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+
+/ {
+	model = "Apple T2 Macmini8,1 (j174)";
+	compatible = "apple,j174", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j185.dts b/arch/arm64/boot/dts/apple/t8012-j185.dts
new file mode 100644
index 000000000000..33492f5db46d
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j185.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 iMac20,1 (j185), J185, iBridge2,19
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+
+/ {
+	model = "Apple T2 iMac20,1 (j185)";
+	compatible = "apple,j185", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j185f.dts b/arch/arm64/boot/dts/apple/t8012-j185f.dts
new file mode 100644
index 000000000000..3a4abdd8f7d7
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j185f.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 iMac20,2 (j185f), J185f, iBridge2,20
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+
+/ {
+	model = "Apple T2 iMac20,2 (j185f)";
+	compatible = "apple,j185f", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j213.dts b/arch/arm64/boot/dts/apple/t8012-j213.dts
new file mode 100644
index 000000000000..8270812b9a68
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j213.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookPro15,4 (j213), J213, iBridge2,10
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+#include "t8012-touchbar.dtsi"
+
+/ {
+	model = "Apple T2 MacBookPro15,4 (j213)";
+	compatible = "apple,j213", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j214k.dts b/arch/arm64/boot/dts/apple/t8012-j214k.dts
new file mode 100644
index 000000000000..5b8e42512060
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j214k.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookPro16,2 (j214k), J214k, iBridge2,16
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+#include "t8012-touchbar.dtsi"
+
+/ {
+	model = "Apple T2 MacBookPro16,2 (j214k)";
+	compatible = "apple,j214k", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j215.dts b/arch/arm64/boot/dts/apple/t8012-j215.dts
new file mode 100644
index 000000000000..ad574fbf7f92
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j215.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookPro16,4 (j215), J215, iBridge2,22
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+#include "t8012-touchbar.dtsi"
+
+/ {
+	model = "Apple T2 MacBookPro16,4 (j215)";
+	compatible = "apple,j215", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j223.dts b/arch/arm64/boot/dts/apple/t8012-j223.dts
new file mode 100644
index 000000000000..de75d775aac5
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j223.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookPro16,3 (j223), J223, iBridge2,21
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+#include "t8012-touchbar.dtsi"
+
+/ {
+	model = "Apple T2 MacBookPro16,3 (j223)";
+	compatible = "apple,j223", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j230k.dts b/arch/arm64/boot/dts/apple/t8012-j230k.dts
new file mode 100644
index 000000000000..4b19bc70ab0f
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j230k.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookAir9,1 (j230k), J230k, iBridge2,15
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+
+/ {
+	model = "Apple T2 MacBookAir9,1 (j230k)";
+	compatible = "apple,j230k", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j680.dts b/arch/arm64/boot/dts/apple/t8012-j680.dts
new file mode 100644
index 000000000000..aa5a72e07d3f
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j680.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookPro15,1 (j680), J680, iBridge2,3
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+#include "t8012-touchbar.dtsi"
+
+/ {
+	model = "Apple T2 MacBookPro15,1 (j680)";
+	compatible = "apple,j680", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-j780.dts b/arch/arm64/boot/dts/apple/t8012-j780.dts
new file mode 100644
index 000000000000..9cee891cb16d
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-j780.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T2 MacBookPro15,3 (j780), J780, iBridge2,7
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8012-jxxx.dtsi"
+#include "t8012-touchbar.dtsi"
+
+/ {
+	model = "Apple T2 MacBookPro15,3 (j780)";
+	compatible = "apple,j780", "apple,t8012", "apple,arm-platform";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8012-jxxx.dtsi
new file mode 100644
index 000000000000..36e82633bc52
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-jxxx.dtsi
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Common Device Tree for all T2 devices
+ *
+ * target-type: J132, J137, J140a, J140k, J152f, J160, J174, J185, J185f
+ * J213, J214k, J215, J223, J230k, J680, J780
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+#include "t8012.dtsi"
+
+/ {
+	chassis-type = "embedded";
+
+	aliases {
+		serial0 = &serial0;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		stdout-path = "serial0";
+	};
+
+	memory@800000000 {
+		device_type = "memory";
+		reg = <0x8 0 0 0>; /* To be filled by loader */
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* To be filled by loader */
+	};
+};
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8012-touchbar.dtsi b/arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
new file mode 100644
index 000000000000..f4a8b12437f0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Common Device Tree for T2 devices with a Touch Bar
+ *
+ * target-type: J152f, J213, J214k, J215, J223, J680, J780
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/ {
+	chosen {
+		framebuffer0: framebuffer@0 {
+			compatible = "apple,simple-framebuffer", "simple-framebuffer";
+			reg = <0 0 0 0>; /* To be filled by loader */
+			/* Format properties will be added by loader */
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
new file mode 100644
index 000000000000..45d24ca091b0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T8012 "T2" SoC
+ *
+ * Other names: H9M, "Gibraltar"
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/apple-aic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/apple.h>
+
+/ {
+	interrupt-parent = <&aic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clkref: clock-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clkref";
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@10000 {
+			compatible = "apple,hurricane-zephyr";
+			reg = <0x0 0x10000>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu1: cpu@10001 {
+			compatible = "apple,hurricane-zephyr";
+			reg = <0x0 0x10001>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		nonposted-mmio;
+		ranges;
+
+		serial0: serial@20a600000 {
+			compatible = "apple,s5l-uart";
+			reg = <0x2 0x0a600000 0x0 0x4000>;
+			reg-io-width = <4>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 271 IRQ_TYPE_LEVEL_HIGH>;
+			/* Use the bootloader-enabled clocks for now. */
+			clocks = <&clkref>, <&clkref>;
+			clock-names = "uart", "clk_uart_baud0";
+			status = "disabled";
+		};
+
+		aic: interrupt-controller@20e100000 {
+			compatible = "apple,t8010-aic", "apple,aic";
+			reg = <0x2 0x0e100000 0x0 0x100000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+		};
+
+		pinctrl_ap: pinctrl@20f100000 {
+			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x0f100000 0x0 0x100000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_ap 0 0 221>;
+			apple,npins = <221>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 45 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 49 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 50 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 51 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_aop: pinctrl@2100f0000 {
+			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x0100f0000 0x0 0x10000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_aop 0 0 41>;
+			apple,npins = <41>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 135 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 137 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_nub: pinctrl@2111f0000 {
+			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x111f0000 0x0 0x1000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_nub 0 0 19>;
+			apple,npins = <19>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 164 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 165 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 166 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		wdt: watchdog@2112b0000 {
+			compatible = "apple,t8010-wdt", "apple,wdt";
+			reg = <0x2 0x112b0000 0x0 0x4000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 168 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_smc: pinctrl@212024000 {
+			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x12024000 0x0 0x1000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_smc 0 0 81>;
+			apple,npins = <81>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 195 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 198 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 199 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 201 IRQ_TYPE_LEVEL_HIGH>;
+			/*
+			 * SMC is not yet supported and accessing this pinctrl while SMC is
+			 * suspended results in a hang.
+			 */
+			status = "disabled";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&aic>;
+		interrupt-names = "phys", "virt";
+		/* Note that T2 doesn't actually have a hypervisor (EL2 is not implemented). */
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.47.1

