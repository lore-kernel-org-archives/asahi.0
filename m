Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A266215067
	for <asahi@lists.linux.dev>; Mon,  9 Dec 2024 07:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733731172; cv=none; b=RnLdzNSvK1Q+d/xTM3RS/JzKsD7T0J+v9llShCFhfSVW3Sz70bDyB8BSsWLjqhihVhDa/w7FX7hNpyvHtr3h7APlzt+Py1QEKymvFxUgEjrW9sM8nTl4DaMQjRveTOZipTHt0KqV7i5PZZcwtun1Frnflxt1DXBRi8xGa3yCeHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733731172; c=relaxed/simple;
	bh=3uOb8Ph7pXIqUZbw7TsQpsVXfzCs1n9SijT4jDjmmy8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=dfnF8AITX2ZaqyAeYl2ME4e3PIJSG9GIpTD2wENyRgxHKpAkaHoCWp/cwhHGJ6sIV35WjkJXvZ8R4Lv+EY+cvQxv9a+ZNlJJAMtOzkYiV31u6qZMg2tPSUktcqptQGYICPIaFR37pFmOizEhxXKRveavqKE6FJ9AJsKP7x8F6A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETprDIzf; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETprDIzf"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-215ac560292so39506215ad.2
        for <asahi@lists.linux.dev>; Sun, 08 Dec 2024 23:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733731170; x=1734335970; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7gbsMKce0iUUWg86NGcSWuqSJewGWtF9btgnRLQtZXw=;
        b=ETprDIzfXyX8XDmANy7dhdxmrzUwg0H58Iyo/C65RqBop7NcFqvxnjkxt4iniOq4g+
         IN6syp+j+mASiCZjedRvzxNcNpaf+2DC2Z1Ed0p8F50VXd2VUmpR6+hQfx9ZNFbf3oeS
         OQ/mGFSRkylm82D8Rf9OKkrs37wcnupmz7cUt8uy/el9+vm+q8pVmOZkjVJZ2Pw3jLWq
         MzGcDplJGpvllrpDu0OhM3TZbELs9Ix4P9EY2XDWbd8p5Zl8vSvVBFwZRfQljgecbpjw
         Xg5sQKn3SEMeWXCyl8FgqSw0RUyDPO0378D6obE6qYks84qRFeKJgNPoj92V07HPoyCB
         d0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731170; x=1734335970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7gbsMKce0iUUWg86NGcSWuqSJewGWtF9btgnRLQtZXw=;
        b=rXVEpbFSiTjwifYvThzw3Lpop4d5lnupZx1KUmHUwC7CiwyWNtQrsl9RjbOv1+qNR/
         ubCy1wyHFX0WMCvg9/izXhawGhmESqyt1qGUGZ0hVhTQWn7xwUifIqx0uwIDnAv5R4xe
         uXazj8HmQ3GQin+LHlSnzmyM92wwIogJQ7tp4C6O3n8ryhom531tG+jxjLLi7iwK7IgV
         TG8o+INb46JS4YyLdfswoT5fCFOTL5VPz1XlQbjS2J+xQIAf9P+VChNB+8lpXjbys6D8
         XUIprcK4kKTxKFypyr+ibynrmFXFhrOXHtdPQrSUmUCwQW2ZjSHgwGf9wwAuWQTgyzsT
         8u1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5sMnKiIiNQAMnEEreMZmGKTZJlzhg1kVf8qjlqOe6RFlZHgAn88MMxyIqkAg+0GHOQs5/rQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWtftYJVWs3XYZT+nJMpEJyRNNnXwdRcfiJzFszZELCpRfk0+E
	koL1zUwPHTq9teQPo4t7EMQlGx7f/n9XOthsMgQCEKNfuyT8vA10
X-Gm-Gg: ASbGncusW/g+dxzozIkR/EqYWfQbXJ2HUNc4Hv0PeUtq5Q8UiZn2OXOUS9NM4QV2nYE
	imkIkRAU2JdPD4cRt6Pt8OgZdPBJP1CqBwAN59NIT/NFHm0XT9vLr7/Hmhg0DB+6PJyr1dAA6bi
	rj56BrX5TlHVCMoCcvI9IG0SWVloGA7jq2F2M3NkDS0yFa0nTp/C/RipPILV+FztKB6mKbad20O
	FUfJkP0u6bXxVmUnNaf55MfG7fWQsIooS43K8J6xDdRgpRjM7NUi+mprGe8fWA/tQ==
X-Google-Smtp-Source: AGHT+IGoeeJoIHfFKB8IHGMMHXOwW3xF5w1b+OPf6OpYRt5GQUeN2r72qeeit1SjjCo03L5SijScYg==
X-Received: by 2002:a17:902:cecc:b0:216:1367:7e48 with SMTP id d9443c01a7336-21613951f65mr187686175ad.0.1733731170459;
        Sun, 08 Dec 2024 23:59:30 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628b6588csm36508025ad.235.2024.12.08.23.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:59:30 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/3] Apple DWI backlight driver
Date: Mon,  9 Dec 2024 15:58:32 +0800
Message-ID: <20241209075908.140014-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches the backlight controller is connected via this interface.
This series adds a backlight driver for backlight controllers connected
this way.

Changes since v2:
- Add missing includes in driver
- Fix file path in MAINTAINERS

v2: https://lore.kernel.org/asahi/20241207130433.30351-1-towinchenmi@gmail.com/T

Changes since v1:
- Fixed dt-bindings $id.
- Make power-domains an optional property in dt-bindings.
- Added missing error checking after devm_ioremap_resource() in
dwi_bl_probe().

v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail.com/T

Nick Chan
---
Nick Chan (3):
  dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI
    backlight
  backlight: dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  54 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/dwi_bl.c              | 126 ++++++++++++++++++
 5 files changed, 195 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/dwi_bl.c


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.47.1

