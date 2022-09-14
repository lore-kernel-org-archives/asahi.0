Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCAE7F
	for <asahi@lists.linux.dev>; Wed, 14 Sep 2022 08:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3W12ilxYRX5oqeaNvlx1LgPZaFSFChK3uMek02KRiv0=; b=JKyV8PyIjFhD6Rpl19WgL+j9tZ
	+6eY4dM41A9DXR6V2LJFC3Gb/iwWIrpRBbDuggdtCGBLThr26d5H2fS//EmGid5Iv70B0I+0ps2Mp
	Cg+ihRqFA0/BiYQatb0LgmYPNAkaDObcfkhI2WmMYy3yG7z+GnCoyjVdYXwRcZ9mbpBcin5kqUcKo
	eDe3NpXoOb74pfWrY0UI9PWWilOWDr/FrYpiiX8pIuQP3hb4DoZHTeRDlRZmDNSBoK0cZIGZwWxoo
	jRB4p+QgM0E+zINJaR6eTW4AAL2jWkq41M9c+e5xQRhXEyOWZECw26QUEKHf09uwYrVDWb3eljWhP
	j3MTvohQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34312)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oYNqP-000411-Vk; Wed, 14 Sep 2022 09:34:06 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oYNqN-0001Ui-Ja; Wed, 14 Sep 2022 09:34:03 +0100
Date: Wed, 14 Sep 2022 09:34:03 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	linux-arm-kernel@lists.infradead.org,
	Sven Peter <sven@svenpeter.dev>
Subject: [PATCH 0/3] apple rtkit: add support for atomic operations
Message-ID: <YyGR+z5nGPh66LdY@shell.armlinux.org.uk>
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

This series adds support to the Apple rtkit for atomic messaging,
which will be necessary for SMC support on these platforms.

SMC support requires a bit of rework after recent review comments,
so I'm sending this separately in the hope that we can move forward
with upstream kernels.

 drivers/mailbox/apple-mailbox.c | 63 +++++++++++++++++++++++++++++++++++++++--
 drivers/soc/apple/rtkit.c       |  6 ++++
 include/linux/soc/apple/rtkit.h | 12 ++++++++
 3 files changed, 78 insertions(+), 3 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
