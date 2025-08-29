Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061E62C21C7
	for <asahi@lists.linux.dev>; Fri, 29 Aug 2025 08:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756457307; cv=none; b=t6so2GYgfWuuSc7jJnbwIoAP8jiD9yvZybjUEwkhaB7AzqOl/vVu3grRI5e8kVxny9zkpRlDeLXo8GyD9avTPZUe++VNes50XOyAHfdT6xNOBI5ieJTWc3O9Wu8gwrILoMcqtdInXrVVKBFAWo6oOpxi1WTizucjie6+mRJvIco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756457307; c=relaxed/simple;
	bh=nEV1xIt3tWltM6HcFTPL9++suMELB5ydP0fIn7qC2Sw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IqwXXbR6mOYLzFTooH2obIsBdS1ByJa+QKjCa7SIsz3DQ+64syzQZ+IQu1HpkWro3HxoB6YP3iG+onA6U+5T12dncWk1rjVbEJN3kODWIzGZEyDDvyrOY102lVe1Eqm08nCEbwxwFq9BhWPZxaPgSE/qGIDKYzxIj+epxrUtNhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0YQqR2y; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0YQqR2y"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-772301f8ae2so256807b3a.0
        for <asahi@lists.linux.dev>; Fri, 29 Aug 2025 01:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756457305; x=1757062105; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mi+Q3MX+Nh87QtdSLZzXC7Ij30Ba/l8ZeRTlSODhCu8=;
        b=U0YQqR2yClS3p+ncUYo9dV4uS/UNo6hz4RSsy83Hr8M9ak7KQxAgGQCT/Q6DLEstEe
         SFau3JK2NTyynvFgkEpFqAty38C7GBkiS6SLQqz4uiviyWHsAic4TKua4n0/E0/f8ZOH
         EBawEdrhv5VmFldGhqPf41+gJ7jv3wfwrAg252gs3r74ZDdK9uj3cCuPZ4d2VeJZPcb5
         aZPscQ3ZCx/mPsTtGcplUtQmG35SBUu/pvBQZ1+3KnsOXtIF4L71/UTeYxQMGmmuMqUA
         DJinUrnixpSy89H6uUfujd5i3Rj29eGwGZ2scBpJ7WrhoabbFFrouu81z0vICD6bOimK
         ooNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756457305; x=1757062105;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mi+Q3MX+Nh87QtdSLZzXC7Ij30Ba/l8ZeRTlSODhCu8=;
        b=tfHwB7yD4x3nwl+fOVfZBWUsEVnta+lgPjv8fzY+zbdPOjUHhTFJEYGbisESkqZPI8
         YT5MC/YGjkTLfALvBdie5Y94HWY+hjW7tD1xGa1tkD54l4zzV5Fk3tp+Dw6Hv5Z/lfBu
         JmvP3ldEY5OocZbIjayMtJL3oywTKa4Vyj6XO+LBIizJRJMWZSMDHtCOqi5m0pGjKFJY
         aNBqSf2Ueqf3eb3WNrZcI3Ds56S6502sF1f8hBEmbDGXQSn1IugAfkg629vWOTyQCqDT
         trfe/TfXUmbAmFl2TESuhdGDA841pYPpuSWVA2GoEW2WsWeXxUYwM21kVOABNUsiNMOn
         uD4A==
X-Gm-Message-State: AOJu0YwdTJHlqhMlE1TI35oKAqBGphmHZjmeUHD45WzrwZr8TQtHq7g1
	kmFgiZ5oru15aMYR+wQLWNtKpb52mGxF42/Bk4fTChr31uNXjp2XSQog
X-Gm-Gg: ASbGnctqdpqfEEAVwzB55Y0qbj/UifmX77M77BURRbU9ESuYhL974PFkb7MrXvXYej4
	vEQCxvuLNfQ2Xux+pcuFp2JtgE8gNpA+K5NalLL0AscorNrkk2b3Wbaq08Jkl9bi4/Z0EVNkdck
	7I1oDRT8bUADnqXNntVy8vmJ84u+ZLyrOLC7eiJLWJryA6vquv6Gh2JCgrtILkRQPaGYE4onWY6
	nq9Ze1jKhAhutfZ9YDsu6b8LgFdgi7RbwlNPE5wN6bIYTxv/I5pxFuKZsdpHZrlQB4weurOZZWb
	iT3dXpqefCUzeEKBmZiKNrMQ3uSOgL5zO0fnnpJjQ3CxO7Fq+ysh/ehjhhG2EPnjHw/JWx2tZCx
	zGHe21iFbpzMtjSE7ogo8+ejleAhC2khDXi9Twg==
