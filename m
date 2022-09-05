Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1843C02
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 17:05:27 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id BBDCC5C015A;
	Mon,  5 Sep 2022 13:05:26 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute2.internal (MEProxy); Mon, 05 Sep 2022 13:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1662397526; x=1662483926; bh=5E
	mDhbcz2GkIAaDUST6hLFso+iN6losMgzio9GObyew=; b=1IV5R79i2i/A8SvCja
	pdnPux+5Lqq2RGskqUMO2mRM+zI2Z3AMPP33HvqNqwDQVmWe9tncWNBfygwdTbmv
	MhqjgaJG05baQionlEKn0wPTM0YODGvfr0juNzNl+6P309LihTSLT9zhTq1fqvRN
	mOQ76cOfhPcqq7PIwfRXy1zErExW5RTLt+HzwqKFvkMcT0840Z0xjvRbFzo2V3IN
	NJFG7lrxwPHCgQOBjKLoWZbHAcKy7hfkzkqg/wvika2TINwiikn0wBuubZqXOwQI
	Sl5c45DdTkQjLLfR4mejBnFLMnSU8Av1YYuPYJi3IuzvbRKZb2ZccvLIy9qWp0WS
	5SpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1662397526; x=1662483926; bh=5EmDhbcz2GkIAaDUST6hLFso+iN6
	losMgzio9GObyew=; b=kAeN33/7Mcr+DJ5rccv0/1x3WiymHc09kExuA/hEEqsr
	y4ji/KVJysqcYI1LUCzFtav9R1MTzg+1UXt7INeCT0PYXiK39hoXM0C9dbO7zPom
	MHLFKT99aTzrirmo2EOxKiTnUPckcQX97+z4/zFttgoPvhdtGKIYbhqizwlCuX72
	Gt5/tSrbP3Jx/nHhMtpVW5snACF6XahVA00x1tkOmRsOSWM5ZkSD3bg90YVaXpZb
	tJlWBgZngrcb1E5QFZ1T8wEQ8GLNv4nNXadKyH/xrE906OjJmvzMroF0UpPCP2G+
	OMs7/lZslUwCImDCwnmU/6Lhet7cdX3CUVhl3ZKMZg==
X-ME-Sender: <xms:ViwWY9tG2i9qg5b0fzXro2u9yNPQPBX-Vw6nLD84F0jGBomZbXL-ww>
    <xme:ViwWY2cJc__cvwQ_JmhM8gXWXxI_1NOHhDJzTylsBBIrVXslcEwbheuxBvh9oXvlX
    PdevFtOsz3_zZQ9Mzo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeliedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfu
    vhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtf
    frrghtthgvrhhnpeelvefggeffheevtdeivefhkeehfeettdejteduveeiheevveeilefg
    hfeiveeiueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:ViwWYwzjwRKrqmnCYXNodHUYQLGwlwkQYIRwcgMHW17N-wR6fqoM-g>
    <xmx:ViwWY0PgfSpKbIA17AHDDOfwJnb9U1Ojw9UDPpKZRVikQvprXfPHnA>
    <xmx:ViwWY99yHEMj6nlXGWOhiFFk1DzDZ7CUQJ9TJxK0L7t4uYa7ICHd0g>
    <xmx:ViwWY4YIlelFbtxfUkvvHS1PDh10svFq7TYIU7y4_sjGDc5u0LGMiQ>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 75EEEA6007C; Mon,  5 Sep 2022 13:05:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <aea7b62d-9cc1-4590-9d6b-9419b5af62a2@www.fastmail.com>
In-Reply-To: <E1oVFHL-004pug-JP@rmk-PC.armlinux.org.uk>
References: <YxYoW2IZFK/JdKgH@shell.armlinux.org.uk>
 <E1oVFHL-004pug-JP@rmk-PC.armlinux.org.uk>
Date: Mon, 05 Sep 2022 19:03:39 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Jassi Brar" <jassisinghbrar@gmail.com>
Cc: "Hector Martin" <marcan@marcan.st>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] mailbox: apple: Implement poll_data() operation
Content-Type: text/plain



