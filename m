Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810847;
	b=Oa0Z+BqFK3DlcKh0l4yboVkTIAxl7uaDF9MctM099qh0a+Ulei3yxqetf1ujAcGW6vq1
	 rMmW+Nf0VCyz/LYBPaxp9u2S+6KLg3wx+mp8w3oWxqKjHfkh1ATY44lFyceQictjFQUix
	 nfuZ6/QsnN4AOm10tpr26tCaZ8qoS7OVH4L5+egv3e/iUb84g6fCybX+mxgr6vKo+vO7a
	 37VOr+GjiPC15PghraEf7jtRAEXfEOgmw8z1ysE85ednxw0hzUyPkHCNphbencavLuPbl
	 mWutPyhyPQhdVbJpZm+79ALEbU9xdiYB0P6x9XCw4yBp42NRDIgarLAZIoL7mI9/tSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810847;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=+Mmd9iz+6l+RtzunqHn07DyKAk1sZGUOJe891sWi+Nc=;
	b=QCE3fe5ksMbE/NapqXE/rNKgPwVM9Edd7LIfGre3WojxOAYG40xuKmtXMSlLDv89yYLB
	 gi7ILsLeeAotm/eT+MkKlcsNPnVgmJiRS6/8xpdxfgg5y3v+KyCK5inM8LpP1j5gIRwIB
	 wzRI2c/ctXsdYOGcOgwxevTi2j+SSewuoQ+c8EBMTGAYEbBf5W771V9WsGfpFAx29X+av
	 C5bDoD5h1wyM1p9oEPLxzUn16fsZ1C/Yk5v13fwd48/lVzeHvczmRDlXk6RUNmpwCk0zN
	 UNW0EuWQpwoJ9S+JzzeBf9f5fMC0DQdN+hSnMi2463Yd7kTkmli97YQKGuk4RPk6dxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=uCkjDFcp;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F85606A329
	for <asahi@lists.linux.dev>; Wed,  4 Nov 2026 16:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6F85606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=uCkjDFcp
Date: Wed, 4 Nov 2026 17:47:20 +0100
X-Lima-ML-UUID: 1fb7ae95-0ae2-4b9e-9cfd-6a995782d75f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793810843;
	bh=+Mmd9iz+6l+RtzunqHn07DyKAk1sZGUOJe891sWi+Nc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uCkjDFcpV18IotsW2/mO8QwbUqz2kruKoz/mzn/mqm97aaG+9qIqQQTJxN136PzNd
	 1yLb/GTpobe0/76DBqk9c81b54TwUdcjye6wpIC1xwGCI/PdFT+W8fI91tr51/YV2Q
	 PDFyzzOvVF1PwGBr8m0eK8n9X3XuRxtIX6T1/ayXRqZ0ZFNIUCw3hh9sumtnWCeC9w
	 TmGfmORbv2YghVWGV8jV2SQ4FMN3DDwFIslRU2jhBYYkVLKi0KUEuqqkfg55xVjUcl
	 T/MQzMKJPsPBMDNbM2oFTn0QfyBYfjRAxOdj0IzHaPxbRU/wVWoMBbcaKllNCyqKwk
	 iXxxy/T5aREFQ==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: marcel@holtmann.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, sven@kernel.org, j@jannau.net,
 neal@gompa.dev, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 66ton99@gmail.com,
 josemiguelo.ochoa@gmail.com, aditya.garg@linux.dev, Yossef Osman
 <Yossef.Osman@proton.me>
Subject: Re: [PATCH 2/4] Bluetooth: btbcm: clear vendor bits in LE
 advertising report types
Message-ID: <20261104174720.254b7e00@kait2en-mbp15-1>
In-Reply-To: <CABBYNZLwMW68WYBVp=-R=4Mji+-Q5AEtrcu5F_7rRYju8d-XNA@mail.gmail.com>
References: <20261104151601.70493-1-dev@deq.rocks>
	<20261104151601.70493-3-dev@deq.rocks>
	<CABBYNZLMVso40XpULwTwBwAE4tpXndSJMKhmoVLrmgm+unBNCA@mail.gmail.com>
	<20261104164647.5e9351cb@kait2en-mbp15-1>
	<CABBYNZLwMW68WYBVp=-R=4Mji+-Q5AEtrcu5F_7rRYju8d-XNA@mail.gmail.com>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Nov 2026 11:29:11 -0500
Luiz Augusto von Dentz <luiz.dentz@gmail.com> wrote:

> Yes that would work. That said, I don't think it is worth adding a
> quirk for this. Masking the reserved bits shouldn't cause any side
> effects afaik, well except if those bits are later adopted by
> Bluetooth SIG. Then these controllers would become
> non-compliant=E2=80=94though they already are, as the bits are reserved a=
nd
> not in use. In that case we would probably require a quirk to avoid a
> conflict. So, is that what you are trying to fix?

No, nothing concrete beyond the scope, and I agree it is harmless as
long as the bits stay reserved. We only put it in the drivers because
our downstream ships driver modules through DKMS and not bluetooth.ko,
which let many users test it quickly. Let's keep 88397423671f as it
is then. I'll drop patch 2 and 3 and send a v2 with patch 1 and 4.
