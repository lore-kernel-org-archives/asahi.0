Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795893562;
	b=2r6RJalLii9GekOj+Of9FSf9/NJ1tPNqKOYCjqGYRzFATXXiuYehgnIm2eODD19cOw7K
	 K2Prp2PpJhNx6hIwWFlplHJdg1Y47mLZgzoDt1KgOoScXjXeAwj8ngcXcmxxZrakQ1zyH
	 Oq2ODQpuDI6l92lOQyjIVdVJzioXRiHgp3aKeE72NCVTpu5UOher7qWWYvCw/6I3OcjFI
	 /0wDrpAnRGdUpyW3d+5fcMh1LMpIPa1dfH5M+2WG946P01+uOfAvVVrq0gtpzoVnuElOc
	 VPTZg2n6Jm9U1dSl2rtm82NPvdxGkK6gT4h6AYvENRSm3MW7rDHA0AUI6d7jvzBOv6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795893562;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PIzyMX6aMrQdx67DAHkxTf1fE4iVqkfCvEeCSF97RmM=;
	b=Qw+1a5BLZeX0Hj8kR3EOzmP76HguHUsU2cokzswTzLo3voyhNXAC6+YXejNUnSNpK4gf
	 aHsQCSPVxrDLdrKQei8j59sVWhB6U6jNTsrurFU9Ua+HgHQ/zyRDZxntwBbl3S4KheyGx
	 I3CKQXiB6r+040lEBMHDbxhBXxnQ2xEnI5k+Pk+1D5uBDQluDE4CzWf2tVVrcVmLHL5QC
	 jYL6lslEC84LN/sqmbiy4luNFq2uavOK56Lj+BIFPjVOOzFAdjF8zbXe/TeMTpDicq16f
	 xBZh9zWKwFvE1W1f2pmScMkf4ulTDpN4HQG6ckQJVXidNTc8KrtQVNjqnhS2SdsOVPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=U0TbTFK6;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E33606A31C;
	Sat, 28 Nov 2026 19:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37E33606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=U0TbTFK6
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 04d41477-864c-4c31-b276-cb910cd9c497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795893552;
	bh=PIzyMX6aMrQdx67DAHkxTf1fE4iVqkfCvEeCSF97RmM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U0TbTFK6Bfd2HkDJ5AJ0t15GDfe5IaTL0gpw8I3nLDNWkAb9LCT8KCte43eDz1WB1
	 PrPUW7RgoMV++NzMaK4uV+faEgmCbKZ6cjodnxE5SUYMSfXu9Lnl/gU4qmPYmb+itS
	 8vXDyHqN9SwxV5wsGaNEnj11Esrj/33exjvIWeU5PLL0somklmdBYQ222mGAKmV1WS
	 kbVoQa4Qze0rjfDLsoZPvIfsgL5N3ssLvR/OniOZu9NywO8nhvNjaSqPPAyJR5TtbV
	 0TXEF4yonU3mq7ztEZLtFiqIW9FGA1iPeTIwckBzW6TFwcqTMOpauxpHA199ruRHlh
	 UbRjokK2qNyeA==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com,
	Soeren Coremans <sorencoremans@gmail.com>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: Re: [PATCH wireless-next v3 2/5] wifi: brcmfmac: pcie: skip the host ready doorbell at init on the BCM4364
Date: Sat, 28 Nov 2026 20:19:06 +0100
Message-ID: <20261128191906.37151-1-dev@deq.rocks>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127173549.29335-3-dev@deq.rocks>
References: <20261127173549.29335-1-dev@deq.rocks> <20261127173549.29335-3-dev@deq.rocks>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arend,

Turns out I made a mistake here and the BCM4355 backfired at me with a
halted firmware. Let's invert the logic and only ring the doorbell at
init on the BCM4377. Will send it with v4 after review of v3.

Andre
