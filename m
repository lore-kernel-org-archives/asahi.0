Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C3346BC
	for <asahi@lists.linux.dev>; Tue,  6 Sep 2022 13:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hJ3kLGkWuUBRmwOZ2cL0NRg2eHh7ETiNBBItZCgbIJM=; b=Sz3kuqigiSGDcjuCtnvwreNrvo
	D0BzxepT8Bhy/9g4Y4WHlnt3LBfcvU4eplSpOJW+b9itH5DHWqpbSlpp9V0rXR1u8pkX4PE7fVu6f
	htItWqkTGHa7em6gpXPNP+BUFFG60fKciXZT5gu4rSCCvZCxw+0p3K5svlsS07plHwQFMGa32GtK8
	vMY14VMnUnKZ1DTHi5if0IjR4C2GYBq1MdeyZ7k4UiqyAO0xg25RDKJ5KZ84dFXXk3wAEVpcNOVh+
	eyRkdNx79oKTB0Fmg7xHzbluz5u2Y8dJzaUkNRS8qYKB9ioGRrLuiv4c6uEMg6Sq+XzvMukQbv7tW
	o4gzoXlQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53694 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oVYUO-0003rN-3D; Tue, 06 Sep 2022 14:19:40 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oVYUN-005CmM-Dn; Tue, 06 Sep 2022 14:19:39 +0100
In-Reply-To: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: Arnd Bergmann <arnd@arndb.de>,
	 Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	asahi@lists.linux.dev,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	devicetree@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sven Peter <sven@svenpeter.dev>
Subject: [PATCH 3/7] soc: apple: rtkit: Add apple_rtkit_poll
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oVYUN-005CmM-Dn@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 06 Sep 2022 14:19:39 +0100

From: Hector Martin <marcan@marcan.st>

This allows a client to receive messages in atomic context, by polling.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Sven Peter <sven@svenpeter.dev>
Reviewed-by: Eric Curtin <ecurtin@redhat.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/soc/apple/rtkit.c       |  6 ++++++
 include/linux/soc/apple/rtkit.h | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index cf1129e9f76b..031ec4aa06d5 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -660,6 +660,12 @@ int apple_rtkit_send_message_wait(struct apple_rtkit *rtk, u8 ep, u64 message,
 }
 EXPORT_SYMBOL_GPL(apple_rtkit_send_message_wait);
 
+int apple_rtkit_poll(struct apple_rtkit *rtk)
+{
+	return mbox_client_peek_data(rtk->mbox_chan);
+}
+EXPORT_SYMBOL_GPL(apple_rtkit_poll);
+
 int apple_rtkit_start_ep(struct apple_rtkit *rtk, u8 endpoint)
 {
 	u64 msg;
diff --git a/include/linux/soc/apple/rtkit.h b/include/linux/soc/apple/rtkit.h
index 88eb832eac7b..c9cabb679cd1 100644
--- a/include/linux/soc/apple/rtkit.h
+++ b/include/linux/soc/apple/rtkit.h
@@ -152,4 +152,16 @@ int apple_rtkit_send_message(struct apple_rtkit *rtk, u8 ep, u64 message,
 int apple_rtkit_send_message_wait(struct apple_rtkit *rtk, u8 ep, u64 message,
 				  unsigned long timeout, bool atomic);
 
+/*
+ * Process incoming messages in atomic context.
+ * This only guarantees that messages arrive as far as the recv_message_early
+ * callback; drivers expecting to handle incoming messages synchronously
+ * by calling this function must do it that way.
+ * Will return 1 if some data was processed, 0 if none was, or a
+ * negative error code on failure.
+ *
+ * @rtk:            RTKit reference
+ */
+int apple_rtkit_poll(struct apple_rtkit *rtk);
+
 #endif /* _LINUX_APPLE_RTKIT_H_ */
-- 
2.30.2

