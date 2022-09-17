Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C70B1378
	for <asahi@lists.linux.dev>; Sat, 17 Sep 2022 11:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=d0vZLrwUx+iXcTh2m2nDJabIHtGdWf25vyT9nVB6hBs=; b=G2xuteUgz9d49f6Of+fdYOZP6U
	uLTc9ACj9mPEaSHAeK76Kl3PQow/YIg0B0frdNKRPhlwLF/xeurL2bLJdAxfEZA7Fs3Uhloy2wU2I
	d0SqU6Bpp2U8hr/bbhiQt8kMvN/dghSQ9wSDs3By805zSFd9IXhqXJeLh5FwPcU6FDnsrP2xw7hSg
	B1ovbRknIm2bD+dmmZ2uFhXNXuKFwFS+PzACtgv5Q+7d/no5KU9Kl3KFeAZOT67jbyCgkH8IS9XC+
	H5KDepZb92RzUWk77uswQ68E8yplmYf7oUGWekHrXB6iIN1uEPVxJoChRlbYfI9zmrEzQpLt50alD
	4QpgG2Zw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34374)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oZVtT-0007h3-5F; Sat, 17 Sep 2022 12:21:55 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oZVtP-0004Sw-52; Sat, 17 Sep 2022 12:21:51 +0100
Date: Sat, 17 Sep 2022 12:21:51 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sven Peter <sven@svenpeter.dev>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] apple rtkit: add support for atomic operations
Message-ID: <YyWtz4u5fcxQAB4R@shell.armlinux.org.uk>
References: <YyGR+z5nGPh66LdY@shell.armlinux.org.uk>
 <19191d4d-e8a8-4319-bf7b-d5301a792a21@www.fastmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19191d4d-e8a8-4319-bf7b-d5301a792a21@www.fastmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sat, Sep 17, 2022 at 12:42:30PM +0200, Sven Peter wrote:
> Hi,
> 
> On Wed, Sep 14, 2022, at 10:34, Russell King (Oracle) wrote:
> > Hi,
> >
> > This series adds support to the Apple rtkit for atomic messaging,
> > which will be necessary for SMC support on these platforms.
> >
> > SMC support requires a bit of rework after recent review comments,
> > so I'm sending this separately in the hope that we can move forward
> > with upstream kernels.
> 
> Maybe I misremember or maybe you forgot to pick up my reviewed-by tags
> for the mailbox commits.

It's the first time I've sent the mailbox commits after Hector
mentioned them.

> Either way, for the entire series:
> 
> Reviewed-by: Sven Peter <sven@svenpeter.dev>
> 
> 
> We'd usually take the last soc/rtkit commit through the Asahi platform and then the
> soc tree. Taking it through the mailbox tree will make things more complicated
> if SMC (which is the only driver that uses the poll API and hard depends on it) is
> also ready for this merge window. I don't think that's very likely so taking it
> through mailbox is also fine.

I'm sending these seperately because I don't think the platform/mfd
issues will be sorted before the merge window. We've fallen into the
trap where I have a load of updates to the patches in my git tree
that aren't in the Asahi tree, but Lee wants some substantial changes
to the way the MFD part is handled which I think Hector needs to do.
So somehow I need to get my changes back to Hector (I don't do github)
which basically means digging out the original patches from the Asahi
kernel tree and supplying diffs to Hector for those - along with all
the acks/reviewed-bys etc. This *really* isn't nice.

I didn't follow that discussion very well - with about 130 messages
in total in that thread, it just became too much for me to keep track
of, as I explained as the discussion drew to a close. That was the
whole reason for me sending v2, which essentially mostly got ignored
and discussion continued on v1.

So, basically, trying to get these patches into mainline has created
a hell of a lot of extra work and difficulty - and at this point I'm
wondering whether it really is a good idea to continue with this.

It's fine if the comments are all minor issues that can be quickly
resolved, but a major restructuring is a completely different matter.

So, to at least get some progress, I decided to send what would be
possible to hopefully merge during the remainder of this window.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
