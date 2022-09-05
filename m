Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4767F3C02
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 16:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fYbvAsoX5ORR8gqCBCZ25lwg7A4HT4p5SOBOQY57hjw=; b=vQ9BnNfreewFgOtEixqtm90CaJ
	2xXBoUX/Rgzfj/yPH517aisSiQWTohm88QhCKGz+15irqYNnKTNDppWo34G0YFIK18uyn3iV4hT6r
	PTZ+UNO6WYEK/NhFINfwvolOMrV+S6JyYg+b5sH60qYtegG0zOyaS/XfBSiXhRpYfa3Y70p2XLvcJ
	P92JqC+MOVhF8wFvssUKy1aYYcF7ElCsjzZfOAW5VZa4RFYlsGeNWVYfa6d/mMxVKgGStuHjEO9Ms
	61nxm8JU+B3Dx1R1ALSBzXgwAzdVsno9TBcdWKclM9XCYAS5yuPqBMQD2j0i9Mfktk2DU6XoYAOGC
	oH+X6jdQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48980 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oVFHH-0002fj-5K; Mon, 05 Sep 2022 17:48:51 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oVFHG-004pua-Dw; Mon, 05 Sep 2022 17:48:50 +0100
In-Reply-To: <YxYoW2IZFK/JdKgH@shell.armlinux.org.uk>
References: <YxYoW2IZFK/JdKgH@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] mailbox: apple: Implement flush() operation
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oVFHG-004pua-Dw@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 05 Sep 2022 17:48:50 +0100

From: Hector Martin <marcan@marcan.st>

This allows clients to use the atomic-safe mailbox API style.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/mailbox/apple-mailbox.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/mailbox/apple-mailbox.c b/drivers/mailbox/apple-mailbox.c
index 496c4951ccb1..33e7acf71e3e 100644
--- a/drivers/mailbox/apple-mailbox.c
+++ b/drivers/mailbox/apple-mailbox.c
@@ -17,6 +17,7 @@
  */
 
 #include <linux/apple-mailbox.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/gfp.h>
 #include <linux/interrupt.h>
@@ -112,6 +113,14 @@ static bool apple_mbox_hw_can_send(struct apple_mbox *apple_mbox)
 	return !(mbox_ctrl & apple_mbox->hw->control_full);
 }
 
+static bool apple_mbox_hw_send_empty(struct apple_mbox *apple_mbox)
+{
+	u32 mbox_ctrl =
+		readl_relaxed(apple_mbox->regs + apple_mbox->hw->a2i_control);
+
+	return mbox_ctrl & apple_mbox->hw->control_empty;
+}
+
 static int apple_mbox_hw_send(struct apple_mbox *apple_mbox,
 			      struct apple_mbox_msg *msg)
 {
@@ -219,6 +228,23 @@ static irqreturn_t apple_mbox_recv_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int apple_mbox_chan_flush(struct mbox_chan *chan, unsigned long timeout)
+{
+	struct apple_mbox *apple_mbox = chan->con_priv;
+	unsigned long deadline = jiffies + msecs_to_jiffies(timeout);
+
+	while (time_before(jiffies, deadline)) {
+		if (apple_mbox_hw_send_empty(apple_mbox)) {
+			mbox_chan_txdone(&apple_mbox->chan, 0);
+			return 0;
+		}
+
+		udelay(1);
+	}
+
+	return -ETIME;
+}
+
 static int apple_mbox_chan_startup(struct mbox_chan *chan)
 {
 	struct apple_mbox *apple_mbox = chan->con_priv;
@@ -250,6 +276,7 @@ static void apple_mbox_chan_shutdown(struct mbox_chan *chan)
 
 static const struct mbox_chan_ops apple_mbox_ops = {
 	.send_data = apple_mbox_chan_send_data,
+	.flush = apple_mbox_chan_flush,
 	.startup = apple_mbox_chan_startup,
 	.shutdown = apple_mbox_chan_shutdown,
 };
-- 
2.30.2

