Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9593C02
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 16:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sRpUpeTClwui724LIejDAoaxj6vPaGHswiJTFFiFISU=; b=MQIxAeEjDpTaYeHdVTOw+ldp8/
	gAapEvZ25TboVLTwIxDj708DHmhvn0W6VuYSsJbmKplcI6bzTqNAq5WTQPMDwK54LRtd/6lr4zYsT
	dpf/WlCBGQJkpwpOfPmKpUKPRcPZFGRnFXz08zQny7pXf2nxfWNPG3iQX1SbkcRRxbdMvhTgSy32R
	FXYXK8l3/NPcRXrR9/v6YVEpnpzmsJ8MPGnFmyKSoRAbc4s45BTtR/NXVPfQ47y59EFOH7aKq2HR0
	vBWnqB4R2JeMJydcJK8MdHuG/jX0foLKvoVT0YpHWcCxFfb+JRW/13Ckxy8ARXiBuTW9tf4+YmkPi
	oAbrdGlA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34128)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oVFGv-0002fY-GW; Mon, 05 Sep 2022 17:48:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oVFGt-0007Rt-RY; Mon, 05 Sep 2022 17:48:27 +0100
Date: Mon, 5 Sep 2022 17:48:27 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	linux-arm-kernel@lists.infradead.org,
	Sven Peter <sven@svenpeter.dev>
Subject: [PATCH 0/2] apple-mailbox: add support for atomc mailbox operations
Message-ID: <YxYoW2IZFK/JdKgH@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Hi,

This series adds support for atomic mailbox operations to the Apple
mailbox driver.

 drivers/mailbox/apple-mailbox.c | 64 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 3 deletions(-)
-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
