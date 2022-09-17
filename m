Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A201378
	for <asahi@lists.linux.dev>; Sat, 17 Sep 2022 11:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z+fB5SPcFjMR7iYgrUHV2c+121PKrzMKu1aCLDiAVzM=; b=gNsOLgpQPnRjmztFT4C4p+Z+6H
	WM+BpsCQb9auqhK64XiWQSMHtEKhIQAUK0re9YP86bDSpuRtDpXdElk/Dq6Bx4NmLyxZdd/ymdiqn
	m7N8fdwnid8j4qZA+tja0TWuWM5QcQ6JV9bk0EiA+hKz80W8aUgwx8ZrmFgcatrLb0TrD6027pYe0
	qE6KYNFn14OIbFgHCubf0nYPxXRQvQB2zxox7+Qxg0+TZUMuXMVRGTfiEXocT4Maf2EYqOMs069Zr
	SEBluPk28099J18DaH252dWT6zEedgF1r+IU2YtSfYT3dgbJtL7vaRJl7rnZnBCOE+7X5SFX2eMjm
	gfGJg3Ag==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34378)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oZWHG-0007hw-OD; Sat, 17 Sep 2022 12:46:30 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oZWHF-0004U8-Au; Sat, 17 Sep 2022 12:46:29 +0100
Date: Sat, 17 Sep 2022 12:46:29 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sven Peter <sven@svenpeter.dev>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] apple rtkit: add support for atomic operations
Message-ID: <YyWzlUnJds0Y1igM@shell.armlinux.org.uk>
References: <YyGR+z5nGPh66LdY@shell.armlinux.org.uk>
 <19191d4d-e8a8-4319-bf7b-d5301a792a21@www.fastmail.com>
 <YyWtz4u5fcxQAB4R@shell.armlinux.org.uk>
 <b601263b-8363-432a-b6d7-504fabd37fef@www.fastmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b601263b-8363-432a-b6d7-504fabd37fef@www.fastmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sat, Sep 17, 2022 at 01:33:45PM +0200, Sven Peter wrote:
> > On Sat, Sep 17, 2022 at 12:42:30PM +0200, Sven Peter wrote:
> >> Hi,
> >> 
> >> On Wed, Sep 14, 2022, at 10:34, Russell King (Oracle) wrote:
> >> > Hi,
> >> >
> >> > This series adds support to the Apple rtkit for atomic messaging,
> >> > which will be necessary for SMC support on these platforms.
> >> >
> >> > SMC support requires a bit of rework after recent review comments,
> >> > so I'm sending this separately in the hope that we can move forward
> >> > with upstream kernels.
> >> 
> >> Maybe I misremember or maybe you forgot to pick up my reviewed-by tags
> >> for the mailbox commits.
> >
> > It's the first time I've sent the mailbox commits after Hector
> > mentioned them.
> 
> There are just too many things in flight right now which is part of the
> reason I'm happy you're trying to get all this upstream!
> 
> https://lore.kernel.org/asahi/YxYoW2IZFK%2FJdKgH@shell.armlinux.org.uk/

Hmm, I'd completely forgotten that I've posted it previously! Hmm,
no response from Jassi on the previous posting despite nothing no
action being required on the patches. Jassi?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
