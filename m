Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6943E7F
	for <asahi@lists.linux.dev>; Wed, 14 Sep 2022 08:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2A9W3KIj4dy7Rsl/+6NnkPC5sAB5QaCHKe7/0WesQPk=; b=AKHSSAHIOVFqiScCTou+tmCylo
	YcqI4mpYdFH1VTQACGNrJFwFlNtLG8uifLE7eAk+QbOSIYu0oTvTNQlQHJKHUwdIlHfzUSywJ3GFG
	1q7+JiUYtAekfWTVX3BbTnWbTyrc0wqQsztx4zoOJG1Bwfu2sbdOBE4UXirkACzYragzTZRasXVbw
	JRKaRPtCXu4u5nkEWnEJMwIffE9efILWNG7w7BpnE55V1v/WWoBZ179Qr0I0yk0ZHS5xGBenwBZMA
	vwms75e2ISavcXb1zjXSRaTzYKxDIiOFgNH+t8pfwnDAK+rtiFvom7Sa59/mAL3Tu0MtJcSwRLaWm
	x2DIYKNA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41294 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oYNqq-00041a-4x; Wed, 14 Sep 2022 09:34:32 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oYNqp-006lXn-Hu; Wed, 14 Sep 2022 09:34:31 +0100
In-Reply-To: <YyGR+z5nGPh66LdY@shell.armlinux.org.uk>
References: <YyGR+z5nGPh66LdY@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] soc: apple: rtkit: Add apple_rtkit_poll
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oYNqp-006lXn-Hu@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 14 Sep 2022 09:34:31 +0100

From: Hector Martin <marcan@marcan.st>

This allows a client to receive messages in atomic context, by polling.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Sven Peter <sven@svenpeter.dev>
Reviewed-by: Eric Curtin <ecurtin@redhat.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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

