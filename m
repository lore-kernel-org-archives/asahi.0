Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FEF182A3
	for <asahi@lists.linux.dev>; Mon, 30 Oct 2023 14:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5842a94feb2so2987048eaf.0
        for <asahi@lists.linux.dev>; Mon, 30 Oct 2023 07:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698676043; x=1699280843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bqGE+grehw3xbV0zDjPAo9aiOxbRmWUNIDFRm/VPJr4=;
        b=fIF0X+/7K7aSzEhft9JZcObR6dqz6SOtmahIjfUYb75cqd2u1mNKASIWmGDlVxHCRz
         3fSuCbAZD0lRGZ1awtfjkjIcKvDeKZT4+orthjFGfi5Zf1gPY38gkpbbnuUJLmxU8X80
         nAeFkqLh3rq/H9fzip+xgrWQ+YcYxNHdFzIt1z08UzXKx9JTZMxW1VkOjOrBMHRllhrs
         uUGSeyZc7ZI6CXlzUMEoVup/SPI4O9vn6Mq9I4q/jhuzXklY/4lgSJaEn/RkkzhRiXx7
         lFsSd2dLMcTDJdo8qlVTNqPH4hUPMpwcJMNW8AVBDUEZqmYTMq1AZHosY17VzY2fh4iI
         b7GA==
X-Gm-Message-State: AOJu0Yzy+PgH3rCye5fd2mwJTWVSG3fgH3nsbPz3qmJFdv4GEnZs+ERv
	+cooxINkqAqfjQJ7PW7Iiw==
X-Google-Smtp-Source: AGHT+IE7d3qTe9TNfkTKRFaPOQ39ZwkuT78GxUML3FSSbwJlzlCcjSZP7s6lwOkd/N4/eLj9LKppqw==
X-Received: by 2002:a05:6870:815:b0:1e9:9c39:a580 with SMTP id fw21-20020a056870081500b001e99c39a580mr11847037oab.7.1698676043410;
        Mon, 30 Oct 2023 07:27:23 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q5-20020a9d6305000000b006ce32816a35sm1445877otk.81.2023.10.30.07.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 07:27:22 -0700 (PDT)
Received: (nullmailer pid 822774 invoked by uid 1000);
	Mon, 30 Oct 2023 14:27:21 -0000
From: Rob Herring <robh@kernel.org>
To: soc@kernel.org, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] soc: apple: mailbox: Add explicit include of platform_device.h
Date: Mon, 30 Oct 2023 09:26:21 -0500
Message-ID: <20231030142620.818663-2-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other and pull in various other headers. In
preparation to fix this, adjust the includes for what is actually needed.

platform_device.h is implicitly included by of_platform.h, but that's going
to be removed.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Note this was added in the merge window and missed the last round.

Arnd, Can you apply this directly.

---
 drivers/soc/apple/mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/apple/mailbox.c b/drivers/soc/apple/mailbox.c
index 0cbd172f435e..780199bf351e 100644
--- a/drivers/soc/apple/mailbox.c
+++ b/drivers/soc/apple/mailbox.c
@@ -26,6 +26,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
-- 
2.42.0

