Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425FE7F
	for <asahi@lists.linux.dev>; Wed, 14 Sep 2022 08:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yxYHJEKWju2FWfkWYdnU8GUlZH4F6NTux4QJGTRlF9k=; b=llp+ZZ+HHB5qkDhofuaHnIY63T
	0bkG67sFAQxEZpSmaWds54SdLV11giZUPJr3qE/Qv/O7EP2Utppw0d8+zmKx7XgFSiExw4IPK/E+y
	Uu76wSnrE/CMJIlAioooWkf7x8uRoAouKEbL+B74IWXTyvstf8cFGSmCNUfrkOHOinT6ZECoZDxsz
	pVzBW3O9+FE8wEyeB54FpVmtztUC9gc0+NVlQruGcgk4f3BN7UX+mnLi9aFks8P+XNWUF6NPXWynI
	84IpwhjdrEd8IorXWfW4DKRgSqoXMkwbLT6wnmdd6akTYF/ptL+zAmMMv0WwDP+fkuL5QU9XXttTd
	IigtZBag==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51924 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oYNql-00041O-0p; Wed, 14 Sep 2022 09:34:27 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oYNqk-006lXh-Bu; Wed, 14 Sep 2022 09:34:26 +0100
In-Reply-To: <YyGR+z5nGPh66LdY@shell.armlinux.org.uk>
References: <YyGR+z5nGPh66LdY@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] mailbox: apple: Implement poll_data() operation
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oYNqk-006lXh-Bu@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 14 Sep 2022 09:34:26 +0100

From: Hector Martin <marcan@marcan.st>

This allows clients running in atomic context to poll for messages to
arrive.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/mailbox/apple-mailbox.c | 36 ++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/apple-mailbox.c b/drivers/mailbox/apple-mailbox.c
index 33e7acf71e3e..2a3e8d8ff8b5 100644
--- a/drivers/mailbox/apple-mailbox.c
+++ b/drivers/mailbox/apple-mailbox.c
@@ -26,6 +26,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 
 #define APPLE_ASC_MBOX_CONTROL_FULL  BIT(16)
@@ -101,6 +102,7 @@ struct apple_mbox {
 
 	struct device *dev;
 	struct mbox_controller controller;
+	spinlock_t rx_lock;
 };
 
 static const struct of_device_id apple_mbox_of_match[];
@@ -204,13 +206,15 @@ static irqreturn_t apple_mbox_send_empty_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t apple_mbox_recv_irq(int irq, void *data)
+static int apple_mbox_poll(struct apple_mbox *apple_mbox)
 {
-	struct apple_mbox *apple_mbox = data;
 	struct apple_mbox_msg msg;
+	int ret = 0;
 
-	while (apple_mbox_hw_recv(apple_mbox, &msg) == 0)
+	while (apple_mbox_hw_recv(apple_mbox, &msg) == 0) {
 		mbox_chan_received_data(&apple_mbox->chan, (void *)&msg);
+		ret++;
+	}
 
 	/*
 	 * The interrupt will keep firing even if there are no more messages
@@ -225,9 +229,33 @@ static irqreturn_t apple_mbox_recv_irq(int irq, void *data)
 			       apple_mbox->regs + apple_mbox->hw->irq_ack);
 	}
 
+	return ret;
+}
+
+static irqreturn_t apple_mbox_recv_irq(int irq, void *data)
+{
+	struct apple_mbox *apple_mbox = data;
+
+	spin_lock(&apple_mbox->rx_lock);
+	apple_mbox_poll(apple_mbox);
+	spin_unlock(&apple_mbox->rx_lock);
+
 	return IRQ_HANDLED;
 }
 
+static bool apple_mbox_chan_peek_data(struct mbox_chan *chan)
+{
+	struct apple_mbox *apple_mbox = chan->con_priv;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&apple_mbox->rx_lock, flags);
+	ret = apple_mbox_poll(apple_mbox);
+	spin_unlock_irqrestore(&apple_mbox->rx_lock, flags);
+
+	return ret > 0;
+}
+
 static int apple_mbox_chan_flush(struct mbox_chan *chan, unsigned long timeout)
 {
 	struct apple_mbox *apple_mbox = chan->con_priv;
@@ -276,6 +304,7 @@ static void apple_mbox_chan_shutdown(struct mbox_chan *chan)
 
 static const struct mbox_chan_ops apple_mbox_ops = {
 	.send_data = apple_mbox_chan_send_data,
+	.peek_data = apple_mbox_chan_peek_data,
 	.flush = apple_mbox_chan_flush,
 	.startup = apple_mbox_chan_startup,
 	.shutdown = apple_mbox_chan_shutdown,
@@ -331,6 +360,7 @@ static int apple_mbox_probe(struct platform_device *pdev)
 	mbox->controller.txdone_irq = true;
 	mbox->controller.of_xlate = apple_mbox_of_xlate;
 	mbox->chan.con_priv = mbox;
+	spin_lock_init(&mbox->rx_lock);
 
 	irqname = devm_kasprintf(dev, GFP_KERNEL, "%s-recv", dev_name(dev));
 	if (!irqname)
-- 
2.30.2