X-Google-Smtp-Source: AGHT+IF92ta91tbD2snSJw5gReCXfDa49jmAVhH5Bgdtos5T47Tiuix39Bo6F4/vkbDn8/8BcAZjEQ==
X-Received: by 2002:a17:902:c406:b0:248:79d4:93b6 with SMTP id d9443c01a7336-24879d49805mr152138675ad.47.1756457305189;
        Fri, 29 Aug 2025 01:48:25 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249066e042asm18162565ad.146.2025.08.29.01.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:48:24 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v3 0/3] SPMI dt-bindings and nodes for Apple A11 and T2
 SoCs
Date: Fri, 29 Aug 2025 16:46:59 +0800
Message-Id: <20250829-t8015-spmi-v3-0-58b15ee2c825@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAANpsWgC/1WQy07DMBBFfyXyGqMZP8dd8R+IxfjVWiJNSUIEq
 vrvuO2CdnltnzN3fBZLmVtZxG44i7lsbWnTsQf9Moh04OO+yJZ7FgqUBau8XAnQyuU0NkmaYjQ
 ha8NFdOA0l9p+brL3j54PbVmn+ffm3vB6etc4CI+aDSXIqJO1nAFNwLf9yO3zNU2juGo29Y8S4
 hOqOsoqIKcK2bjwiF7uleby9d3XWu+9ROSlyH4/tnU3gFNRF8NYiaAiGKZsYoDonfdEnhyzj55
 u2/GaDv03dkOfzzZC7K+KN9bqmjX04V6bEiwFTglC9PWZ0h5TRkPkUlLJZlddoUqFk8HqEaJyy
 YDmXvzyB9NwkumXAQAA
X-Change-ID: 20250527-t8015-spmi-838bb49d34ae
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=nEV1xIt3tWltM6HcFTPL9++suMELB5ydP0fIn7qC2Sw=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBosWlJqPJ+FMi+FGW4iwdzV8JA3JwejRSBQ7RSN
 uoR4j9ldGGJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaLFpSQAKCRABygi3psUI
 JMm1D/9JBtSzUGlRr9Qz9q6BQLrnRboncw4vE/O5VDaT1Ij7tH3FjTj308oOERrhEIh04am4TzK
 Rc87KTt7RV1qa4tRtD6pB8R8ryFCRbILCSOfsX10qZ7qGzywHjzRuE5AxkAnx1udo1EJBHzkOf9
 eZTdzLTkUUZgVOnZHKlm2nJfJRYPPmwsWt6N+w6CHMF0Z/5m6pj4jpB4WzOujxLUABNEv/FGB+A
 WgsCxFnnxcRABvNT3wdvo/3ImgMx9tVWVYYmuSD7Fcgj7T1jUZ/jcnJRr8AW2en+99kMofqlU9S
 m9Due3Ro99t/v9dPa5njKOxp6ZDReJeFTfCK/8u93wwTDa5AaF5IebJgFmw1cRD03l8YvfNzAay
 JIoyQ609UPvblr++fpNSKNu66BowEUtjh102O+NpV9aaz/aR0gEmW//hRU5pQ5bo74jA2muwpNq
 DSpFgKfVYptWJ6BajKk/UD/KSNooQCCxldWmknRpGUC4AcHR7BcvBTnw6KYq3ToCkK8s0xTohQY
 JowmN0V2OrIUbzERglSYtBt+4vUoD9uPGCv+bQB4W6bapuSDIGwqV78+JqYUpZJCJIg5CwrBYT0
 YJ/FWk1bxUWdBSswi06Cwzl+z6UvC1MVbLXVX3md3lnTeFKIIWQR27A75UchzP0hMLCO1/6qrxO
 UZcES3UbvUGRneg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Hi,

This series adds dt-bindings and nodes for Apple A11 and T2 SoCs,
and the existing driver appears to be compatible. Drivers for the attached
Dialog DA2422 and DA2449 PMICs will be in a future patch series.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
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

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 6 ++++--
 arch/arm64/boot/dts/apple/t8012.dtsi                   | 8 ++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi                   | 8 ++++++++
 3 files changed, 20 insertions(+), 2 deletions(-)
---
base-commit: 062b3e4a1f880f104a8d4b90b767788786aa7b78
change-id: 20250527-t8015-spmi-838bb49d34ae
prerequisite-patch-id: 801a5b0bb76e74553fd30469734e9589acc09b7f
prerequisite-patch-id: 371cd14886cc2c5d6f6e8f8eac41f710b26c403a

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