On Mon, Sep 5, 2022, at 18:48, Russell King wrote:
> From: Hector Martin <marcan@marcan.st>
>
> This allows clients running in atomic context to poll for messages to
> arrive.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Sven Peter <sven@svenpeter.dev>

with one small comment below:

> ---
>  drivers/mailbox/apple-mailbox.c | 37 ++++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mailbox/apple-mailbox.c b/drivers/mailbox/apple-mailbox.c
> index 33e7acf71e3e..1c14ff63f3d3 100644
> --- a/drivers/mailbox/apple-mailbox.c
> +++ b/drivers/mailbox/apple-mailbox.c
> @@ -26,6 +26,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/spinlock.h>
>  #include <linux/types.h>
> 
>  #define APPLE_ASC_MBOX_CONTROL_FULL  BIT(16)
> @@ -101,6 +102,7 @@ struct apple_mbox {
> 
>  	struct device *dev;
>  	struct mbox_controller controller;
> +	spinlock_t rx_lock;
>  };
> 
>  static const struct of_device_id apple_mbox_of_match[];
> @@ -204,13 +206,16 @@ static irqreturn_t apple_mbox_send_empty_irq(int 
> irq, void *data)
>  	return IRQ_HANDLED;
>  }
> 
> -static irqreturn_t apple_mbox_recv_irq(int irq, void *data)
> +static int apple_mbox_poll(struct apple_mbox *apple_mbox)
>  {
> -	struct apple_mbox *apple_mbox = data;
> +

small nit: there's a spurious white line here

>  	struct apple_mbox_msg msg;
> +	int ret = 0;
> 
> -	while (apple_mbox_hw_recv(apple_mbox, &msg) == 0)
> +	while (apple_mbox_hw_recv(apple_mbox, &msg) == 0) {
>  		mbox_chan_received_data(&apple_mbox->chan, (void *)&msg);
> +		ret++;
> +	}
> 
>  	/*
>  	 * The interrupt will keep firing even if there are no more messages
> @@ -225,9 +230,33 @@ static irqreturn_t apple_mbox_recv_irq(int irq, void *data)
>  			       apple_mbox->regs + apple_mbox->hw->irq_ack);
>  	}
> 
> +	return ret;
> +}
> +
> +static irqreturn_t apple_mbox_recv_irq(int irq, void *data)
> +{
> +	struct apple_mbox *apple_mbox = data;
> +
> +	spin_lock(&apple_mbox->rx_lock);
> +	apple_mbox_poll(apple_mbox);
> +	spin_unlock(&apple_mbox->rx_lock);
> +
>  	return IRQ_HANDLED;
>  }
> 
> +static bool apple_mbox_chan_peek_data(struct mbox_chan *chan)
> +{
> +	struct apple_mbox *apple_mbox = chan->con_priv;
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&apple_mbox->rx_lock, flags);
> +	ret = apple_mbox_poll(apple_mbox);
> +	spin_unlock_irqrestore(&apple_mbox->rx_lock, flags);
> +
> +	return ret > 0;
> +}
> +
>  static int apple_mbox_chan_flush(struct mbox_chan *chan, unsigned long timeout)
>  {
>  	struct apple_mbox *apple_mbox = chan->con_priv;
> @@ -276,6 +305,7 @@ static void apple_mbox_chan_shutdown(struct mbox_chan *chan)
> 
>  static const struct mbox_chan_ops apple_mbox_ops = {
>  	.send_data = apple_mbox_chan_send_data,
> +	.peek_data = apple_mbox_chan_peek_data,
>  	.flush = apple_mbox_chan_flush,
>  	.startup = apple_mbox_chan_startup,
>  	.shutdown = apple_mbox_chan_shutdown,
> @@ -331,6 +361,7 @@ static int apple_mbox_probe(struct platform_device *pdev)
>  	mbox->controller.txdone_irq = true;
>  	mbox->controller.of_xlate = apple_mbox_of_xlate;
>  	mbox->chan.con_priv = mbox;
> +	spin_lock_init(&mbox->rx_lock);
> 
>  	irqname = devm_kasprintf(dev, GFP_KERNEL, "%s-recv", dev_name(dev));
>  	if (!irqname)
> -- 
> 2.30.2
