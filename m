Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A2F7E
	for <asahi@lists.linux.dev>; Tue,  6 Sep 2022 07:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lLXhTMvjqFFLOX0a6T90Zams+r/sSjtpu4H/nZBakYs=; b=oCINmkxAjl/nzza1v/DJ4U4BvX
	Fl3q+7uY05Zms4N2oXFzeSLhtW+ZRo4ZRlMh4b+KcteXGCTKB8xd/+NJq/uCZpHMRNbE3si+JcwyR
	NyzsUI/UJ0ICFYXw5a6mG9PSgKwPHMqVeVCs4N1c2Mjt4UO/PwWzFpMkQmChc8tgBqyO70xGRBGe6
	howisr2hDJtidTInx248n/PDcO2KWUJeyIEJBijweEVLsdDTUZ00OjFZK6sjg6xFtmFIX3ohqGOKH
	oFOH6Dg1J1Z00SP8U/HRx0Tkw5dCR4h/rehOElnsgcMOeV2eEWpeWGMsNDJ1Ys3b5V3f/GIFdY6KS
	lMtaPBRQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34140)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oVTTX-0003a3-6a; Tue, 06 Sep 2022 08:58:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oVTTV-00086j-Fp; Tue, 06 Sep 2022 08:58:25 +0100
Date: Tue, 6 Sep 2022 08:58:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sven Peter <sven@svenpeter.dev>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Hector Martin <marcan@marcan.st>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] mailbox: apple: Implement poll_data() operation
Message-ID: <Yxb9oRcbz6qTddr+@shell.armlinux.org.uk>
References: <YxYoW2IZFK/JdKgH@shell.armlinux.org.uk>
 <E1oVFHL-004pug-JP@rmk-PC.armlinux.org.uk>
 <aea7b62d-9cc1-4590-9d6b-9419b5af62a2@www.fastmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aea7b62d-9cc1-4590-9d6b-9419b5af62a2@www.fastmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Sep 05, 2022 at 07:03:39PM +0200, Sven Peter wrote:
> 
> 
> On Mon, Sep 5, 2022, at 18:48, Russell King wrote:
> > From: Hector Martin <marcan@marcan.st>
> >
> > This allows clients running in atomic context to poll for messages to
> > arrive.
> >
> > Signed-off-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Reviewed-by: Sven Peter <sven@svenpeter.dev>
> 
> with one small comment below:
> 
> > ---
> >  drivers/mailbox/apple-mailbox.c | 37 ++++++++++++++++++++++++++++++---
> >  1 file changed, 34 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/mailbox/apple-mailbox.c b/drivers/mailbox/apple-mailbox.c
> > index 33e7acf71e3e..1c14ff63f3d3 100644
> > --- a/drivers/mailbox/apple-mailbox.c
> > +++ b/drivers/mailbox/apple-mailbox.c
> > @@ -26,6 +26,7 @@
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/spinlock.h>
> >  #include <linux/types.h>
> > 
> >  #define APPLE_ASC_MBOX_CONTROL_FULL  BIT(16)
> > @@ -101,6 +102,7 @@ struct apple_mbox {
> > 
> >  	struct device *dev;
> >  	struct mbox_controller controller;
> > +	spinlock_t rx_lock;
> >  };
> > 
> >  static const struct of_device_id apple_mbox_of_match[];
> > @@ -204,13 +206,16 @@ static irqreturn_t apple_mbox_send_empty_irq(int 
> > irq, void *data)
> >  	return IRQ_HANDLED;
> >  }
> > 
> > -static irqreturn_t apple_mbox_recv_irq(int irq, void *data)
> > +static int apple_mbox_poll(struct apple_mbox *apple_mbox)
> >  {
> > -	struct apple_mbox *apple_mbox = data;
> > +
> 
> small nit: there's a spurious white line here

Thanks, well spotted. Will fix.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
